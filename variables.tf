variable "domain" {
  type    = string
  default = "domain.com"
}
variable "staging_domain" {
  type    = string
  default = "staging-domain.com"
}

variable "aws_region" {
  type    = string
  default = "us-east-1"
}

variable "aws_access_key" {
  type = string
}

variable "aws_secret_key" {
  type = string
}
variable "ssh_key_name" {
  type    = string
  default = "key_name"
}

variable "db_username" {
  type = string
}

variable "db_password" {
  type = string
}
