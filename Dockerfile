FROM resin/rpi-raspbian

MAINTAINER gornialberto <gorni.alberto@gmail.com>

LABEL Description="Eclipse Mosquitto MQTT Broker for Raspian"

RUN apt-get update && apt-get install wget && \
    wget http://repo.mosquitto.org/debian/mosquitto-repo.gpg.key && \
    sudo apt-key add mosquitto-repo.gpg.key && \
    cd /etc/apt/sources.list.d/ && \
    sudo wget http://repo.mosquitto.org/debian/mosquitto-jessie.list && \
    apt-get update && \
    apt-get install mosquitto && \
    mkdir -p /mosquitto/config /mosquitto/data /mosquitto/log && \
    cp /etc/mosquitto/mosquitto.conf /mosquitto/config && \
    chown -R mosquitto:mosquitto /mosquitto

CMD ["/usr/sbin/mosquitto", "-c", "/mosquitto/config/mosquitto.conf"]