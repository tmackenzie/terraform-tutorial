terraform {
    required_version = "1.1.9"
    
    backend "s3" {
        bucket = "maclayzie"
        key    = "terraform/tutorial-shared"
        region = "us-east-1"
    }

    required_providers {
        aws = {
            source  = "hashicorp/aws"
        }
    }
}

provider "aws" {
    region  = "us-east-1"
    alias   = "main"
}

data "aws_region" "current" {
    provider = aws.main
}
