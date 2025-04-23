locals {

  ip_filepath = "ips.json"

  commom_tags = {
    service     = "Curso Terraform"
    ManagedBy   = "Terraform"
    Envinroment = var.environment
    Owner       = "Bruno Augusto"
  }

}