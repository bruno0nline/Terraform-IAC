resource "aws_s3_bucket" "this" {
  bucket = "${random_pet.bucket.id}-${var.environment}"
  tags   = local.commom_tags
}

resource "aws_s3_bucket" "manual" {
  bucket = "maestriaconsolebucket"
  tags = {
    Criacao   = "Manual"
    Importado = "22042025"
    ManagedBy = "Terraform"
  }
}

resource "aws_s3_object" "this" {
  bucket       = aws_s3_bucket.this.bucket
  key          = "config/${local.ip_filepath}"
  source       = local.ip_filepath
  etag         = filemd5(local.ip_filepath)
  content_type = "application/josn"


  tags = local.commom_tags

}

resource "aws_s3_object" "random" {
  bucket       = aws_s3_bucket.this.bucket
  key          = "config/${random_pet.bucket.id}.json"
  source       = local.ip_filepath
  etag         = filemd5(local.ip_filepath)
  content_type = "application/josn"


  tags = local.commom_tags

}