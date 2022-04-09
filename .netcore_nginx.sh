#!/bin/bash

# Before installing .NET Core, we'll need to register the Microsoft key and install the required dependencies. 
# This needs to be done once per machine.

sudo wget https://packages.microsoft.com/config/ubuntu/20.04/packages-microsoft-prod.deb -O packages-microsoft-prod.deb

sudo dpkg -i packages-microsoft-prod.deb

# Install the .NET runtime

sudo apt-get update

sudo apt-get install -y apt-transport-https aspnetcore-runtime-6.0

# You can see all installed .Net Core runtimes 

dotnet --list-runtimes

# Install the nginx package

sudo apt-get install nginx -y 

# Run the nginx service

sudo systemctl start nginx

# Status check for nginx serrvice 

sudo systemctl status nginx

# configure nginx as a reverse proxy to forward requests to your ASP.NET Core app

sudo cp -r ./reverseproxy.txt etc/nginx/sites-available/default