resource "aws_security_group" "ec2_sg" {
  name   = "training-sg"
  vpc_id = var.vpc_id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = var.tags
}

resource "aws_instance" "training_ec2" {
  ami                          = var.ami_id
  instance_type                = var.instance_type
  subnet_id                    = var.subnet_id
  associate_public_ip_address  = var.associate_public_ip_address
  key_name                     = var.key_name
  vpc_security_group_ids       = [aws_security_group.ec2_sg.id]
  iam_instance_profile         = aws_iam_instance_profile.ec2_profile.name

  user_data = <<-EOF
    #!/bin/bash
    set -e

    # System update
    apt-get update -y
    apt-get upgrade -y

    # Core packages
    apt-get install -y nginx awscli git docker.io docker-compose-v2


    # Enable & start nginx
    systemctl enable nginx
    systemctl start nginx

    # Enable & start docker
    systemctl enable docker
    systemctl start docker

    # Allow ubuntu user to run docker without sudo
    usermod -aG docker ubuntu
    newgrp ubuntu


    # Sync site content from S3
    aws s3 sync s3://${var.bucket_name} /usr/share/nginx/html/
  EOF

  tags = var.tags
}
