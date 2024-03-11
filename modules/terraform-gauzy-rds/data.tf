# data "terraform_remote_state" "vpc" {
#   backend = "s3"
#   config = {
#     bucket         = "ever-gauzy-terraform-s3"
#     key            = "terraform-gauzy-vpc.tfstate"
#     region         = "us-east-1"
#     dynamodb_table = "ever-gauzy-terraform-dynamo"
#   }
# }
