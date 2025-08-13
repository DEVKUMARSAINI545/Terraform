terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "6.5.0"
    }
  }
  # backend "s3" {
  #    bucket = "myaws-bucket-1256"
  #   key = "terraform.tfstate"
  #   region = "ap-south-1"
  #   dynamodb_table = "tws-table"
  # }
}