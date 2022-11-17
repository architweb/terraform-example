# Create the bucket
resource "aws_s3_bucket" "bucket_s3" {
  bucket = var.domain

  tags = {
    Name = "${var.domain}-s3"
  }
}

resource "aws_s3_bucket_acl" "bucket_s3" {
  bucket = aws_s3_bucket.bucket_s3.id
  acl    = "private"
}

resource "aws_iam_user" "bucket_s3" {
  name = "${var.domain}-s3"
}
resource "aws_iam_access_key" "bucket_s3" {
  user = aws_iam_user.bucket_s3.name
}

data "aws_iam_policy_document" "bucket_s3_inline_policy" {
  version = "2012-10-17"
  statement {
    sid     = ""
    actions = ["s3:*"]
    effect  = "Allow"
    resources = [
      "arn:aws:s3:*:*:accesspoint/*",
      "arn:aws:s3-object-lambda:*:*:accesspoint/*",
      "arn:aws:s3:::*/*",
      "arn:aws:s3:*:*:job/*",
      "arn:aws:s3:*:*:storage-lens/*",
      "arn:aws:s3:::${aws_s3_bucket.bucket_s3.bucket}"
    ]
  }
  statement {
    sid = ""
    actions = [
      "s3:ListStorageLensConfigurations",
      "s3:ListAccessPointsForObjectLambda",
      "s3:GetAccessPoint",
      "s3:PutAccountPublicAccessBlock",
      "s3:GetAccountPublicAccessBlock",
      "s3:ListAllMyBuckets",
      "s3:ListAccessPoints",
      "s3:ListJobs",
      "s3:PutStorageLensConfiguration",
      "s3:CreateJob"
    ]
    effect    = "Allow"
    resources = ["*"]
  }
}

resource "aws_iam_policy" "bucket_s3_policy" {
  name   = "${var.domain}-s3-policy"
  policy = data.aws_iam_policy_document.bucket_s3_inline_policy.json
}

resource "aws_iam_user_policy_attachment" "bucket_s3_attach_policy" {
  user       = aws_iam_user.bucket_s3.name
  policy_arn = aws_iam_policy.bucket_s3_policy.arn
}


# Enable static hosting if needed
resource "aws_s3_bucket_website_configuration" "host_bucket" {
  count = var.hosting ? 1 : 0

  bucket = aws_s3_bucket.bucket_s3.bucket

  index_document {
    suffix = "index.html"
  }

  error_document {
    key = "index.html"
  }

}

# Create redirect bucket if we access without www
resource "aws_s3_bucket" "redirect_bucket" {
  count  = var.hosting && substr(var.domain, 0, 4) == "www." ? 1 : 0
  bucket = substr(var.domain, 4, length(var.domain))
  tags = {
    Name = "${var.domain}-redirect-s3"
  }
}

resource "aws_s3_bucket_website_configuration" "redirect_bucket" {
  count  = var.hosting && substr(var.domain, 0, 4) == "www." ? 1 : 0
  bucket = aws_s3_bucket.redirect_bucket[count.index].bucket
  redirect_all_requests_to {
    host_name = var.domain
    protocol  = "https"
  }
}