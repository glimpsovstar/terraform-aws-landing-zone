# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

provider "aws" {
  region = var.region
}

provider "random" {}

data "aws_availability_zones" "available" {}

data "aws_caller_identity" "current" {}

# Local values
locals {
  name_prefix = "${var.project_name}-${var.environment}"
  
  common_tags = merge({
    Environment = var.environment
    Project     = var.project_name
    ManagedBy   = "terraform"
    CreatedBy   = "terraform-aws-landing-zone"
  }, var.tags)
  
  # Use availability_zones variable if provided, otherwise use data source
  azs = length(var.availability_zones) > 0 ? var.availability_zones : slice(local.azs, 0, 2)
}

# VPC with public and private subnets across 2 AZs
module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "~> 5.0"

  name = "${local.name_prefix}-vpc"
  cidr = var.vpc_cidr

  azs             = length(var.availability_zones) > 0 ? var.availability_zones : slice(local.azs, 0, 2)
  private_subnets = [
    cidrsubnet(var.vpc_cidr, 8, 1),
    cidrsubnet(var.vpc_cidr, 8, 2)
  ]
  public_subnets = [
    cidrsubnet(var.vpc_cidr, 8, 101),
    cidrsubnet(var.vpc_cidr, 8, 102)
  ]

  enable_nat_gateway     = var.enable_nat_gateway
  single_nat_gateway     = false
  enable_vpn_gateway     = false
  enable_dns_hostnames   = true
  enable_dns_support     = true

  # Enable flow logs
  enable_flow_log                      = true
  create_flow_log_cloudwatch_iam_role  = true
  create_flow_log_cloudwatch_log_group = true

  tags = local.common_tags
}

# Random ID for unique resource naming
resource "random_id" "bucket_suffix" {
  byte_length = 4
}
