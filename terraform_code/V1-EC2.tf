provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "demo-server" {
  ami           = "ami-0cca150d127c2216f"
  instance_type = "t3.micro"
  key_name      = "surya-key"
  security_groups = [ "demo-sg" ]
}

resource "aws_security_group" "demo-sg" {
  name        = "demo-sg"
  description = "SSH Access"

  ingress {
    description = "SSH access"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "ssh-prot"

  }
}