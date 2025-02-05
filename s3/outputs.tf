output "website-bucket-domain" {
  value = aws_s3_bucket_website_configuration.website_bucket.website_domain
}

output "redirect-bucket-domain" {
  value = aws_s3_bucket_website_configuration.redirect_bucket.website_domain
}

output "website-bucket-hosted-zone-id" {
  value = aws_s3_bucket.website_bucket.hosted_zone_id
}

output "redirect-bucket-hosted-zone-id" {
  value = aws_s3_bucket.redirect_bucket.hosted_zone_id
}
