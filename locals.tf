locals {
  name_prefix = "${var.project_name}-${var.environment}"
  
  common_tags = {
    Environment = var.environment
    Project     = var.project_name
    ManagedBy   = "terraform"
    CreatedBy   = "terraform-aws-landing-zone"
  }
  
  azs = data.aws_availability_zones.available.names
}