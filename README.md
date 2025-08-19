/*
# terraform-aws-landing-zone

A minimal, production-ready AWS landing zone module following HashiCorp's best practices.

## Features

- **Multi-AZ VPC** with public/private subnets
- **Security Groups** for web and internal traffic
- **S3 Bucket** with encryption, versioning, and lifecycle policies
- **IAM Role** and instance profile for EC2 instances
- **CloudWatch** logging and VPC flow logs
- **High Availability** with NAT gateways in each AZ

## Usage

```hcl
module "landing_zone" {
  source = "git::https://github.com/glimpsovstar/terraform-aws-landing-zone.git?ref=v1.0.0"
  
  project_name = "my-app"
  environment  = "production"
  region       = "ap-southeast-1"
}
```

## Requirements

| Name | Version |
|------|---------|
| terraform | >= 1.0 |
| aws | ~> 5.0 |
| random | ~> 3.1 |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| environment | Environment name | `string` | `"dev"` | no |
| project_name | Name of the project | `string` | `"my-project"` | no |
| region | AWS region | `string` | `"us-west-2"` | no |
| vpc_cidr | CIDR block for VPC | `string` | `"10.0.0.0/16"` | no |
| log_retention_days | CloudWatch log retention | `number` | `30` | no |

## Outputs

| Name | Description |
|------|-------------|
| vpc_id | ID of the VPC |
| private_subnet_ids | IDs of private subnets |
| public_subnet_ids | IDs of public subnets |
| web_security_group_id | Web security group ID |
| app_bucket_name | S3 bucket name |
| ec2_instance_profile_name | EC2 instance profile name |

## File Structure

```
terraform-aws-landing-zone/
├── versions.tf          # Provider requirements
├── variables.tf         # Input variables  
├── locals.tf           # Local values
├── data.tf             # Data sources
├── main.tf             # VPC and networking
├── security.tf         # Security groups
├── storage.tf          # S3 configuration
├── iam.tf              # IAM resources
├── monitoring.tf       # CloudWatch resources
├── outputs.tf          # Outputs
└── examples/
    └── complete/
        ├── main.tf
        └── outputs.tf
```
*/
