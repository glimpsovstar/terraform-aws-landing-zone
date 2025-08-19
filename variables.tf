# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

variable "project_name" {
  description = "Unique name to assign to project resources"
  type        = string
}

variable "environment" {
  description = "Environment name (dev, staging, prod)"
  type        = string
  validation {
    condition     = contains(["dev", "staging", "prod"], var.environment)
    error_message = "Environment must be one of: dev, staging, prod."
  }
}

variable "region" {
  description = "AWS region to deploy resources"
  type        = string
}

variable "vpc_cidr" {
  description = "VPC CIDR Block - Network address space for your VPC"
  type        = string
}

variable "instance_count" {
  description = "Number of instances to create"
  type        = number
}

variable "availability_zones" {
  description = "List of availability zones"
  type        = list(string)
}

variable "tags" {
  description = "Map of tags to apply to resources"
  type        = map(string)
}

variable "enable_nat_gateway" {
  description = "Enable NAT Gateway for private subnet internet access"
  type        = string
  validation {
    condition     = contains(["true", "false"], var.enable_nat_gateway)
    error_message = "Enable NAT Gateway must be either 'true' or 'false'."
  }
}

variable "log_retention_days" {
  description = "Log Retention - Number of days to keep CloudWatch logs"
  type        = number
  default     = 30
}
