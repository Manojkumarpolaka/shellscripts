#!/bin/bash
sudo apt update  #updating repositries URLs
sudo apt install apache2 -y #installing apache webserver
sudo systemctl start apache2 #starting apache server
sudo wget https://packages.microsoft.com/config/ubuntu/20.04/packages-microsoft-prod.deb -O packages-microsoft-prod.deb 
sudo dpkg -i packages-microsoft-prod.deb
sudo apt-get update
sudo apt-get install -y apt-transport-https aspnetcore-runtime-6.0
sudo cp -r ./reverseproxy-ubuntu-apache /etc/nginx/sites-available/nop.conf
sudo mkdir /var/www/nopCommerce450 #creating directory for nop commerce
cd /var/www/nopCommerce450 
sudo wget https://github.com/nopSolutions/nopCommerce/releases/download/release-4.50.1/nopCommerce_4.50.1_NoSource_linux_x64.zip
sudo apt-get install unzip -y
sudo unzip nopCommerce_4.50.1_NoSource_linux_x64.zip
sudo mkdir bin
sudo mkdir logs
cd ..
sudo chgrp -R $USER nopCommerce450/
sudo chown -R $USER nopCommerce450/
sudo cp -r /home/ubuntu/shell/nopCommerce450.service /etc/systemd/system/nopCommerce450.service
sudo systemctl start nopCommerce450.service
sudo systemctl daemon-reload
sudo systemctl restart apache2
