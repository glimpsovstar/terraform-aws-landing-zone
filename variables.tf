# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

variable "project_name" {
  description = "Unique name to assign to project resources"
  type        = string
}

variable "environment" {
  description = "Environment name (dev, staging, prod)"
  type        = string
}

variable "region" {
  description = "AWS region to deploy resources"
  type        = string
  default     = "us-west-2"
}

variable "vpc_cidr" {
  description = "VPC CIDR Block - Network address space for your VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "enable_nat_gateway" {
  description = "NAT Gateway - Enable NAT Gateway for private subnet internet access"
  type        = bool
  default     = true
}

variable "log_retention_days" {
  description = "Log Retention - Number of days to keep CloudWatch logs"
  type        = number
  default     = 30
}
