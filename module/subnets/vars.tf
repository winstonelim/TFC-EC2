variable "company_name" {}

variable "server_env" {}

variable "vpc_id" {}

variable "elb_cidr" {}

variable "dmz_cidr" {}

variable "ap_cidr" {}

variable "db_cidr" {}

data "aws_availability_zones" "az" {
  state = "available"
}

locals {
  company_name = var.company_name
  server_env = var.server_env
  vpc_id = var.vpc_id
  elb_cidr = var.elb_cidr
  dmz_cidr = var.dmz_cidr
  ap_cidr = var.ap_cidr
  db_cidr = var.db_cidr
  zone_id_a = data.aws_availability_zones.az.names[0]
  zone_id_c = data.aws_availability_zones.az.names[2]
}