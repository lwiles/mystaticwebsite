# Create S3 root domain bucket
resource "aws_s3_bucket" "static_website" {
  bucket = var.root-domain-bucket
}

# Create redirect/subdomain bucket
resource "aws_s3_bucket" "redirect_bucket" {
  bucket = var.subdomain-bucket
}

resource "aws_s3_bucket_ownership_controls" "static_website" {
  bucket = aws_s3_bucket.static_website.id

  rule {
    object_ownership = "BucketOwnerPreferred"
  }
}

resource "aws_s3_bucket_public_access_block" "static_website" {
  bucket                  = aws_s3_bucket.static_website.id
  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}

resource "aws_s3_bucket_policy" "static_website" {
  depends_on = [aws_s3_bucket_public_access_block.static_website]
  bucket     = aws_s3_bucket.static_website.id
  policy     = data.aws_iam_policy_document.public_read_access.json
}

data "aws_iam_policy_document" "public_read_access" {
  statement {
    sid = "PublicReadGetObject"
    principals {
      type        = "*"
      identifiers = ["*"]
    }

    actions = [
      "s3:GetObject",
    ]

    resources = [
      "${aws_s3_bucket.static_website.arn}/*",
    ]
  }
}

resource "aws_s3_bucket_website_configuration" "website" {
  bucket = aws_s3_bucket.static_website.id

  index_document {
    suffix = "index.html"
  }
  error_document {
    key = "error.html"
  }
}

resource "aws_s3_bucket_website_configuration" "redirect_bucket" {
  bucket = aws_s3_bucket.redirect_bucket.id

  redirect_all_requests_to {
    host_name = var.root-domain-bucket
    protocol  = "http"
  }
}

resource "aws_s3_bucket_acl" "static_website" {
  depends_on = [
    aws_s3_bucket_ownership_controls.static_website,
    aws_s3_bucket_public_access_block.static_website,
  ]

  bucket = aws_s3_bucket.static_website.id
  acl    = "public-read"
}

resource "aws_s3_object" "upload_object" {
  depends_on   = [aws_s3_bucket_public_access_block.static_website]
  for_each     = fileset("static/", "*")
  bucket       = aws_s3_bucket.static_website.id
  key          = each.value
  source       = "static/${each.value}"
  etag         = filemd5("static/${each.value}")
  content_type = "text/html"
  acl          = "public-read"
}
