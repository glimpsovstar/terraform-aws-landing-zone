variable "environment" {
  description = "Environment name - Choose the deployment environment for your infrastructure"
  type        = string
  default     = "dev"
  
  validation {
    condition     = contains(["dev", "staging", "prod"], var.environment)
    error_message = "Environment must be one of: dev, staging, prod."
  }
}

variable "project_name" {
  description = "Project name - A unique identifier for your project (used in resource naming)"
  type        = string
  default     = "my-project"
  
  validation {
    condition     = can(regex("^[a-z0-9-]+$", var.project_name)) && length(var.project_name) >= 3 && length(var.project_name) <= 20
    error_message = "Project name must be 3-20 characters, lowercase letters, numbers, and hyphens only."
  }
}

variable "region" {
  description = "AWS Region - Select the AWS region where resources will be created"
  type        = string
  default     = "us-west-2"
  
  validation {
    condition = contains([
      "us-east-1", "us-east-2", "us-west-1", "us-west-2",
      "eu-west-1", "eu-west-2", "eu-west-3", "eu-central-1",
      "ap-southeast-1", "ap-southeast-2", "ap-northeast-1"
    ], var.region)
    error_message = "Region must be a valid AWS region."
  }
}

variable "vpc_cidr" {
  description = "VPC CIDR Block - Network address space for your VPC (e.g., 10.0.0.0/16)"
  type        = string
  default     = "10.0.0.0/16"
  
  validation {
    condition     = can(cidrhost(var.vpc_cidr, 0))
    error_message = "VPC CIDR must be a valid IPv4 CIDR block."
  }
}

variable "log_retention_days" {
  description = "Log Retention - Number of days to keep CloudWatch logs (7, 14, 30, 60, 90, 180, 365)"
  type        = number
  default     = 30
  
  validation {
    condition     = contains([1, 3, 5, 7, 14, 30, 60, 90, 120, 150, 180, 365, 400, 545, 731, 1827, 3653], var.log_retention_days)
    error_message = "Log retention days must be a valid CloudWatch retention period."
  }
}

# Additional variables for enhanced No-Code experience
variable "enable_nat_gateway" {
  description = "NAT Gateway - Enable NAT Gateway for private subnet internet access"
  type        = bool
  default     = true
}

variable "single_nat_gateway" {
  description = "Single NAT Gateway - Use one NAT Gateway for all AZs (cost optimization for non-prod)"
  type        = bool
  default     = false
}

variable "enable_flow_logs" {
  description = "VPC Flow Logs - Enable VPC Flow Logs for network monitoring"
  type        = bool
  default     = true
}

variable "tags" {
  description = "Additional Tags - Custom tags to apply to all resources"
  type        = map(string)
  default     = {}
}