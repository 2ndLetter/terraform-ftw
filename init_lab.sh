#!/bin/bash -e

while getopts 'di' OPTION; do
  case "$OPTION" in
    d)
      argD="delete_lab"
      ;;
    i)
      argI="init_lab"
      ;;
    ?)
      echo "Usage: $(basename $0) [-i] [-d]"
  esac
done

delete_lab() {    
    printf "Return S3 bucket name\n"
    S3_BUCKET=$(aws cloudformation list-exports \
      --query "Exports[?Name=='cfn-stack-tf-prep-TFStateBucket'].Value" \
      --output text)
    
    printf "Empty the s3 bucket\n"
    set +e
    aws s3api delete-objects --bucket $S3_BUCKET \
      --delete "$(aws s3api list-object-versions \
      --bucket $S3_BUCKET --output=json \
      --query='{Objects: Versions[].{Key:Key,VersionId:VersionId}}')"
    set -e
    
    printf "Delete CFN Stack\n"
    CFN_STACK_ID=$(aws cloudformation list-stacks \
      --stack-status-filter CREATE_COMPLETE \
      --query "StackSummaries[?StackName=='cfn-stack-tf-prep'].StackId" \
      --output text)
    aws cloudformation delete-stack --stack-name cfn-stack-tf-prep
    CFN_STACK_STATUS=$(aws cloudformation list-stacks \
      --query "StackSummaries[?StackId=='$CFN_STACK_ID'].StackStatus" \
      --output text)
    
    printf "Waiting for CFN Stack to Delete\n"
    until [ $CFN_STACK_STATUS == "DELETE_COMPLETE" ]
    do
      CFN_STACK_STATUS=$(aws cloudformation list-stacks \
        --query "StackSummaries[?StackId=='$CFN_STACK_ID'].StackStatus" \
        --output text)
      printf "CFN Stack Status is $CFN_STACK_STATUS, sleep 5s\n"
      sleep 5
      if [ "$CFN_STACK_STATUS" == "DELETE_FAILED" ]
      then
        printf "DELETION FAILED, CHECK CFN DASHBOARD!\n"
        exit 1
      fi
    done
    printf "CFN Stack Deletion Complete!\n"
}

init_lab() {
    printf "Deleting files to initialize the working directory\n"
    rm -fr .terraform backend.tf .terraform.lock.hcl
    
    printf "Deploying CFN Stack\n"
    scripts/cfn-deploy.sh -n tf-prep
    
    printf "Copying source template to destination\n"
    cp source_templates/backend_template.tf backend.tf
    
    printf "Populating backend.tf file with value(s)\n"
    sed -i "s/S3_BUCKET_NAME/$(aws cloudformation list-exports \
      --query "Exports[?Name=='cfn-stack-tf-prep-TFStateBucket'].Value" \
      --output text)/" backend.tf
}

if [ -z $1 ]
then
  echo "Error, this script requires the -i and/or -d flags to execute!"
  exit 1
fi

$argD
$argI
