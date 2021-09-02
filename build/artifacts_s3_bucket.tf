resource "aws_s3_bucket" "artifacts-bucket" {
  bucket = var.artifacts_bucket_name
  acl    = "public-read-write"

  tags = {
    Environment = var.env
  }
}