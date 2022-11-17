module "s3_storage" {
  source = "./modules/aw-s3-host"

  providers = {
    aws = aws.main
  }

  domain = "storage.${var.domain}"
}

module "s3_storage_staging" {
  source = "./modules/aw-s3-host"

  providers = {
    aws = aws.main
  }

  domain = "storage.${var.staging_domain}"
}
