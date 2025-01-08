# ec2
variable "instance_name" {}
variable "ami_id" {}
variable "instance_type" {}
variable "subnet_id" {}
variable "associate_public_ip" {}
variable "sec_grp" {}

# ebs
variable "ebs_volume" {}
variable "aws_az" {}
variable "volume_size" {}

# attachment
variable "device_name" {}