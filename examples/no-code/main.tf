# No-Code Deployment Example
# This shows how the module would be configured in TFC No-Code interface

module "landing_zone_no_code" {
  source = "../../"
  
  # Basic Configuration (Required fields in No-Code UI)
  project_name = "my-landing-zone"
  environment  = "dev"
  region       = "us-west-2"
  
  # Infrastructure Settings
  vpc_cidr = "10.0.0.0/16"
  
  # Optional Features (Toggle switches in UI)
  enable_nat_gateway   = true
  single_nat_gateway   = false  # Set to true for cost optimization in dev
  enable_flow_logs     = true
  
  # Monitoring
  log_retention_days = 30
  
  # Additional Tags (Key-value editor in UI)
  tags = {
    "CostCenter" = "Engineering"
    "Owner"      = "DevOps Team"
    "Purpose"    = "Landing Zone Infrastructure"
  }
}
