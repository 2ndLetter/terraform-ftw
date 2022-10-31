# terraform-ftw

*The purpose of this repository is to document my Terraform journey, as well as display my current level of expertise.*

## To Do:
- [x] Learn Terraform basics (Courses/Blogs/Tutorials)
  - [x] Learn how to keep my TF IaC DRY
  - [x] Learn how to use Local Terraform Modules
- [x] Automate lab initialization
- [x] Bootstrap AWS account with Terraform Remote State management via CloudFormation
- [x] Build out module folder structure
- [ ] Build out network module:
  - [x] VPC
  - [x] Subnets
  - [x] Route Tables
  - [x] Routes
  - [x] NACLs
  - [x] Nat Gateway
  - [x] IGW
- [ ] Add instructions to the scripts

- [ ] Read AWS VPC Module documentation to figure out how to use

---

## Lessons Learned:
- [x] Using `terraform fmt --check` helps learning proper HCL standards

---

## Modules:
- [ ] application:
  - [ ] ALB
  - [ ] ASG
  - [ ] SGs
  - [ ] Launch Configs

- [ ] network:
  - [ ] VPC
  - [ ] NACLs
  - [ ] IGW
  
- [ ] routing
  - [ ] Route53
  - [ ] Route Tables

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

- [x] Hashicorp Terraform
- [ ] Hashicorp Packer
- [ ] Terragrunt?
- [ ] AWS
  - [ ] Route53 (Multi-Region)
  - [x] VPC ( Routes | NACLs )
  - [ ] EC2 ( ELB | ASGs | Launch Configs | SGs )
  - [x] S3
  - [ ] ACM
  - [ ] IAM
  - [x] CloudFormation
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
