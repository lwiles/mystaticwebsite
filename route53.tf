data "aws_route53_zone" "selected" {
  name = var.root-domain
}

resource "aws_route53_record" "root-domain" {
  zone_id = data.aws_route53_zone.selected.zone_id
  name    = var.root-domain
  type    = "A"

  alias {
    name                   = aws_s3_bucket_website_configuration.website_bucket.website_domain
    zone_id                = aws_s3_bucket.website_bucket.hosted_zone_id
    evaluate_target_health = false
  }
}

resource "aws_route53_record" "www" {
  zone_id = data.aws_route53_zone.selected.zone_id
  name    = format("%s.%s", var.www-subdomain, var.root-domain)
  type    = "A"

  alias {
    name                   = aws_s3_bucket_website_configuration.redirect_bucket.website_domain
    zone_id                = aws_s3_bucket.redirect_bucket.hosted_zone_id
    evaluate_target_health = false
  }
}
