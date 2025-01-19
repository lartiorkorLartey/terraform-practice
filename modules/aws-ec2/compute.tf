resource "aws_instance" "ec2_instance" {
  ami                         = var.ami_id
  instance_type               = var.instance_type
  subnet_id                   = var.subnet_id
  associate_public_ip_address = true
  vpc_security_group_ids      = [var.security_group]
  iam_instance_profile        = var.instance_profile
  key_name                    = var.keypair_name

  root_block_device {
    volume_size           = var.volume_size
    delete_on_termination = true
  }

  tags = {
    Name = var.instance_name
  }
}

resource "aws_ec2_instance_metadata_defaults" "enforce_imdsv2" {
  http_tokens                 = "required"
  http_put_response_hop_limit = -1
}