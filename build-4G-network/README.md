# srsRAN-4G

This repo builds and runs a 4G LTE network.

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
cd srsran-4g
```

## Build the docker image

```
# build UHD first (need it to communicate with the sdr)
docker build -t uhd -f Docker/Dockerfile.uhd .

#build srs using the uhd image
docker build -t srslte -f Docker/Dockerfile.srslte .
```

## Run the docker compose file

```docker compose -f docker-compose-srslte.yml up```
