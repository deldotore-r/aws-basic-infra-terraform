terraform {
  required_version = ">= 1.8.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
  backend "local" {} # futuramente migrar para S3 + DynamoDB
}

provider "aws" {
  region  = var.aws_region
  profile = var.aws_profile
}
