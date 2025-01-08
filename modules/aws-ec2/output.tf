output "instance_id" {
  value = aws_instance.ddk_ec2.id
}

output "public_instance_ip" {
  value = aws_instance.ddk_ec2.public_ip
}
