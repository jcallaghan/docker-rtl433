# docker-rtl433
Docker image to run [merbanan/rtl_433](https://github.com/merbanan/rtl_433.git) which I use to read the data from my Bresser weather station.

## Environment variables

The ```docker-compose.yml``` leverages an environment variables in an include file ```rtl_433.env``` which is ignored through a  ```.gitignore```.
This include includes the following:
```
MQTT_IP=127.0.0.1
MQTT_PORT=0
MQTT_USER=0
MQTT_PASS=0
RTL433_DEVICE=119
```