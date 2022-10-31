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

output "subnet_private_id" {
  value       = module.network.subnet_private_id
  description = "Private subnet ID"
}

output "route_table_private_id" {
  value       = module.network.route_table_private_id
  description = "Private route table ID"
}

output "route_table_assoc_private" {
  value       = module.network.route_table_assoc_private_id
  description = "Private route table association"
}



output "subnet_public_id" {
  value       = module.network.subnet_public_id
  description = "Public subnet ID"
}