variable "company_name" {}

variable "server_env" {}

variable "dmz_subnet_id" {}

variable "igw" {}

locals {
  company_name = var.company_name
  server_env = var.server_env
  dmz_subnet_id = var.dmz_subnet_id
  igw = var.igw
}