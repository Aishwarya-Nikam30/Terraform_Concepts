#!/bin/bash

sudo yum install nginx -y
sudo systemctl start nginx
sudo systemctl enable nginx

echo "<h1> This is my nginx server created by terraform </h1>" | sudo tee /var/www/html/index.html