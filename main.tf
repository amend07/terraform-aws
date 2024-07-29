# Specify the Terraform version
terraform {
  required_version = ">= 0.12"
}

# Configure the AWS provider
provider "aws" {
  region = "us-west-2" # Change to your desired region
}

# Define the key pair for SSH access
resource "aws_key_pair" "deployer" {
  key_name   = "my-key"
  public_key = file("~/.ssh/id_rsa.pub") # Path to your SSH public key
}

# Create a security group
resource "aws_security_group" "instance" {
  name        = "allow_ssh"
  description = "Allow SSH inbound traffic"
  
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1" # All protocols
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# Define the EC2 instance
resource "aws_instance" "ubuntu_server" {
  ami           = "ami-0c55b159cbfafe1f0" # Change to your desired AMI ID
  instance_type = "t2.micro"
  key_name      = aws_key_pair.deployer.key_name
  vpc_security_group_ids = [aws_security_group.instance.id] # Correctly referencing the security group
  
  # Configure the root block device
  root_block_device {
    volume_size = 30 # Size in GB
  }

  # User data to run commands on instance initialization
  user_data = <<-EOF
              #!/bin/bash
              apt-get update -y
              apt-get upgrade -y
              EOF

  # Tag the instance
  tags = {
    Name = "ubuntu-server"
  }
}

# Output the public IP of the instance
output "instance_ip" {
  value = aws_instance.ubuntu_server.public_ip
}
