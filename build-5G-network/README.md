# srsRAN-5G

This repo builds and runs a 5G network.

# Hardware Requirement:

1. Host Computer Running >= 10th gen intel chip with at least 16GB RAM
2. SDR (B210) connected over usb3

# Software Requirement: 

1. Ubuntu OS / MacOS
2. Docker

# How to use:

## Clone the repo and get inside it
```
git clone *.git
cd srsran-5g
```

## Build the docker image

```
#build baseubuntu first
docker build -t baseubuntu -f Docker/Dockerfile.baseubuntu .

# build uhd4.8 (need it to communicate with the sdr)
docker build -t uhd4.8 -f Docker/Dockerfile.uhd .

#build srs using the uhd image
docker build -t 5g_gnb -f Docker/Dockerfile.srsgNB .
```

## Run the docker compose file

```docker compose -f docker-compose-default.yml up```
