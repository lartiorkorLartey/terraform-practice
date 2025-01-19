output "instance_id" {
  value = aws_instance.ec2_instance.id
}

output "instance_name" {
  value = aws_instance.ec2_instance.tags
}
