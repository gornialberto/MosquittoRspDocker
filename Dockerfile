FROM resin/rpi-raspbian

LABEL maintainer="gornialberto@gmail.com" Description="Mosquitto MQTT Broker for Raspian"

#add the mosquitto repository, install it and create the data and log foldoer to be shared later as volumes with the host
RUN apt-get update && apt-get install wget && \
    wget http://repo.mosquitto.org/debian/mosquitto-repo.gpg.key && \
    sudo apt-key add mosquitto-repo.gpg.key && \
    cd /etc/apt/sources.list.d/ && \
    sudo wget http://repo.mosquitto.org/debian/mosquitto-jessie.list && \
    apt-get update && \
    apt-get install mosquitto && \
    mkdir -p /mosquitto/data /mosquitto/log && \
    chown -R mosquitto:mosquitto /mosquitto

#overwrite the standard configuration
COPY mosquitto.conf /etc/mosquitto/

#run mosquitto (it will use the standard configuration raplaced)
CMD ["/usr/sbin/mosquitto"]