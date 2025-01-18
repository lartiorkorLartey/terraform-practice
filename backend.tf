terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.82"
    }
  }

  required_version = ">= 1.2.0"

  backend "s3" {
    bucket         = "dodokpo-tf-state-bucket"
    key            = "terraform/statefile/terraform.tfstate"
    region         = "eu-west-1"
    dynamodb_table = "dodokpo-tf-lock-files"
    encrypt        = true
  }
}

provider "aws" {
  region     = "eu-west-1"
  access_key = var.aws_access_key_id
  secret_key = var.aws_access_key
}
