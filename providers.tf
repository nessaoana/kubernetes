terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "6.10.0"
    }
    kubectl = {
      source  = "gavinbunney/kubectl"
      version = ">= 1.7.0"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
  region  = var.region_default
  profile = "default"
}