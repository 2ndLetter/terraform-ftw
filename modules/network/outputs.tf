output "vpc_id" {
  value = aws_vpc.this.id
  description = "VPC ID"
}

output "vpc_rt_table_id" {
  value       = aws_vpc.this.default_route_table_id
  description = "Route Table ID"
}

output "vpc_nacl_id" {
  value       = aws_vpc.this.default_network_acl_id
  description = "NACL ID"
}
 