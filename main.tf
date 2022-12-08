terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }

  required_version = ">= 1.2.0"
}

provider "aws" {
  region = var.region_name
}

# DEFINE THE DATA SOURCES:

data "aws_security_group" "tiger01" {
  id = "sg-0ea86551890cab173"
}

# DEFINE THE RESOURCES:

resource "aws_instance" "app_server_1" {
  ami           = var.image_id
  instance_type = "t2.micro"

  tags = {
    Name = var.instance_name_1
  }
  key_name               = "key1"
  vpc_security_group_ids = [data.aws_security_group.tiger01.id]
  user_data = file("scripts-jenkins.sh")
}

resource "aws_instance" "app_server_2" {
  ami           = var.image_id
  instance_type = "t2.micro"

  tags = {
    Name = var.instance_name_2
  }
  key_name               = "key1"
  vpc_security_group_ids = [data.aws_security_group.tiger01.id]
  user_data = file("scripts-docker.sh")
}


# DEFINE THE OUTPUTS:

output "tiger01" {
  value = data.aws_security_group.tiger01
}

output "instance_id" {
  description = "ID of the Jenkins instance"
  value       = aws_instance.app_server_1.id
}

output "instance_public_ip" {
  description = "Public IP address of the Jenkins instance"
  value       = aws_instance.app_server_1.public_ip
}

output "instance_i_2" {
  description = "ID of the Docker instance"
  value       = aws_instance.app_server_2.id
}

output "instance_public_ip_2" {
  description = "Public IP address of the Docker instance"
  value       = aws_instance.app_server_2.public_ip
}
