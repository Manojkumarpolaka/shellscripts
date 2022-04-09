#!/bin/bash

# creating the directory for nopcommerce

sudo mkdir /var/www/nopCommerce450

# Enter into nop commerce

cd /var/www/nopCommerce450

# Download and unpacking the nopcommerce

sudo wget https://github.com/nopSolutions/nopCommerce/releases/download/release-4.50.1/nopCommerce_4.50.1_NoSource_linux_x64.zip

sudo apt-get install unzip -y

sudo unzip nopCommerce_4.50.1_NoSource_linux_x64.zip

# Create directories for binaries and logs

sudo mkdir bin
sudo mkdir logs

# Comeout of nopcommerce450 directory

cd ..

# changing the ownership and group name of the file

sudo chgrp -R www-data nopCommerce450/
sudo chown -R www-data nopCommerce450/

# Create the service file for nopcommerce in /etc/systemd/system/nopCommerce450.service with the following contents

sudo cp -r ./nopCommerce450.service /etc/systemd/system/nopCommerce450.service

# Start the nopcommerce service

sudo systemctl start nopCommerce450.service

systemctl daemon-reload

