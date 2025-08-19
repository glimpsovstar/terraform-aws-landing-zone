# Test configuration to validate module works correctly
# This should be run in a separate TFC workspace for testing

terraform {
  required_version = ">= 1.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

# Test the module with minimal configuration
module "test_landing_zone" {
  # Use the private registry reference once published
  # source = "app.terraform.io/YOUR_ORG/aws-landing-zone/aws"
  # version = "~> 1.1.0"
  
  # For now, use Git source for testing
  source = "git::https://github.com/glimpsovstar/terraform-aws-landing-zone.git?ref=v1.1.0"
  
  project_name = "test-lz"
  environment  = "dev"
  region       = "us-west-2"
  
  # Test cost optimization for dev environment
  single_nat_gateway = true
  enable_flow_logs   = false
  
  # Test custom tags
  tags = {
    "TestRun"   = "automated"
    "CreatedBy" = "tfc-test"
  }
}

# Test outputs
output "test_vpc_id" {
  description = "VPC ID from test deployment"
  value       = module.test_landing_zone.vpc_id
}

output "test_bucket_name" {
  description = "S3 bucket name from test deployment"
  value       = module.test_landing_zone.app_bucket_name
}
