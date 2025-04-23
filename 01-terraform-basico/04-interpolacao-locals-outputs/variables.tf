variable "aws_region" {
  type        = string
  description = "Região AWS onde os recursos serão provisionados"
  default     = "us-east-1"
}

variable "aws_profile" {
  type        = string
  description = "Perfil de credenciais AWS"
  default     = "default"
}

variable "environment" {
  type        = string
  description = "Ambiente DEV"
  default     = "dev"
}

