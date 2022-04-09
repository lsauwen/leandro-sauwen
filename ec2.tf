terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "= 3.74.2"
    }
  }
}
provider "aws" {
  region = var.region
}

resource "aws_instance" "server" {
  count                  = 2
  ami                    = var.ami
  instance_type          = var.instance_type
  key_name               = "aws_key"
  vpc_security_group_ids = [aws_security_group.ssh_http.id]

  user_data = <<-EOL
  #!/bin/bash -xe

  sudo apt-get update
  sudo apt-get install \
    ca-certificates \
    curl \
    gnupg \
    lsb-release

  curl -fsSL https://get.docker.com -o get-docker.sh
  sudo sh get-docker.sh

  sudo apt install docker-compose -y

  sudo apt install git -y

  EOL

  tags = {
    Name        = "server-${count.index}"
    Environment = var.env
    Provisioner = "Terraform"
    Repo        = var.repo
  }
}