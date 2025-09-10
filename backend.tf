terraform {
  backend "s3" {
    bucket = "fiap-terraform-kubernetes"
    key    = "kubernetes/terraform.tfstate"
    region = "us-east-1"
  }
}