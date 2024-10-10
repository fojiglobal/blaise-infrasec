################## Private SG ###################
resource "aws_security_group" "private" {
  name        = "${var.env}-private-sg"
  description = "${var.env}-private-sg"
  vpc_id      = aws_vpc.this.id
  tags = {
    Name = "${var.env}-private-sg"
  }
}

resource "aws_vpc_security_group_ingress_rule" "private_sg_ingress" {
  security_group_id = aws_security_group.private.id
  for_each = var.private_sg_ingress
  referenced_security_group_id = each.value["src"]
  from_port   = each.value["from_port"]
  ip_protocol = each.value["ip_protocol"]
  to_port     = each.value["to_port"]
  description = each.value["description"]
}

resource "aws_vpc_security_group_egress_rule" "private_sg_egress" {
  security_group_id = aws_security_group.private.id
  for_each = var.private_sg_egress
  cidr_ipv4   = each.value["dest"] 
  ip_protocol = each.value["ip_protocol"]
  description = each.value["description"]
}

##################### Public SG ###################

resource "aws_security_group" "public" {
  name        = "${var.env}-public-sg"
  description = "${var.env}-public-sg"
  vpc_id      = aws_vpc.this.id
  tags = {
    Name = "${var.env}-public-sg"
  }
}

resource "aws_vpc_security_group_ingress_rule" "public_sg_ingress" {
  security_group_id = aws_security_group.public.id
  for_each = var.public_sg_ingress
  cidr_ipv4   = each.value["src"] 
  #cidr_ipv6 = each.value ["cidr_ipv6"]
  from_port   = each.value["from_port"]
  ip_protocol = each.value["ip_protocol"]
  to_port     = each.value["to_port"]
  description = each.value["description"]
}

resource "aws_vpc_security_group_egress_rule" "public_sg_egress" {
  security_group_id = aws_security_group.public.id
  for_each = var.public_sg_egress
  cidr_ipv4   = each.value["dest"] 
  ip_protocol = each.value["ip_protocol"]
  description = each.value["description"]
}


##################### bastion ###################

resource "aws_security_group" "bastion" {
  name        = "${var.env}-bastion-sg"
  description = "${var.env}-bastion-sg"
  vpc_id      = aws_vpc.this.id
  tags = {
    Name = "${var.env}-bastion-sg"
  }
}

resource "aws_vpc_security_group_ingress_rule" "bastion_sg_ingress" {
  security_group_id = aws_security_group.bastion.id
  for_each = var.bastion_sg_ingress

  cidr_ipv4   = each.value["src"] 
  from_port   = each.value["from_port"]
  ip_protocol = each.value["ip_protocol"]
  to_port     = each.value["to_port"]
  description = each.value["description"]
}

resource "aws_vpc_security_group_egress_rule" "bastion_sg_egress" {
  security_group_id = aws_security_group.bastion.id
  for_each = var.bastion_sg_egress
  cidr_ipv4   = each.value["dest"] 
  ip_protocol = each.value["ip_protocol"]
  description = each.value["description"]
}