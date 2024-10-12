variable "staging_vpc_cidr" {
  type    = string
  default = "10.30.0.0/16"

}

variable "use2a" {
  type    = string
  default = "us-east-2a"

}

variable "use2b" {
  type    = string
  default = "us-east-2b"

}

variable "staging_env" {
  type    = string
  default = "staging"

}

variable "alb_port_http" {
  type    = string
  default = "80"

}

variable "alb_port_https" {
  type    = string
  default = "443"

}


variable "alb_porto_http" {
  type    = string
  default = "HTTP"

}

variable "alb_porto_https" {
  type    = string
  default = "HTTPS"

}

variable "alb_ssl_profile" {
  type    = string
  default = "httpsELBSecurityPolicy-2016-08"

}

variable "drop_invalid_header" {
  type = bool
  default = true
}


