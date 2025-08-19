# Basic CloudWatch Log Group
resource "aws_cloudwatch_log_group" "app_logs" {
  name              = "/aws/application/${local.name_prefix}"
  retention_in_days = var.log_retention_days

  tags = local.common_tags
}