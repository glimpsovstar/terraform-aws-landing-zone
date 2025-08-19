terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = var.region
}

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