resource "aws_route53_zone" "primary" {
  name = var.domainName
}

resource "aws_route53_record" "main" {
  zone_id = aws_route53_zone.primary.zone_id
  name    = var.domainName
  type    = "A"
  alias {
    name                   = aws_s3_bucket_website_configuration.website.website_endpoint
    zone_id                = aws_s3_bucket.static_website.hosted_zone_id
    evaluate_target_health = true
  }
}

resource "aws_route53_record" "www" {
  zone_id = aws_route53_zone.primary.zone_id
  name    = var.wwwDomainName
  type    = "A"
  alias {
    name                   = aws_s3_bucket_website_configuration.website.website_endpoint
    zone_id                = aws_s3_bucket.static_website.hosted_zone_id
    evaluate_target_health = true
  }
}
