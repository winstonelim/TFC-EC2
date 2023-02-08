variable "company_name" {}

variable "server_env" {}

variable "vpc_id" {}

variable "igw" {}

variable "dmz_subnet_id" {}

variable "elb_subnet_id" {}

variable "ap_subnet_id" {}

variable "db_subnet_id" {}

variable "natgw_az1" {}

locals {
  company_name = var.company_name
  server_env = var.server_env
  vpc_id = var.vpc_id
  igw = var.igw
  dmz_subnet_id = var.dmz_subnet_id
  elb_subnet_id = var.elb_subnet_id
  ap_subnet_id = var.ap_subnet_id
  db_subnet_id = var.db_subnet_id
  natgw_az1 = var.natgw_az1
}