# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

variable "project_name" {
  description = "Unique name to assign to project resources"
  type        = string
}

variable "environment" {
  description = "Environment name - Type exactly: dev OR staging OR prod"
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
  description = "Number of instances to create (for future use)"
  type        = number
  default     = 2
}

variable "availability_zones" {
  description = "List of availability zones (leave empty to use first 2 AZs in region automatically)"
  type        = list(string)
  default     = []
}

variable "tags" {
  description = "Map of tags to apply to resources (optional - leave empty for default tags only)"
  type        = map(string)
  default     = {}
}

variable "enable_nat_gateway" {
  description = "Enable NAT Gateway - Type exactly: true OR false"
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
