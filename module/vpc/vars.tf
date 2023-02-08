variable "company_name" {}

variable "server_env" {}

variable "vpc_cidr" {}

locals {
  company_name = var.company_name
  vpc_cidr = var.vpc_cidr
  server_env = var.server_env
}