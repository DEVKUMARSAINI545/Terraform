#!/bin/bash

sudo apt update -y
sudo apt-get install nginx -y
sudo systemctl start nginx
sudo systemctl enable nginx

echo "<h1>Terraform is working by Dev Kumar Saini</h1>" > /var/www/html/index.html
