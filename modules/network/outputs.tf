output "vpc_id" {
  value = aws_vpc.this.id
  description = "VPC ID"
}

output "vpc_nacl_id" {
  value       = aws_vpc.this.default_network_acl_id
  description = "NACL ID"
}

output "subnet_private_id" {
  value       = aws_subnet.private.id
  description = "Private subnet ID"
}

output "route_table_private_id" {
  value       = aws_route_table.private.id
  description = "Private route table ID"
}

output "route_table_assoc_private_id" {
  value       = aws_route_table_association.private.id
  description = "Private route table association ID"
}

output "subnet_public_id" {
  value       = aws_subnet.public.id
  description = "Public subnet ID"
}

output "route_table_public_id" {
  value       = aws_route_table.public.id
  description = "Public route table ID"
}

output "route_table_assoc_public_id" {
  value       = aws_route_table_association.public.id
  description = "Public route table association ID"
}

output "internet_gateway_id" {
  value       = aws_internet_gateway.this.id
  description = "Internet Gateway ID"
}

output "nat_gateway_id" {
  value       = aws_nat_gateway.this.id
  description = "Nat Gateway ID"
}