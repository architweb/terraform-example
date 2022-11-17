output "id" {
  value = var.domain
}

output "endpoint" {
  value = var.hosting ? aws_s3_bucket_website_configuration.host_bucket[0].website_endpoint : aws_s3_bucket.bucket_s3.bucket_regional_domain_name
}

output "accessKey" {
  value = aws_iam_access_key.bucket_s3.id
}

output "secret" {
  value = nonsensitive(aws_iam_access_key.bucket_s3.secret)
}
