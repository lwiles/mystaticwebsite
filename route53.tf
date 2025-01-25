data "aws_route53_zone" "selected" {
  name = var.root-domain-bucket
}

resource "aws_route53_record" "static-website" {
  zone_id = data.aws_route53_zone.selected.zone_id
  name    = var.root-domain-bucket
  type    = "A"

  alias {
    name                   = aws_s3_bucket_website_configuration.website.website_domain
    zone_id                = aws_s3_bucket.static_website.hosted_zone_id
    evaluate_target_health = false
  }
}

resource "aws_route53_record" "www" {
  zone_id = data.aws_route53_zone.selected.zone_id
  name    = var.subdomain-bucket
  type    = "A"

  alias {
    name                   = aws_s3_bucket_website_configuration.redirect_bucket.website_domain
    zone_id                = aws_s3_bucket.redirect_bucket.hosted_zone_id
    evaluate_target_health = false
  }
}
