resource "aws_iam_role" "static_build_role" {
  name = "static_build_role"
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Principal = {
          Service = "codebuild.amazonaws.com"
        }
      },
    ]
  })

  inline_policy {
    name = "all-s3"
    policy = jsonencode({
      Version = "2012-10-17"
      Statement = [
        {
          Action   = ["s3:*"]
          Effect   = "Allow"
          Resource = ["arn:aws:s3:::*", "arn:aws:s3:::*/*"]
        }
      ]
    })
  }
}