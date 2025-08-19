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
