# Example usage of the terraform-aws-landing-zone module
# In Terraform Cloud, the provider configuration will be managed by TFC

variable "region" {
  description = "AWS region"
  type        = string
  default     = "ap-southeast-1"
}

module "landing_zone" {
  source = "../../"
  
  project_name = "test-app"
  environment  = "dev"
  region       = var.region
}