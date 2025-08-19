locals {
  name_prefix = "${var.project_name}-${var.environment}"
  
  common_tags = merge(
    {
      Environment = var.environment
      Project     = var.project_name
      ManagedBy   = "terraform"
      CreatedBy   = "terraform-aws-landing-zone"
    },
    var.tags
  )
  
  azs = data.aws_availability_zones.available.names
}