#!/bin/bash -e

while getopts 'dic' OPTION; do
  case "$OPTION" in
    d)
      argD="delete_lab"
      ;;
    i)
      argI="init_lab"
      ;;
    c)
      argC="cleanup_dir"
      ;;
    ?)
      echo "Usage: $(basename $0) [-d] [-i] [-c]"
  esac
done

delete_lab() {    
    printf "Return S3 bucket name\n"
    S3_BUCKET=$(aws cloudformation list-exports \
      --query "Exports[?Name=='cfn-stack-tf-ftw-TFStateBucket'].Value" \
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
      --query "StackSummaries[?StackName=='cfn-stack-tf-ftw'].StackId" \
      --output text)
    aws cloudformation delete-stack --stack-name cfn-stack-tf-ftw
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
    
    printf "Running cleaup_dir function\n"
    cleanup_dir
    
    printf "CFN Stack Deletion Complete!\n"
}

init_lab() {
    printf "Initialize the lab\n"
    cleanup_dir
    
    printf "Deploying CFN Stack\n"
    cloudformation/scripts/cfn-deploy.sh -n tf-ftw

    printf "Copying backend.hcl files to each environment"
    cp source_templates/backend_template.hcl environments/dev/backend.hcl
    cp source_templates/backend_template.hcl environments/prod/backend.hcl
    
    printf "Populating backend files with s3 bucket name\n"
    find . -name backend.hcl -exec sed -i "s/S3_BUCKET_NAME/$(aws cloudformation list-exports \
      --query "Exports[?Name=='cfn-stack-tf-ftw-TFStateBucket'].Value" \
      --output text)/" {} \;
}

cleanup_dir() {
    printf "Deleting files to clean up the working directory\n"
    set +e
    find . -name .terraform -exec rm -fr {} \;
    find . -name .terraform.lock.hcl -exec rm -fr {} \;
    find . -name terraform.tfstate -exec rm -fr {} \;

    printf "Deleting backend files\n"
    rm -fr environments/dev/backend.hcl
    rm -fr environments/prod/backend.hcl
    set -e
}

if [ -z $1 ]
then
  echo "Error, this script requires the -d, -i, or -c flags to execute!"
  exit 1
fi

$argC
$argD
$argI
