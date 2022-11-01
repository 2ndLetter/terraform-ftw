# terraform-ftw

*The purpose of this **unfinished** repository is to document my Terraform journey, and nerd-out!*

## Network Module Usage (Dev)

```hcl
module "network" {
  source = "../../modules/network"

  cidr     = "10.0.0.0/24"
  priv_sub = "10.0.0.0/27"
  pub_sub  = "10.0.0.32/27"
  project  = "tf-ftw"
  env      = "dev"
}
```

## Network Module Usage (Prod)

```hcl
module "network" {
  source = "../../modules/network"

  cidr     = "10.0.1.0/24"
  priv_sub = "10.0.1.0/27"
  pub_sub  = "10.0.1.32/27"
  project  = "tf-ftw"
  env      = "prod"
}
```

## To Do:
- [x] Learn Terraform basics (Courses/Blogs/Tutorials)
  - [x] Links to study material found at the bottom of this README.md
  - [x] Learn how to keep my TF IaC DRY
  - [x] Learn how to use Local Terraform Modules
- [x] Automate lab initialization (init_lab.sh)
- [x] Bootstrap AWS account with Terraform Remote State management via CloudFormation
- [x] Design module folder structure
- [x] Add instructions for the script
- [x] Build out network module:
  - [x] VPC
  - [x] Subnets
  - [x] Route Tables
  - [x] Routes
  - [x] NACLs
  - [x] Nat GW
  - [x] IGW
  - [x] Pimp out the README.md with module usage ([Example](https://github.com/terraform-aws-modules/terraform-aws-vpc/blob/master/README.md))
  - [x] Test deploying Dev and Prod
- [ ] Build out storage module:
  - [ ] S3 Bucket
- [ ] Build out security module:
  - [ ] IAM Role (Instance Profile)
- [ ] Build out application module:
  - [ ] ALB
  - [ ] ASG
  - [ ] SGs
  - [ ] Launch Configs
- [ ] Build out dns module
  - [ ] Route53

---

## Lessons Learned:
- [x] Using `terraform fmt --check` helps learning proper HCL standards
- [x] Child Module Outputs: `module.<MODULE_NAME>.<OUTPUT_NAME>`
- [x] Root Module Outputs:  `aws_<TYPE>.<NAME>.<ATTRIBUTE>`
- [x] Terraform's level of maturity is impressive!

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

---

## Notes:
- [ ] New VPC through multi-region application
- [ ] Architecture Diagram (Graph)
- [ ] Video of the deployment?
- [ ] PDF of the deployment?
- [ ] Output from tree command

---

## Study Material:
- [x] [Hashicorp Certified Terraform Associate](https://learn.acloud.guru/course/hashicorp-certified-terraform-associate-1/overview)
- [x] 
- [x] 
- [x] 
- [x] 
- [x] 
