terraform {
  required_version = "1.6.6"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.94.1"
    }
  }
}

provider "aws" {
  region  = "us-east-1"
  profile = "default"
}


resource "aws_instance" "web" {
  ami           = "ami-02d579d042e769fba"
  instance_type = "t2.micro"

  tags = {
    Name = "HelloWorld"
  }
}
