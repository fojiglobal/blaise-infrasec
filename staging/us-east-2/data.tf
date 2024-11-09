###################### Data Sources ######################
data "aws_route53_zone" "my_domain" {
  name = "${var.my_domain_name}."
}

data "aws_acm_certificate" "alb_cert" {
  domain      = "*.${var.my_domain_name}"
  types       = ["AMAZON_ISSUED"]