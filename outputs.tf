output "instance_public_ip" {
  value       = aws_instance.example.public_ip
  description = "Public IP address of the EC2 instance"
}

output "instance_private_ip" {
  value       = aws_instance.example.private_ip
  description = "Private IP address of the EC2 instance"
}

output "security_group_id" {
  value       = aws_security_group.instance.id
  description = "ID of the security group"
}
