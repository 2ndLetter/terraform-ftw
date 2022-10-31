output "vpc_id" {
  value = aws_vpc.this.id
  description = "VPC ID"
}

output "vpc_nacl_id" {
  value       = aws_vpc.this.default_network_acl_id
  description = "NACL ID"
}

output "subnet_private" {
  value       = aws_subnet.private.id
  description = "Private subnet ID"
}

output "subnet_public" {
  value       = aws_subnet.public.id
  description = "Public subnet ID"
}