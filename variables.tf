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
}

variable "vpc_cidr" {
  description = "VPC CIDR Block - Network address space for your VPC"
  type        = string
}

variable "enable_nat_gateway" {
  description = "NAT Gateway - Enable NAT Gateway for private subnet internet access"
  type        = bool
}

variable "log_retention_days" {
  description = "Log Retention - Number of days to keep CloudWatch logs"
  type        = number
  default     = 30
}
