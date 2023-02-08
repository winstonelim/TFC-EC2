output "bastion_public_ip" {
  description = "Public IP address of the EC2 instance"
  value       = aws_instance.Bastion_instacne.public_ip
}

output "ec2_private_ip" {
  description = "Private IP address of the EC2 instance"
  value       = aws_instance.Private_instacne.private_ip
}
