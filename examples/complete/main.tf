# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

# Example usage of the terraform-aws-landing-zone module
# In Terraform Cloud, the provider configuration will be managed by TFC

variable "region" {
  description = "AWS region"
  default     = "ap-southeast-1"
}

module "landing_zone" {
  source = "../../"
  
  # Required variables
  project_name = "test-app"
  environment  = "dev"
  
  # Optional configuration
  region                = var.region
  vpc_cidr              = "10.0.0.0/16"
  log_retention_days    = 7
  enable_nat_gateway    = true
  single_nat_gateway    = false  # Use multiple NAT gateways for HA
  enable_flow_logs      = true
  
  # Custom tags
  tags = {
    "Owner"       = "DevOps Team"
    "CostCenter"  = "Engineering"
    "Environment" = "development"
  }
}