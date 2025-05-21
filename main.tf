terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}


provider "aws" {
  region     = "us-east-1"
  access_key = "AKIAWCZC5ZCVVCCE4E7X"
  secret_key = "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"
}

# Create a EC
resource "aws_instance" "myec2" {
  ami           = "ami-0953476d60561c955"
  instance_type = "t2.micro"
  key_name      = "linux"
  count = "1"

  tags = {
    Name = "Clement-TF"
  }
}
