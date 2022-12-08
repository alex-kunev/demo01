#!/bin/bash
echo 
sudo yum update -y
sudo yum -y httpd.x86_64
systemctl start httpd.service
systemctl enable httpd.service
echo "Welcome to the official website of this app!" > /var/www/html/index.html
echo "Installing Docker"
sudo yum install -y docker
sudo usermod -aG docker ec2-user
sudo newgrp docker
sudo systemctl enable docker.service
sudo systemctl start docker.service

sudo wget -O /etc/yum.repos.d/jenkins.repo \
    https://pkg.jenkins.io/redhat-stable/jenkins.repo
sudo rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io.key
sudo yum upgrade
sudo amazon-linux-extras install java-openjdk11 -y
sudo yum install jenkins -y
sudo systemctl enable jenkins
sudo systemctl start jenkins
sudo systemctl status jenkins
