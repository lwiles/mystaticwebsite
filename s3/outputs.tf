output "website-bucket-domain" {
  value       = aws_s3_bucket_website_configuration.website_bucket.website_domain
  description = "The website_domain of the s3 bucket containing the website"
}

output "redirect-bucket-domain" {
  value       = aws_s3_bucket_website_configuration.redirect_bucket.website_domain
  description = "The website_domain of the s3 bucket that redirects to the website bucket"
}

output "website-bucket-hosted-zone-id" {
  value       = aws_s3_bucket.website_bucket.hosted_zone_id
  description = "The hosted_zone_id of the s3 bucket containing the website"
}

output "redirect-bucket-hosted-zone-id" {
  value       = aws_s3_bucket.redirect_bucket.hosted_zone_id
  description = "The hosted_zone_id of the s3 bucket that redirects to the website bucket"
}
