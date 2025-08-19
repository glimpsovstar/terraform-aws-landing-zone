# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

provider "aws" {
  region = var.region
}

provider "random" {}

data "aws_availability_zones" "available" {}

resource "random_pet" "random" {}

resource "null_resource" "test" {
  triggers = {
    project_name = var.project_name
    environment  = var.environment
    region       = var.region
  }
}
