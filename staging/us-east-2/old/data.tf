data "aws_route53_zone" "micablexy" {
  name = "micablexy.com."
}

# Find a certificate issued by (not imported into) ACM
data "aws_acm_certificate" "alb_cert" {
  domain      = "www.exam1.micablexy.com"
  types       = ["AMAZON_ISSUED"]
  most_recent = true
}