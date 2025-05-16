terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~>5.0"
    }
  }
}

#defining aws provider
provider "aws" {
  region     = "us-east-1"
  access_key = "AKIAWCZC5ZCVTGSUQC2E"
  secret_key = "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"
}

#defining ec2 machine
resource "aws_instance" "myec" {
  ami           = "ami-0953476d60561c955"
  instance_type = "t2.micro"
  key_name      = "linux"
  tags = {
    Name = "clement-vm2"
  }
}

#defining vpc
resource "aws_vpc" "myvpc" {
  cidr_block = "10.0.0.0/16"
  tags = {
    Name = "clementvpc2"
  }
}

