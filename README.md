# IoT-RPi

By running 'INSTALL.sh', the mosquitto MQTT software is installed and the service is enabled on the Raspberry Pi. The Raspberry Pi can now act as an MQTT broker by publishing topic-value pairs to its IP address.

'subscribe.py' is subscribed to its own broker. The Raspberry Pi can be programmed to execute specific tasks locally, for example toggling GPIO's.

In the 'test/' folder, a 'publish.sh' and 'subscribe.sh' script are available to test mosquitto locally on the Raspberry Pi.
