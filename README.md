# terraform-ftw

### Notes:
- [ ] New VPC through multi-region application
- [ ] Architecture Diagram (Graph)
- [ ] Video of the deployment?
- [ ] PDF of the deployment?

### Techonology Used:

- [ ] Hashicorp Terraform
- [ ] Hashicorp Packer
- [ ] AWS
  - [ ] Route53 (Multi-Region)
  - [ ] VPC ( Routes | NACLs )
  - [ ] EC2 ( ELB | ASGs | Launch Configs | SGs )
  - [ ] S3
  - [ ] ACM
  - [ ] IAM
  - [ ] CloudFormation
- [ ] Ansible
- [ ] Chef

- [ ] GitHub Actions?

### Terraform Concepts:
- [ ] Best Practices
- [ ] Remote Backend (encrypted)
- [ ] DRY (Don't Repeate Yourself)
- [ ] Conditionals
- [ ] Variables (types: primitive/complex)
- [ ] Constrains (Type & Version)
- [ ] Meta-Arguments
- [ ] Provisioners ( Ansible | Chef | Puppet )
- [ ] Separate environments ( dev | test | prod )
- [ ] Modules ( Root/Child | Local Path)
  - [ ] Group resources logically
  - [ ] Expose inputs/outputs
  - [ ] Useful defaults
- [ ] null_resource
- [ ] Secrets Management (Sensitive data)
- [ ] Functions
- [ ] Expressions
- [ ] Testing ( Terratest | Kitchen-Terraform | Terraform-compliance )