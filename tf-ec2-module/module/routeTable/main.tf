####################################
####### public routing table #######
####################################
resource "aws_route_table" "route_table_public" {
  vpc_id = local.vpc_id
  tags = { Name = "${local.company_name}-${local.server_env}-rt-pub" }
}

resource "aws_route" "public_route" {
  route_table_id = aws_route_table.route_table_public.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id = local.igw.id
}

resource "aws_route_table_association" "public_asso_rt" {
  count = length(local.dmz_subnet_id)

  subnet_id = element(local.dmz_subnet_id, count.index)
  route_table_id = aws_route_table.route_table_public.id
}


##########################################
####### private routing table(az1) #######
##########################################
resource "aws_route_table" "route_table_private_az1" {
  vpc_id = local.vpc_id
  tags = { Name = "${local.company_name}-${local.server_env}-rt-pri-01" }
}

resource "aws_route" "private_route_az1" {
  route_table_id = aws_route_table.route_table_private_az1.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id = local.natgw_az1.id
}

resource "aws_route_table_association" "private_ap_asso_rt_az1" {
  subnet_id = element(local.ap_subnet_id, 0)
  route_table_id = aws_route_table.route_table_private_az1.id
}

resource "aws_route_table_association" "private_elb_asso_rt_az1" {
  subnet_id = element(local.elb_subnet_id, 0)
  route_table_id = aws_route_table.route_table_private_az1.id
}

##########################################
####### private routing table(az3) #######
##########################################
resource "aws_route_table" "route_table_private_az3" {
  vpc_id = local.vpc_id
  tags = { Name = "${local.company_name}-${local.server_env}-rt-pri-02" }
}

resource "aws_route" "private_route_az3" {
  route_table_id = aws_route_table.route_table_private_az3.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id = local.natgw_az1.id
}

resource "aws_route_table_association" "private_ap_asso_rt_az3" {
  subnet_id = element(local.ap_subnet_id, 1)
  route_table_id = aws_route_table.route_table_private_az3.id
}

resource "aws_route_table_association" "private_elb_asso_rt_az3" {
  subnet_id = element(local.elb_subnet_id, 1)
  route_table_id = aws_route_table.route_table_private_az3.id
}


################################
####### db routing table #######
################################
resource "aws_route_table" "route_table_db" {
  vpc_id = local.vpc_id
  tags = { Name = "${local.company_name}-${local.server_env}-rt-db" }
}

resource "aws_route_table_association" "db_asso_rt" {
  count = length(local.db_subnet_id)

  subnet_id = element(local.db_subnet_id, count.index)
  route_table_id = aws_route_table.route_table_db.id
}