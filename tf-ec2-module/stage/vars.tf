variable "company_tag" {
  description = "company name"
  default = "lim"
}

variable "server_env" {
  description = "server environment"
  default = "test"
}

variable "vpc_cidr" {
  description = "VPC CIDR BLOCK : x.x.x.x/x"
  default     = "10.10.0.0/16"
}

variable "elb_cidr" {
  description = "elb CIDR BLOCK : x.x.x.x/x"
  type        = list(string)
  default     = ["10.10.0.0/20", "10.10.16.0/20"]
}

variable "dmz_cidr" {
  description = "dmz CIDR BLOCK : x.x.x.x/x"
  type        = list(string)
  default     = ["10.10.32.0/20", "10.10.48.0/20"]
}

variable "ap_cidr" {
  description = "ap CIDR BLOCK : x.x.x.x/x"
  type        = list(string)
  default     = ["10.10.64.0/20", "10.10.80.0/20"]
}

variable "db_cidr" {
  description = "db CIDR BLOCK : x.x.x.x/x"
  type        = list(string)
  default     = ["10.10.96.0/20", "10.10.112.0/20"]
}

variable "region_tfc" {
  description = "region"
}

locals {
  company_name  = var.company_tag
  server_env    = var.server_env
  vpc_cidr      = var.vpc_cidr
  elb_cidr    = var.elb_cidr
  dmz_cidr    = var.dmz_cidr
  ap_cidr     = var.ap_cidr
  db_cidr     = var.db_cidr
  region_tfc  = var.region_tfc
}