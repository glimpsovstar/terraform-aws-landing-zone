# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

# No-Code Deployment Example
# This shows how the module would be configured in TFC No-Code interface

module "landing_zone_no_code" {
  source = "../../"
  
  # Required Configuration (user must provide in TFC form)
  project_name = "my-landing-zone"
  environment  = "dev"
  
  # Optional Configuration (pre-filled with defaults in TFC form)
  region              = "us-west-2"
  vpc_cidr           = "10.0.0.0/16"
  log_retention_days = 30
  
  # Feature Toggles (Boolean switches in TFC UI)
  enable_nat_gateway   = true
  single_nat_gateway   = false  # Set to true for cost optimization in dev
  enable_flow_logs     = true
  
  # Additional Tags (Key-value editor in TFC UI)
  tags = {
    "CostCenter" = "Engineering"
    "Owner"      = "DevOps Team"
    "Purpose"    = "Landing Zone Infrastructure"
    "Terraform"  = "true"
  }
}
