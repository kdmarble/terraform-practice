variable "env" {
  description = "Deployment environment"
  default     = "dev"
}

variable "region" {
  description = "AWS Region"
  default     = "us-west-2"
}

variable "repository_branch" {
  description = "Repo branch to connect to"
  default     = "main"
}

variable "repository_owner" {
  description = "GitHub repository owner"
  default     = "kdmarble"
}

variable "repository_name" {
  description = "GitHub repository name"
  default     = "terraform-practice"
}

variable "static_web_bucket_name" {
  description = "S3 Bucket to deploy to"
  default     = "static-web-example-bucket"
}

variable "artifacts_bucket_name" {
  description = "S3 Bucket for storing artifacts"
  default     = "artifacts-bucket"
}