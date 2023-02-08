resource "aws_vpc" "vpc" {
  cidr_block = local.vpc_cidr
  enable_dns_support = true
  enable_dns_hostnames = true

  tags = {
    Name =  "${local.company_name}-${local.server_env}-VPC"
  }
}

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.vpc.id
  tags = { 
    Name = "${local.company_name}-${local.server_env}-IG" 
  }
}