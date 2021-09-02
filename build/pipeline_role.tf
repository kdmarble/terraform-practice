data "aws_iam_policy_document" "pipeline-assume-role-policy" {
  statement {
    actions = ["sts:AssumeRole"]

    principals {
      type        = "Service"
      identifiers = ["codepipeline.amazonaws.com"]
    }
  }
}

resource "aws_iam_role" "pipeline_role" {
  name               = "pipeline_role"
  path               = "/system/"
  assume_role_policy = data.aws_iam_policy_document.pipeline-assume-role-policy.json
}