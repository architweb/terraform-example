
#################
# Public SG's
#################

module "sg_http" {
  source = "./modules/aw-sg"

  providers = {
    aws = aws.main
  }

  name        = "http"
  description = "Allow http traffic"
  port        = "80"
  public      = true
}

module "sg_https" {
  source = "./modules/aw-sg"

  providers = {
    aws = aws.main
  }

  name        = "https"
  description = "Allow https traffic"
  port        = "443"
  public      = true
}

module "sg_ssh" {
  source = "./modules/aw-sg"

  providers = {
    aws = aws.main
  }

  name        = "ssh"
  description = "Allow ssh traffic"
  port        = "22"
  public      = true
}
