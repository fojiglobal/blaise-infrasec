terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
  backend "s3" {
  bucket = "blaise-cs2-terraform"
  key    = "staging/terraform.tfstate"
  region = "us-east-2"
  dynamodb_table = "blaise-infrasec-terraform"
}
}

# Configure the AWS Provider
provider "aws" {
  region = "us-east-2"
}

