data "aws_iam_policy_document" "codebuild-assume-role-policy" {
  statement {
    actions = ["sts:AssumeRole"]

    principals {
      type        = "Service"
      identifiers = ["codebuild.amazonaws.com"]
    }
  }
}

resource "aws_iam_role" "static_build_role" {
  name               = "static_build_role"
  path               = "/system/"
  assume_role_policy = data.aws_iam_policy_document.codebuild-assume-role-policy.json
}