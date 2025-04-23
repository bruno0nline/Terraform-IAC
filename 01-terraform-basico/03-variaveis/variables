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

variable "instance_ami" {
  type        = string
  description = "AMI da instância EC2"
  default     = "ami-07a6f770277670015" # Amazon Linux 2 us-east-1
}

variable "instance_type" {
  type        = string
  description = "Tipo da instância EC2"
  default     = "t2.micro"
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
  default     = "subnet-0b31d2c77040b0372" # Subnet Pública 01 da VPC Produção
}
