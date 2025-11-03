# S3 Bucket
resource "aws_s3_bucket" "logs_bucket" {
  bucket = "${var.project}-${var.environment}-logs"
  tags = {
    Project     = var.project
    Environment = var.environment
    Owner       = var.owner
  }
}

# Security Group
resource "aws_security_group" "web_sg" {
  name        = "${var.project}-${var.environment}-sg"
  description = "Security group para acesso SSH e HTTP"

  ingress = [
    {
      description      = "SSH"
      from_port        = 22
      to_port          = 22
      protocol         = "tcp"
      cidr_blocks      = [var.ssh_cidr]
    },
    {
      description      = "HTTP"
      from_port        = 80
      to_port          = 80
      protocol         = "tcp"
      cidr_blocks      = [var.http_cidr]
    }
  ]

  egress = [
    {
      description      = "Outbound"
      from_port        = 0
      to_port          = 0
      protocol         = "-1"
      cidr_blocks      = ["0.0.0.0/0"]
    }
  ]

  tags = {
    Project     = var.project
    Environment = var.environment
    Owner       = var.owner
  }
}

# EC2 Instance
resource "aws_instance" "web_server" {
  ami                    = var.ami
  instance_type          = var.instance_type
  vpc_security_group_ids = [aws_security_group.web_sg.id]

  tags = {
    Name        = "${var.project}-${var.environment}-ec2"
    Project     = var.project
    Environment = var.environment
    Owner       = var.owner
  }
}
