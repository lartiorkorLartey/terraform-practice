output "vpc_id" {
  value = aws_default_vpc.default.id
}

output "subnet_id" {
  value = data.aws_subnet.subnet.id
}

output "security_group" {
  value = aws_default_security_group.default_sg.id
}
