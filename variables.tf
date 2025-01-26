variable "tf-profile" {
  description = "Terraform provider profile name"
  type        = string
}

variable "root-domain" {
  description = "The primary domain name"
  type        = string
}

variable "www-subdomain" {
  description = "Represents the 'www' subdomain"
  type        = string
}
