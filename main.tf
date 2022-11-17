
# default region
provider "aws" {
  region     = var.aws_region
  access_key = var.aws_access_key
  secret_key = var.aws_secret_key
}

# Aliased region
provider "aws" {
  alias      = "main"
  region     = var.aws_region
  access_key = var.aws_access_key
  secret_key = var.aws_secret_key
}


resource "tls_private_key" "key" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "aws_key_pair" "key" {
  key_name   = var.ssh_key_name
  public_key = tls_private_key.key.public_key_openssh
}
