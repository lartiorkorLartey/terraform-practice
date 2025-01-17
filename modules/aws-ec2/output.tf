# output "instance_id" {
#   value = aws_instance.ddk_ec2.id
# }

output "instance_name" {
  value = aws_instance.ec2_instance.tags
}
