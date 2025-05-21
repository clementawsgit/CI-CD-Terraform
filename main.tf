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
  access_key = "AKIAWCZC5ZCV5EQLQF5J"
  secret_key = "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"
}

# Create a EC
resource "aws_instance" "myec2" {
  ami           = "ami-0953476d60561c955"
  instance_type = "t2.micro"
  key_name      = "linux"

  tags = {
    Name = "Myproject_server_TF"
  }
}
