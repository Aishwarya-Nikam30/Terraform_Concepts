terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "6.0.0"
    }
  }

  backend "s3" {                                  #for state locking
    bucket         = "my-s3-bucket30"
    key            = "terraform.tfstate"
    region         = "eu-west-2"
    dynamodb_table = "my-dynamodb-1"
  }
}