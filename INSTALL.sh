#!/bin/bash

printf  "\n----- UPDATING RPI -----\n"
sudo apt-get update

printf  "\n----- INSTALLING PYTHON & PACKAGES -----\n"
sudo apt install -y python3 idle3
pip install paho-mqtt

printf  "\n----- INSTALLING MOSQUITTO -----\n"
sudo apt install -y mosquitto mosquitto-clients
sudo systemctl enable mosquitto.service
mosquitto -v
sudo systemctl status mosquitto

printf  "\n----- PERMISSIONS -----\n"
chmod +x scripts/gpioget.sh 
chmod +x scripts/gpioset.sh 

printf "\n>>>> INSTALLATION DONE \n"
