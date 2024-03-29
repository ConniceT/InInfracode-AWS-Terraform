#!/bin/bash
# Update all system packages
sudo yum update -y

# Install Docker from Amazon Linux's repositories
sudo yum install docker -y

# Start the Docker service
sudo systemctl start docker

# Enable Docker service to start on boot
sudo systemctl enable docker

# Add the ec2-user to the Docker group to allow running Docker commands without sudo
sudo usermod -a -G docker ec2-user
