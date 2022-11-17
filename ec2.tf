data "aws_ami" "debian" {
  most_recent = true

  filter {
    name   = "name"
    values = ["debian-10-amd64-2*"]
    # name   = "image-id"
    # values = ["ami-0ff400a2a6d557fb5"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

}

module "app" {
  source = "./modules/aw-ec2"

  providers = {
    aws = aws.main
  }

  name         = "app"
  ami_id       = data.aws_ami.debian.id
  subnet_id    = [for subnet in data.aws_subnet.all : subnet.id if length(subnet.tags) == 0][0]
  ssh_key_name = var.ssh_key_name
  security_groups = [
    module.sg_http.id,
    module.sg_https.id,
    module.sg_ssh.id
  ]
  static_ip = true
}

module "staging" {
  source = "./modules/aw-ec2"

  providers = {
    aws = aws.main
  }

  name         = "staging"
  ami_id       = data.aws_ami.debian.id
  subnet_id    = [for subnet in data.aws_subnet.all : subnet.id if length(subnet.tags) == 0][0]
  ssh_key_name = var.ssh_key_name
  security_groups = [
    module.sg_http.id,
    module.sg_https.id,
    module.sg_ssh.id
  ]
  static_ip = true
}
