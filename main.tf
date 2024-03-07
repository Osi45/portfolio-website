provider "aws" {
  region = "us-east-1"
}

resource "aws_security_group" "web" {
  name        = "web-sg"
  description = "Allow HTTP and SSH inbound traffic"

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    name = "web-sg"
  }
}

resource "aws_instance" "web_server" {
  ami           = "ami-0f403e3180720dd7e"
  instance_type = "t2.micro"
  security_groups = [aws_security_group.web.name]

  tags = {
    Name = "web-server"
  }
}
