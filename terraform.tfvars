variable "us-east-1" {
  description = "AWS region to deploy into"
  type        = string
}

variable "t2.micro" {
  description = "EC2 instance type"
  type        = string
}

variable "ami-0953476d60561c955" {
  description = "AMI ID for the EC2 instance"
  type        = string
}

variable "linux" {
  description = "Key pair name for SSH access"
  type        = string
}

variable "vpc-083bd5085ee1b2149" {
  description = "VPC ID where resources will be deployed"
  type        = string
}

variable "subnet-07b99d4dc448a136f" {
  description = "Subnet ID for the EC2 instance"
  type        = string
}
