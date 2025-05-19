terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }

  backend "s3" {
    bucket = "your-terraform-state-bucket-name" # Replace with your S3 bucket name
    key    = "ec2/terraform.tfstate"
    dynamodb_table = "your-terraform-state-locking-table-name" # Replace with your DynamoDB table name
    region = "ap-southeast-1" # Assuming Singapore region
  }
}

provider "aws" {
  region = var.aws_region
}

resource "aws_instance" "example" {
  ami           = var.ec2_ami
  instance_type = var.ec2_instance_type
  key_name      = var.ec2_key_pair
  vpc_security_group_ids = [aws_security_group.instance.id]
  subnet_id     = var.subnet_id # Ensure you have a subnet ID

  tags = {
    Name        = var.ec2_tag_name
    Environment = var.environment
    DeployedBy  = "Terraform-CI-CD"
  }
}

resource "aws_security_group" "instance" {
  name_prefix = "ec2-instance-sg-"
  vpc_id      = var.vpc_id # Ensure you have a VPC ID

  ingress {
    from_port   = var.ingress_port
    to_port     = var.ingress_port
    protocol    = "tcp"
    cidr_blocks = var.ingress_cidr_blocks
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name        = "EC2 Instance Security Group"
    Environment = var.environment
    DeployedBy  = "Terraform-CI-CD"
  }
}
