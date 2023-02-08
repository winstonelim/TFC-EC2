variable "company_name" {}

variable "server_env" {}

variable "vpc_id" {}

variable "ap_subnet_id" {}

variable "dmz_subnet_id" {}

variable "dmz_subnet" {}

locals {
  company_name = var.company_name
  server_env = var.server_env
  vpc_id = var.vpc_id
  ap_subnet_id = var.ap_subnet_id
  dmz_subnet_id = var.dmz_subnet_id
  dmz_subnet = var.dmz_subnet
}