variable "envinroment" {
  type        = string
  description = "Ambiente PRD ou DEV"
}

variable "aws_region" {
  type        = string
  description = "Região AWS onde os recursos serão provisionados"

}

variable "aws_profile" {
  type        = string
  description = "Perfil de credenciais AWS"

}

variable "instance_ami" {
  type        = string
  description = "AMI da instância EC2"

}

variable "instance_type" {
  type        = string
  description = "Tipo da instância EC2"

}

variable "instance_tags" {
  type        = map(string)
  description = "Tags aplicadas à instância"
  default = {
    Name    = "Amzn2"
    Project = "Curso Terraform"
  }
}

variable "subnet_id" {
  type        = string
  description = "ID da Subnet onde a instância será criada"

}
