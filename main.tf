terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = var.aws_region
  # In a real CI/CD pipeline, AWS credentials would be managed
  # through IAM roles assigned to the CodePipeline service role.
  # Avoid hardcoding credentials here or in tfvars for production.
}

resource "aws_instance" "cicd_ec2" {
  ami           = var.ami_id
  instance_type = var.instance_type
  key_name      = var.key_pair_name
  subnet_id     = var.subnet_id
  vpc_security_group_ids = [aws_security_group.allow_ssh.id]
  tags = merge(var.ec2_tags, { Name = var.instance_name })
}

resource "aws_security_group" "allow_ssh" {
  name_prefix = "cicd-ssh-"
  description = "Allow SSH inbound traffic"
  vpc_id      = var.vpc_id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = var.ssh_cidr_blocks
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = var.sg_tags
}
