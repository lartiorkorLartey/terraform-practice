resource "aws_s3_bucket" "ddk_bucket" {
  bucket = var.s3_bucket

  tags = {
    Name        = var.bucket_name
    Environment = var.s3_environment
  }
}
