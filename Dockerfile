FROM resin/rpi-raspbian

MAINTAINER gornialberto <gorni.alberto@gmail.com>

LABEL Description="Eclipse Mosquitto MQTT Broker for Raspian"

RUN apt-get update && apt-get upgrade