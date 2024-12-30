output "vpc_id" {
  value = aws_vpc.ddk_vpc.id
}

output "subnet_id" {
  value = aws_subnet.ddk_subnet_1.id
}
