# Mosquitto Raspberry PI Docker

Mosquitto Raspberry PI Docker container based on resin/rpi-raspbian and the "official" Dockerfile from https://hub.docker.com/_/eclipse-mosquitto/ for the version 1.4.10 and the instruction founds here for deploying Mosquitto on Raspberry: http://www.instructables.com/id/Installing-MQTT-BrokerMosquitto-on-Raspberry-Pi/


##Mount Points

Three mount points have been created in the image to be used for configuration, persistent storage and logs.

+ /mosquitto/config
+ /mosquitto/data
+ /mosquitto/log

##Configuration

When running the image, the default configuration values are used. To use a custom configuration file, mount a local configuration file to /mosquitto/config/mosquitto.conf

```
docker run -it -p 1883:1883 -p 9001:9001 -v <path-to-configuration-file>:/mosquitto/config/mosquitto.conf rspmosquitto:1.4.10
```

Configuration can be changed to:

persist data to ***/mosquitto/data***
log to ***/mosquitto/log/mosquitto.log***

i.e. add the following to mosquitto.conf:

+ persistence true
+ persistence_location /mosquitto/data/

log_dest file /mosquitto/log/mosquitto.log
Note: If a volume is used, the data will persist between containers.

##Build Build the image:

```
docker build -t rspmosquitto:1.4.10 .
```

##Run Run a container using the new image:

```
docker run -it -p 1883:1883 -p 9001:9001 -v <path-to-configuration-file>:/mosquitto/config/mosquitto.conf -v <path-for-data-storage>:/mosquitto/data -v <path-for-logs-storage>:/mosquitto/log rspmosquitto:1.4.10
```

💥 if the mosquitto configuration (mosquitto.conf) was modified to use non-default ports, the docker run command will need to be updated to expose the ports that have been configured.