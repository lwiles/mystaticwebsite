terraform {
  required_version = "~> 1.11.0"
  backend "s3" {
    bucket       = "lwiles-tf-backend"
    key          = "mystaticwebsite.tfstate"
    region       = "us-east-1"
    use_lockfile = true
  }
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region  = "us-east-1"
  profile = var.tf-profile
}

module "s3-local" {
  source      = "./s3"
  root-domain = var.root-domain
  www-domain  = var.www-domain
}

module "route53-local" {
  source                         = "./route53"
  root-domain                    = var.root-domain
  www-domain                     = var.www-domain
  website-bucket-domain          = module.s3-local.website-bucket-domain
  website-bucket-hosted-zone-id  = module.s3-local.website-bucket-hosted-zone-id
  redirect-bucket-domain         = module.s3-local.redirect-bucket-domain
  redirect-bucket-hosted-zone-id = module.s3-local.redirect-bucket-hosted-zone-id
}
