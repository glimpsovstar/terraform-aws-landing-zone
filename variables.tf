# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

variable "project_name" {
  description = "Unique name to assign to project resources"
}

variable "environment" {
  description = "Environment name (dev, staging, prod)"
}

variable "region" {
  description = "AWS region to deploy resources"
  default     = "us-west-2"
}

variable "vpc_cidr" {
  description = "VPC CIDR Block - Network address space for your VPC"
  default     = "10.0.0.0/16"
}

variable "log_retention_days" {
  description = "Log Retention - Number of days to keep CloudWatch logs"
  default     = 30
}

variable "enable_nat_gateway" {
  description = "NAT Gateway - Enable NAT Gateway for private subnet internet access"
  default     = true
}

variable "single_nat_gateway" {
  description = "Single NAT Gateway - Use one NAT Gateway for all AZs (cost optimization)"
  default     = false
}

variable "enable_flow_logs" {
  description = "VPC Flow Logs - Enable VPC Flow Logs for network monitoring"
  default     = true
}

variable "tags" {
  description = "Additional Tags - Custom tags to apply to all resources"
  default     = {}
}
