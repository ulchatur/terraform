output "instance_public_ip" {
  description = "EC2 instance public IP"
  value       = aws_instance.terraform_ec2.public_ip
}

