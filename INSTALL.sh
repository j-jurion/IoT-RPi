#!/bin/bash

sudo apt-get update
sudo apt install -y mosquitto mosquitto-clients
sudo systemctl enable mosquitto.service
mosquitto -v
sudo systemctl status mosquitto
