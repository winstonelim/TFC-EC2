######################
##### bastion SG #####
######################
resource "aws_security_group" "ec2_bastion_sg" {
  name        = "${local.company_name}-${local.server_env}-sg-bastion"
  description = "ec2-bastion security group"
  vpc_id      = local.vpc_id

  ingress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "${local.company_name}-${local.server_env}-sg-bastion"
  }
}

######################
##### private SG #####
######################
resource "aws_security_group" "ec2_private_sg" {
  name        = "${local.company_name}-${local.server_env}-sg-private"
  description = "ec2-private security group"
  vpc_id      = local.vpc_id

### SSH ###
  ingress {
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = [local.dmz_subnet[0].cidr_block]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

### HTTP ###
  ingress {
    from_port        = 80
    to_port          = 80
    protocol         = "http"
    cidr_blocks      = [local.dmz_subnet[0].cidr_block]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "${local.company_name}-${local.server_env}-sg-private"
  }
}