terraform {
  backend "s3" {
    bucket         = "ever-gauzy-terraform-s3"
    key            = "terraform-gauzy-vpc.tfstate"
    region         = "us-east-1"
    dynamodb_table = "ever-gauzy-terraform-dynamo"
  }
}