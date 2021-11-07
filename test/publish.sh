#!/bin/bash

#Usage example: ./publish 'Hello there!'

mosquitto_pub -t testing -m "$1"
