#!/bin/bash

# INSTALL Docker
# Add Docker's official GPG key:
sudo apt-get update 
sudo apt-get install ca-certificates curl gnupg -y
sudo install -m 0755 -d /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
sudo chmod a+r /etc/apt/keyrings/docker.gpg

# Add the repository to Apt sources:
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update -y

# Install the Docker packages:
sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin -y
sudo apt install docker-compose -y


# python3 -V
# Building and installing dependencies
sudo apt update
sudo apt install python3-venv python3-dev libpq-dev curl -y

# Create Directory for sample application
mkdir hello_django && cd hello_django

# Create and activate virtual environment
python3 -m venv .
source bin/activate

# Installing Django-app inside hello_django dir
pip install django gunicorn

# Creating a Django project
django-admin startproject hello

# After running the above command go to hello/settings.py in ALLOWED_HOSTS add “*” in the list 
# Test Sample Application :- gunicorn hello.wsgi:application --bind 0.0.0.0:8000
