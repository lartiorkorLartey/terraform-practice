resource "aws_s3_bucket" "s3_bucket" {
  bucket              = var.bucket_name
  object_lock_enabled = true

  tags = {
    Name = var.bucket_name
  }
}

resource "aws_s3_bucket_acl" "bucket_acl" {
  bucket     = aws_s3_bucket.s3_bucket.id
  acl        = "private"
  depends_on = [aws_s3_bucket_ownership_controls.s3_bucket_acl_ownership]
}

resource "aws_s3_bucket_ownership_controls" "s3_bucket_acl_ownership" {
  bucket = aws_s3_bucket.s3_bucket.id
  rule {
    object_ownership = "BucketOwnerPreferred"
  }
}

resource "aws_s3_bucket_versioning" "bucket_versioning" {
  bucket = aws_s3_bucket.s3_bucket.id

  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_s3_bucket_object_lock_configuration" "object_lock_config" {
  bucket = aws_s3_bucket.s3_bucket.bucket

  rule {
    default_retention {
      mode = "GOVERNANCE"
      days = 100
    }
  }
}

resource "aws_kms_key" "kms_key" {
  description             = "kms encryption key"
  deletion_window_in_days = 10
}

resource "aws_s3_bucket_server_side_encryption_configuration" "bucket_encryption" {
  bucket = aws_s3_bucket.s3_bucket.id

  rule {
    bucket_key_enabled = true
  }
}
