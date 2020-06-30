FROM debian:latest

WORKDIR /tmp/

RUN apt-get -y update
RUN apt-get -y upgrade
RUN apt-get -y install build-essential git libtool libusb-1.0.0-dev librtlsdr-dev rtl-sdr cmake automake python3 python3-pip
RUN pip3 install paho-mqtt numpy

RUN git clone https://github.com/merbanan/rtl_433.git

#RUN mkdir -p /app
#WORKDIR /app

COPY build.sh .
#COPY rtl_433_events.py .
#COPY utils.py .

# Build rtl_433
RUN ./build.sh

#CMD python3 rtl_433_events.py

CMD rtl_433 -f 868M -s 1024k -F "mqtt://$MQTT_IP:$MQTT_PORT,devices=rtl_433/$RTL433_DEVICE"