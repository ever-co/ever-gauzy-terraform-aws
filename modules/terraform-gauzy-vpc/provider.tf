terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 5.38"
    }
  }
}

provider "aws" {
  region = var.region
}
