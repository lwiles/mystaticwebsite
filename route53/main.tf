data "aws_route53_zone" "selected" {
  name = var.root-domain
}

resource "aws_route53_record" "root-domain" {
  zone_id = data.aws_route53_zone.selected.zone_id
  name    = var.root-domain
  type    = "A"

  alias {
    name                   = var.website-bucket-domain
    zone_id                = var.website-bucket-hosted-zone-id
    evaluate_target_health = false
  }
}

resource "aws_route53_record" "www" {
  zone_id = data.aws_route53_zone.selected.zone_id
  name    = var.www-domain
  type    = "A"

  alias {
    name                   = var.redirect-bucket-domain
    zone_id                = var.redirect-bucket-hosted-zone-id
    evaluate_target_health = false
  }
}
