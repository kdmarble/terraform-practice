resource "aws_codepipeline_webhook" "pipeline_webhook" {
  authentication  = "GITHUB_HMAC"
  name            = "pipeline-webhook"
  target_action   = "Source"
  target_pipeline = aws_codepipeline.static_web_pipeline.name

  authentication_configuration {
    secret_token = random_string.github_secret.result
  }

  filter {
    json_path    = "$.ref"
    match_equals = "refs/heads/{Branch}"
  }
}

resource "github_repository_webhook" "github_hook" {
  repository = var.repository_name
  events     = ["push"]

  configuration {
    url          = aws_codepipeline_webhook.pipeline_webhook.url
    insecure_ssl = "0"
    content_type = "json"
    secret       = random_string.github_secret.result
  }
}

resource "random_string" "github_secret" {
  length  = 99
  special = false
}