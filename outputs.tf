output "EC2IPs" {
  value = {
    Staging = module.staging.public_ip
    Web     = module.app.private_ip
  }
}

output "RDS" {
  value = aws_db_instance.db.endpoint
}

output "S3" {
  value = {
    Staging = {
      EndPoint  = module.s3_storage.endpoint
      AccessKey = module.s3_storage.accessKey
      Secret    = module.s3_storage.secret
    },
    Production = {
      EndPoint  = module.s3_storage_staging.endpoint
      AccessKey = module.s3_storage_staging.accessKey
      Secret    = module.s3_storage_staging.secret
    }
  }
}
