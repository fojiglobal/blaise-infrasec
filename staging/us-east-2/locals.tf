############## locals for vpc###############

locals {
    vpc_cidr = "10.50.0.0/16"
    env = "staging"
  
}
#################### public subnets locals###########

locals {
  public_subnets ={
   "pub-sub-1" = {
    cidr = cidrsubnet(local.vpc_cidr, 8, 1)
    azs = "us-east-2a"
    tags = {
        Name = "pub-sub-1"
        Environment = local.env
    }
   }

   "pub-sub-2" = {
    cidr = cidrsubnet(local.vpc_cidr, 8, 2)
    azs = "us-east-2b"
    tags = {
        Name = "pub-sub-2"
        Environment = local.env
   }
   }
   "pub-sub-3" = {
    cidr = cidrsubnet(local.vpc_cidr, 8, 3)
    azs = "us-east-2c"
    tags = {
        Name = "pub-sub-3"
        Environment = local.env
   }
  }
}
}


 
#################### private subnets locals###########


locals {
  private_subnets ={
   "priv-sub-1" = {
    cidr = cidrsubnet(local.vpc_cidr, 8, 10)
    azs = "us-east-2a"
    tags = {
        Name = "priv-sub-1"
        Environment = local.env
    }
   }

   "priv-sub-2" = {
    cidr = cidrsubnet(local.vpc_cidr, 8, 11)
    azs = "us-east-2b"
    tags = {
        Name = "priv-sub-2"
        Environment = local.env
   }
   }
   "priv-sub-3" = {
    cidr = cidrsubnet(local.vpc_cidr, 8, 12)
    azs = "us-east-2c"
    tags = {
        Name = "priv-sub-3"
        Environment = local.env
   }
  }
}
}

######################### Locals Public SG  #######################

locals {
    public-sg-ingress = {
    "all-http" = {
      src = "0.0.0.0/0"
      from_port = 80
      to_port = 80
      ip_protocol = "tcp"
      description = "Allow HTTP From Anywhere"
    }
     "all-https" = {
      src = "0.0.0.0/0"
      from_port = 443
      to_port = 443
      ip_protocol = "tcp"
      description = "Allow HTTP From Anywhere"
    }
  }
    public-sg-egress = {
  "all-http" = {
    dest = "0.0.0.0/0"
    ip_protocol = "-1"
    description = "Allow All To Anywhere"
  }
}

}
#################### Locals Private SG ##############################


locals {
   private-sg-egress = {
  "all" = {
    dest = "0.0.0.0/0"
    ip_protocol = "-1"
    description = "Allow All To Anywhere"
  }
}
  private-sg-ingress = {
    "alb-http" = {
      src = module.staging.public_sg_id
      from_port = 80
      to_port = 80
      ip_protocol = "tcp"
      description = "Allow HTTP From Anywhere"
    }
     "alb-https" = {
      src = module.staging.public_sg_id
      from_port = 443
      to_port = 443
      ip_protocol = "tcp"
      description = "Allow HTTP From Anywhere"
    }
    "bastion-ssh" = {
      src = module.staging.bastion_sg_id
      from_port = 22
      to_port = 22
      ip_protocol = "tcp"
      description = "Allow SSH from Bastion"
    }
  }
}

################### Bastion SG Rules ###############

locals {
   bastion-sg-egress = {
  "all" = {
    dest = "0.0.0.0/0"
    ip_protocol = "-1"
    description = "Allow All To Anywhere"
  }
}
  bastion-sg-ingress = {
    "all-ssh" = {
      src = "0.0.0.0/0"
      from_port = 22
      to_port = 22
      ip_protocol = "tcp"
      description = "Allow SSH From Anywhere"
    }
  }
}


locals {
  my_domain_name = "micablexy.com"
}

################ Load Balancer ################

locals {
  http_port             = 80
  http_protocol         = "HTTP"
  https_port            = 443
  https_protocol        = "HTTPS"
  internet_facing       = false
  lb_type               = "application"
  alb_ssl_profile       = "ELBSecurityPolicy-2016-08"
  my_domain_env         = "stg"
  route53_target_health = false
  record_type_A         = "A"
}