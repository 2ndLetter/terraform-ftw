output "vpc_id" {
  value       = module.network.vpc_id
  description = "VPC ID"
}

#output "vpc_rt_table_id" {
#  value       = module.network.vpc_rt_table_id
#  description = "Route Table ID"
#}

output "vpc_nacl_id" {
  value       = module.network.vpc_nacl_id
  description = "NACL ID"
}

output "subnet_private" {
  value       = module.network.subnet_private
  description = "Private subnet ID"
}

output "subnet_public" {
  value       = module.network.subnet_public
  description = "Public subnet ID"
}