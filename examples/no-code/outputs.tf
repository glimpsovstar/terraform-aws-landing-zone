output "vpc_info" {
  description = "VPC information for No-Code deployment"
  value = {
    vpc_id         = module.landing_zone_no_code.vpc_id
    vpc_cidr       = module.landing_zone_no_code.vpc_cidr_block
    public_subnets = module.landing_zone_no_code.public_subnet_ids
    private_subnets = module.landing_zone_no_code.private_subnet_ids
  }
}

output "security_group_id" {
  description = "Web security group ID"
  value       = module.landing_zone_no_code.web_security_group_id
}

output "s3_bucket_name" {
  description = "Application S3 bucket name"
  value       = module.landing_zone_no_code.app_bucket_name
}
