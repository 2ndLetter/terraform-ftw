# terraform-ftw

## To Do:
- [x] Learn Terraform basics (Courses/Blogs/Tutorials)
- [x] Automate lab initialization
- [x] Bootstrap AWS account with Terraform Remote State management via CloudFormation
- [x] Learn how to use Local Terraform Modules
- [ ] Build out module folder structure
- [ ] Read AWS VPC Module documentation to figure out how to use

---

## Modules:
- [ ] network:
  - [ ] VPC
  - [ ] NACLs
  - [ ] SGs
  - [ ] IGW
  
- [ ] routing
  - [ ] Route53
  - [ ] Route Tables

- [ ] Application:
  - [ ] ALB
  - [ ] ASG
  - [ ] Launch Configs

- [ ] Storage:
  - [ ] S3 Buckets
  
- [ ] Security:
  - [ ] IAM

---

## Notes:
- [ ] New VPC through multi-region application
- [ ] Architecture Diagram (Graph)
- [ ] Video of the deployment?
- [ ] PDF of the deployment?
- [ ] Output from tree command

---

## Techonology Used:

- [ ] Hashicorp Terraform
- [ ] Hashicorp Packer
- [ ] Terragrunt?
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

---

## Terraform Concepts:
- [ ] Best Practices
- [x] Remote Backend ( State locking | Consistency | Encrypted )
- [ ] DRY (Don't Repeate Yourself) ( Modules | Input/Output Vars )
- [ ] Conditionals
- [ ] Variables (types: primitive/complex)
- [ ] Constrains (Type & Version)
- [ ] Meta-Arguments
- [ ] Provisioners ( Ansible | Chef | Puppet )
- [ ] Separate environments ( dev | prod )
- [ ] Modules ( Root/Child | Local Path)
  - [ ] Group resources logically
  - [ ] Expose inputs/outputs
  - [ ] Useful defaults
- [ ] null_resource
- [ ] Secrets Management (Sensitive data)
- [ ] Functions
- [ ] Expressions
- [ ] Testing ( Terratest | Terraform-compliance )
