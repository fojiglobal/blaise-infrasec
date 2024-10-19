module "staging" {
    source = "./modules"
    vpc_cidr = local.vpc_cidr
    env = local.env
    public_subnets = local.public_subnets
    private_subnets = local.private_subnets
    pub-sub-name = "pub-sub-1"
    user_data = filebase64("web.sh")
    public_sg_egress = local.public-sg-egress
  public_sg_ingress = local.public-sg-ingress
  private_sg_egress = local.private-sg-egress
  private_sg_ingress = local.private-sg-ingress
  bastion_sg_ingress = local.bastion-sg-ingress
  bastion_sg_egress = local.bastion-sg-egress
  my_domain_env = local.my_domain_env
  my_domain_name = local.my_domain_name
  http_port       = local.http_port
  http_protocol   = local.http_protocol
  https_port      = local.https_port
  https_protocol  = local.https_protocol
  internet_facing = local.internet_facing
  lb_type         = local.lb_type
  alb_ssl_profile = local.alb_ssl_profile
  route53_target_health = local.route53_target_health
  record_type_A         = local.record_type_A
  
}


output "vpc_id" {
  value = module.staging.vpc_id
}

output "pub_subnet_id" {
  value = module.staging.public_subnet_ids
}


