terraform {
  required_version = "1.6.6"
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.94.1"
    }
  }
}

provider "aws" {
  region = "us-east-1"
  profile = "default"
}

resource "aws_s3_bucket" "bruno_bucket" {
  bucket = "bruno-maestriatec-terraform-iac-001"  # Precisa ser único no mundo
  force_destroy = true

  tags = {
    Projeto   = "Curso Terraform"
    Ambiente  = "Dev"
    CriadoPor = "Bruno"
  }
}
