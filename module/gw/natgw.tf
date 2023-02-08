###########################
##### NAT GateWay 생성 #####
###########################
resource "aws_eip" "natgw_ip" {
  vpc = true
}

resource "aws_nat_gateway" "natgw_az1" {
  allocation_id = aws_eip.natgw_ip.id
  subnet_id     = local.dmz_subnet_id[0]

  tags = {
    Name = "${local.company_name}-${local.server_env}-natgw-az1-public"
  }

  depends_on = [local.igw]
}
