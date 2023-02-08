resource "aws_subnet" "elb_subnet" {
  count = length(local.elb_cidr)
  vpc_id                  = local.vpc_id
  cidr_block              = element(local.elb_cidr,count.index)
  availability_zone       = ((count.index)%2)==0? local.zone_id_a : local.zone_id_c

  tags = { 
    Name = "${local.company_name}-elb-snet-${((count.index)%2)==0? "az1" : "az3"}"
  }
}

resource "aws_subnet" "dmz_subnet" {
  count = length(local.dmz_cidr)
  vpc_id                  = local.vpc_id
  cidr_block              = element(local.dmz_cidr,count.index)
  availability_zone       = ((count.index)%2)==0? local.zone_id_a : local.zone_id_c

  tags = { 
    Name = "${local.company_name}-dmz-snet-${((count.index)%2)==0? "az1" : "az3"}"
  }
}

resource "aws_subnet" "ap_subnet" {
  count = length(local.ap_cidr)
  vpc_id                  = local.vpc_id
  cidr_block              = element(local.ap_cidr,count.index)
  availability_zone       = ((count.index)%2)==0? local.zone_id_a : local.zone_id_c

  tags = { 
    Name = "${local.company_name}-ap-snet-${((count.index)%2)==0? "az1" : "az3"}"
  }
}

resource "aws_subnet" "db_subnet" {
  count = length(local.db_cidr)
  vpc_id                  = local.vpc_id
  cidr_block              = element(local.db_cidr,count.index)
  availability_zone       = ((count.index)%2)==0? local.zone_id_a : local.zone_id_c

  tags = { 
    Name = "${local.company_name}-db-snet-${((count.index)%2)==0? "az1" : "az3"}"
  }
}
