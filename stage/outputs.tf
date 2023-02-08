output "bastion_public_ip" {
  description = "Public IP address of the EC2 instance"
  value       = module.ec2.bastion_public_ip
}

output "ec2_private_private_ip" {
  description = "Private IP address of the EC2 instance"
  value       = module.ec2.ec2_private_ip
}