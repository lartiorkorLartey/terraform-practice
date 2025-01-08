resource "aws_route53_zone" "primary" {
  name = var.zone_name
}

resource "aws_route53_record" "r53_record_1" {
  zone_id = aws_route53_zone.primary.zone_id
  name    = var.record_name
  type    = var.record_type
  ttl     = var.record_ttl
  #   records = [aws_eip.lb.public_ip]
  #   records = [aws_instance.ddk_ec2.public_ip]
  #   records = [module.ec2_instance.public_ip]
  records = [var.instance_ip]
}
