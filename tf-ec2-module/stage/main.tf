module "vpc" {
  source = "../module/vpc"
  vpc_cidr = local.vpc_cidr
  company_name = local.company_name
  server_env = local.server_env
}

module "subnets" {
  source = "../module/subnets"
  vpc_id = module.vpc.vpc_id

  company_name = local.company_name
  server_env = local.server_env
  elb_cidr = local.elb_cidr
  dmz_cidr = local.dmz_cidr
  ap_cidr = local.ap_cidr
  db_cidr = local.db_cidr
}

module "routingTable" {
  source = "../module/routeTable"
  vpc_id = module.vpc.vpc_id
  igw = module.vpc.igw
  dmz_subnet_id = module.subnets.dmz_subnet_id
  elb_subnet_id = module.subnets.elb_subnet_id
  ap_subnet_id = module.subnets.ap_subnet_id
  db_subnet_id = module.subnets.db_subnet_id
  natgw_az1 = module.gateway.natgw_az1

  company_name = local.company_name
  server_env = local.server_env
}

module "gateway" {
  source = "../module/gw"
  igw = module.vpc.igw
  dmz_subnet_id = module.subnets.dmz_subnet_id

  company_name = local.company_name
  server_env = local.server_env
}

module "ec2" {
  source = "../module/ec2"
  ap_subnet_id = module.subnets.ap_subnet_id
  dmz_subnet_id = module.subnets.dmz_subnet_id
  dmz_subnet = module.subnets.dmz_subnet
  vpc_id = module.vpc.vpc_id
  company_name = local.company_name
  server_env = local.server_env
}
