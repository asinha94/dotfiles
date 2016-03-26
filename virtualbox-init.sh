#!/bin/bash

# Remove older dependenices. Newer version will be installed 
sudo apt-get remove libcheese-gtk23 libcheese7

# Installs Guest Additions in virtualbox which allows for a configurable resolution
sudo apt-get install virtualbox-guest-utils virtualbox-guest-x11 virtualbox-guest-dkms

./setup.sh
