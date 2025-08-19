# Terraform Cloud Setup Guide

This document explains how to use this module with Terraform Cloud.

## Prerequisites

1. A Terraform Cloud account
2. An AWS account with appropriate permissions
3. This module published to a Git repository (GitHub, GitLab, etc.)

## Setting up Terraform Cloud Workspace

### 1. Create a New Workspace

1. Log into Terraform Cloud
2. Create a new workspace
3. Choose "Version control workflow"
4. Connect your VCS provider and select the repository containing your infrastructure code (not this module)

### 2. Configure Environment Variables

Set these environment variables in your TFC workspace:

#### AWS Credentials
- `AWS_ACCESS_KEY_ID` (sensitive)
- `AWS_SECRET_ACCESS_KEY` (sensitive)
- `AWS_DEFAULT_REGION` (optional)

#### Or use AWS IAM Roles (recommended)
- Enable "Use AWS IAM role for authentication"
- Configure the role ARN in your workspace settings

### 3. Configure Terraform Variables

Set these Terraform variables in your workspace:

- `project_name`: Your project name
- `environment`: Environment (dev/staging/prod)
- `region`: AWS region
- `vpc_cidr`: VPC CIDR block (optional)

## Example Configuration

In your infrastructure repository (separate from this module), create a `main.tf`:

```hcl
module "landing_zone" {
  source = "git::https://github.com/your-username/terraform-aws-landing-zone.git?ref=v1.0.0"
  
  project_name = var.project_name
  environment  = var.environment
  region       = var.region
  vpc_cidr     = var.vpc_cidr
}

# Define variables.tf
variable "project_name" {
  description = "Name of the project"
  type        = string
}

variable "environment" {
  description = "Environment name"
  type        = string
}

variable "region" {
  description = "AWS region"
  type        = string
}

variable "vpc_cidr" {
  description = "CIDR block for VPC"
  type        = string
  default     = "10.0.0.0/16"
}
```

## Best Practices for TFC

1. **Use Semantic Versioning**: Always reference specific versions of this module
2. **Environment Separation**: Create separate workspaces for dev/staging/prod
3. **Variable Management**: Use TFC's variable sets for shared configurations
4. **State Management**: Let TFC handle state files - never commit them
5. **Plan Reviews**: Enable plan reviews for production workspaces
6. **Auto-apply**: Only enable for non-production environments

## Troubleshooting

### Common Issues

1. **Permission Denied**: Ensure AWS credentials have sufficient permissions
2. **Module Not Found**: Verify the Git repository URL and version tag
3. **Resource Conflicts**: Check for existing resources with the same names

### Support

For issues with this module, please create an issue in the repository.
For Terraform Cloud issues, consult the [official documentation](https://www.terraform.io/docs/cloud).
