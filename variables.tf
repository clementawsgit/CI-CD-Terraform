variable "aws_region" {
  type    = string
  default = "us-east-1"
  description = "AWS Region to deploy"
}

variable "ec2_ami" {
  type        = string
  description = "ami-084568db4383264d4"
}

variable "ec2_instance_type" {
  type        = string
  default     = "t2.micro"
  description = "EC2 instance type"
}

variable "ec2_key_pair" {
  type        = string
  description = "ubuntu"
}

variable "subnet_id" {
  type        = string
  description = "subnet-07b99d4dc448a136f"
}

variable "vpc_id" {
  type        = string
  description = "vpc-083bd5085ee1b2149"
}

variable "ingress_port" {
  type        = number
  default     = 22
  description = "Port to allow inbound traffic for HTTP"
}

variable "ingress_cidr_blocks" {
  type        = list(string)
  default     = ["0.0.0.0/0"] # Be very cautious with this in production; restrict to your IP ranges
  description = "List of CIDR blocks allowed for inbound traffic"
}

variable "ec2_tag_name" {
  type        = string
  default     = "MyEC2Instance"
  description = "Name tag for the EC2 instance"
}

variable "environment" {
  type        = string
  default     = "dev"
  description = "Environment tag for the EC2 instance and security group"
}
