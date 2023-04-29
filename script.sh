#!/bin/bash
sudo rm -rf DevOps
sudo apt update
sudo apt install -y nginx jq stress curl wget net-tools unzip nano iputils-ping
sudo git clone https://github.com/dvpsraj/dockertest1.git DevOps
cd DevOps
sudo cp index.html /var/www/html/index.nginx-debian.html
sudo cp scorekeeper.js /var/www/html/scorekeeper.js
sudo cp style.css /var/www/html/style.css
sudo service nginx restart