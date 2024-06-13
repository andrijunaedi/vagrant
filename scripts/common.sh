#!/bin/bash
# Update package list and upgrade all packages
sudo apt-get update
sudo apt-get upgrade -y

# Install basic tools
sudo apt-get install -y curl wget git nano net-tools
