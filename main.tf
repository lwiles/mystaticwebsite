terraform {
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
