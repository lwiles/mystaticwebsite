variable "root-domain" {
  description = "The primary domain name"
  type        = string
}

variable "www-domain" {
  description = "Represents the 'www' subdomain"
  type        = string
}

variable "website-bucket-domain" {
  description = "The website_domain of the s3 bucket containing the website"
  type        = string
}

variable "redirect-bucket-domain" {
  description = "The website_domain of the s3 bucket that redirects to the website bucket"
  type        = string
}

variable "website-bucket-hosted-zone-id" {
  description = "The hosted_zone_id of the s3 bucket containing the website"
  type        = string
}

variable "redirect-bucket-hosted-zone-id" {
  description = "The hosted_zone_id of the s3 bucket that redirects to the website bucket"
  type        = string
}
