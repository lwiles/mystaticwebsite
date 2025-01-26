variable "tf-profile" {
  description = "Terraform provider profile name"
  type        = string
}

variable "root-domain-bucket" {
  description = "The name of S3 bucket where the static site will be stored"
  type        = string
}

variable "subdomain-bucket" {
  description = "The name of the S3 bucket that will redirect to root domain bucket"
  type        = string
}
