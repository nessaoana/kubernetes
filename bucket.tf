resource "aws_s3_bucket" "bucket-backend" {
  bucket = var.project_name
  tags = {
    Name        = var.project_name
    Environment = "dev"
  }
}