data "aws_vpc" "vpc_id" {
  id = var.vpc_id
}

data "aws_subnet" "subnet_id" {
  id = var.subnet_id
}

resource "aws_instance" "terraform_ec2" {
  ami           = var.ami_id
  instance_type = var.instance_type
  key_name      = var.key_name
  subnet_id     = data.aws_subnet.subnet_id.id
  tags = {
    Name = "Terraform-instance"
  }
  security_groups = [var.security_group]
  user_data = <<-EOF
              #!/bin/bash
              echo "Hello, World!" > /var/www/html/index.html
              EOF
}
