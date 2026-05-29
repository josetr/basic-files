terraform {
  required_version = ">= 1.7.0"
}

variable "environment" {
  type    = string
  default = "dev"
}

locals {
  tags = {
    app = "basic-files"
    env = var.environment
  }
}

output "tags" {
  value = local.tags
}
