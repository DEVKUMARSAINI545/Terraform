#!/bin/bash


sudo  apt update -y


sudo apt install -y apache2
sudo systemctl start apache2
sudo systemctl enable apache2


echo "<html><h1>hello sir </h1></html>" | sudo tee   /var/www/html/index.html