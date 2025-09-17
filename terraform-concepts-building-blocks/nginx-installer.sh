#!/bin/bash

# Sleep until the instance is ready
until [[-f /var/lib/cloud/instance/boot-finished ]]; do
    sleep 5
done

# Install Nginx
apt-get update
apt-get install -y nginx

# Start Nginx service
service nginx start