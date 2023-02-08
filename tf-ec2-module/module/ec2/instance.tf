
############################
##### Bastion Instance #####
############################
resource "aws_instance" "Bastion_instacne" {
  ami = data.aws_ami.latest_amazon_linux_2.id
  instance_type = "t2.micro"
  associate_public_ip_address = true
  subnet_id = local.dmz_subnet_id[0]
  vpc_security_group_ids = [aws_security_group.ec2_bastion_sg.id]
  key_name = "lim-test-key"     #생성된 키를 가지고 이용함
  
  tags = { Name = "${local.company_name}-${local.server_env}-EC2-bastion" }
}

############################
##### Private Instance #####
############################
resource "aws_instance" "Private_instacne" {
  ami = data.aws_ami.latest_amazon_linux_2.id
  instance_type = "c5.large"
  associate_public_ip_address = false
  subnet_id = local.ap_subnet_id[0]
  vpc_security_group_ids = [aws_security_group.ec2_private_sg.id]
  key_name = "lim-test-key"     #생성된 키를 가지고 이용함
  
  tags = { Name = "${local.company_name}-${local.server_env}-EC2-private" }
}
