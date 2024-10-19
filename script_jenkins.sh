#!/bin/bash

#install jenkins
sudo yum update -y
sudo wget -O /etc/yum.repos.d/jenkins.repo \
    https://pkg.jenkins.io/redhat/jenkins.repo
sudo rpm --import https://pkg.jenkins.io/redhat/jenkins.io-2023.key 
sudo yum upgrade 
# Add required dependencies for the jenkins package
sudo yum install git -y
sudo yum install fontconfig -y
sudo yum install java-17-amazon-corretto-headless -y
sudo yum install jenkins -y
#start jenkins
sudo systemctl enable jenkins
sudo systemctl start jenkins


#install docker and docker compose

#install Docker
sudo yum update -y
sudo amazon-linux-extras install docker -y
sudo service docker start
sudo usermod -a -G docker ec2-user
sudo su 
sudo su -- ec2-user
sudo chmod 666 /var/run/docker.sock #to fix permissions

#install Docker Compose
sudo curl -L https://github.com/docker/compose/releases/latest/download/docker-compose-$(uname -s)-$(uname -m) -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose

#install ansible
sudo yum update -y
sudo amazon-linux-extras install epel -y
sudo yum install -y ansible