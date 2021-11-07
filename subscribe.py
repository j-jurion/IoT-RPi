#!/usr/bin/python

import paho.mqtt.client as mqttClient
import time
import os

def on_connect(client, userdata, flags, rc):

    if rc == 0:

        print("Connected to broker")

        global Connected                #Use global variable
        Connected = True                #Signal connection

    else:

        print("Connection failed")

def on_message(client, userdata, message):
    print "Message received: "  + message.payload
    if topic == "button":
        os.system("./scripts/gpioset.sh 26 " + message.payload)


Connected = False   #global variable for the state of the connection

broker_address= "192.168.0.155"  #Broker address
port = 1883                         #Broker port
topic = "button"

client = mqttClient.Client("Python")               #create new instance
client.on_connect= on_connect                      #attach function to callback
client.on_message= on_message                      #attach function to callback
client.connect(broker_address,port,60) #connect
client.subscribe(topic) #subscribe
client.loop_forever() #then keep listening forever

