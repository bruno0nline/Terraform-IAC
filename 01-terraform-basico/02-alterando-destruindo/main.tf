
provider "aws" {
  region = "us-east-1"
  profile = "default"
}

resource "aws_s3_bucket" "bruno_bucket" {
  bucket = "bruno-maestriatec-terraform-iac"  # Precisa ser único no mundo
  force_destroy = true

  tags = {
    Projeto   = "Curso Terraform"
    Ambiente  = "Dev"
    CriadoPor = "Bruno"
    Date = "10042025"
  }
}
