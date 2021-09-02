resource "aws_s3_bucket" "artifacts-bucket" {
  bucket = "artifacts-bucket"
  acl    = "public-read-write"

  tags = {
    Environment = var.env
  }
}