data "terraform_remote_state" "eks" {
  backend = "s3"
  config = {
    bucket         = "ever-gauzy-terraform-s3"
    key            = "terraform-gauzy-eks.tfstate"
    region         = "us-east-1"
    dynamodb_table = "ever-gauzy-terraform-dynamo"
  }
}


data "terraform_remote_state" "rds" {
  backend = "s3" 
  config = {
    bucket         = "ever-gauzy-terraform-s3"
    key            = "terraform-gauzy-rds.tfstate"
    region         = "us-east-1"
    dynamodb_table = "ever-gauzy-terraform-dynamo"
  }
}
