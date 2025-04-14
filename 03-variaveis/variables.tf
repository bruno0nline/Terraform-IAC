variable "aws_region" {
  type        = string
  description = ""
  default     = "us-east-1"
}

variable "aws_profile" {
  type        = string
  description = ""
  default     = "default"
}

variable "instance_ami" {
  type        = string
  description = ""
  default     = "ami-07a6f770277670015"
}

variable "instance_type" {
  type        = string
  description = ""
  default     = "t2.micro"
}

variable "instance_tags" {
  type        = map(string)
  description = ""
  default = {
    Name    = "Ubuntu"
    Project = "Curso Terraform"
  }
}

variable "subnet_id" {
  type        = string
  description = "ID da subnet onde a instância será criada"
  default     = "subnet-0b31d2c77040b0372" # Subnet Publica 01 da VPC Produção
}
