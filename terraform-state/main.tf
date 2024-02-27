terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}

resource "aws_s3_bucket" "ever_gauzy_remote_state" {
  bucket = "ever-gauzy-terraform-s3"
}

resource "aws_dynamodb_table" "ever_gauzy_remote_state" {
  name           = "ever-gauzy-terraform-dynamo"
  billing_mode   = "PROVISIONED"
  read_capacity  = 1
  write_capacity = 1
  hash_key       = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }
}
