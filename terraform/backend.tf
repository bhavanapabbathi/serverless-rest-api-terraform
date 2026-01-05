#terraform {
#  backend "s3" {
#    bucket         = "bhavana-terraform-state-bucket"   # change name
#    key            = "serverless/terraform.tfstate"
#    region         = "us-east-1"
#    dynamodb_table = "terraform-lock"
#    encrypt        = true
#  }
#}
