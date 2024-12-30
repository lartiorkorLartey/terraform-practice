resource "aws_instance" "ddk_ec2" {
  ami               = var.ami_id
  instance_type     = var.instance_type
  subnet_id         = var.subnet_id
  availability_zone = var.aws_az

  tags = {
    Name = var.instance_name
  }
}

resource "aws_ebs_volume" "ddk_ebs" {
  availability_zone = var.aws_az
  size              = var.volume_size

  tags = {
    Name = var.ebs_volume
  }
}

resource "aws_volume_attachment" "ebs_att" {
  device_name = var.device_name
  volume_id   = aws_ebs_volume.ddk_ebs.id
  instance_id = aws_instance.ddk_ec2.id
}
