terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "6.8.0"
    }
  }
   backend "s3" {
    bucket = "aws-bucket-100-1256"
    key = "terraform.tfstate"
    region = "ap-south-1"
    encrypt = true      
    dynamodb_table = "New-table"

  }
  
}