# Define the AWS region (make sure this is correct for your setup)
aws_region = "us-east-1"

# EC2 Instance Configuration
instance_type = "t2.micro"
ami_id        = "ami-0953476d60561c955" # Replace with a suitable AMI ID for your region
key_pair_name = "linux" # Replace with your EC2 key pair name (optional)
instance_name = "my-cicd-ec2"

# Network Configuration (replace with your actual VPC and Subnet IDs)
vpc_id      = "vpc-083bd5085ee1b2149"
subnet_id   = "subnet-07b99d4dc448a136f"

# Security Group Configuration
ssh_cidr_blocks = ["0.0.0.0/0"] # Be very cautious with 0.0.0.0/0 in production; restrict IPs

# Optional Tags for the EC2 Instance
ec2_tags = {
  Environment = "ci-cd"
  Project     = "MyWebApp"
  Owner       = "Automation"
}

# Optional Tags for the Security Group
sg_tags = {
  Environment = "ci-cd"
  Project     = "MyWebApp"
  Purpose     = "Allow SSH"
}
