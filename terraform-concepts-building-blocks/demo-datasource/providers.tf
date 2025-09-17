provider "aws" {
  region = var.AWS_REGION
}

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "6.12.0"
    }
  }
}