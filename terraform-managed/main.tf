terraform {
  backend "s3" {
    bucket = "onemuthoot-terra"
    key    = "onemuthoot"
    region = "us-east-1"
  }
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 3.15"
    }
  }
}

