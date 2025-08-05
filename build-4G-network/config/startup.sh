#!/bin/bash

set -euo pipefail

# Based another env var, pick one template to use
if [[ -v USE_FDD_CU ]]; then ln -s /opt/oai-enb/etc/cu.fdd.conf /opt/oai-enb/etc/enb.conf; fi
if [[ -v USE_FDD_DU ]]; then ln -s /opt/oai-enb/etc/du.fdd.conf /opt/oai-enb/etc/enb.conf; fi
if [[ -v USE_FDD_MONO ]]; then ln -s /opt/oai-enb/etc/enb.fdd.conf /opt/oai-enb/etc/enb.conf; fi
if [[ -v USE_TDD_MONO ]]; then ln -s /opt/oai-enb/etc/enb.tdd.conf /opt/oai-enb/etc/enb.conf; fi
if [[ -v USE_FDD_RCC ]]; then ln -s /opt/oai-enb/etc/rcc.if4p5.enb.fdd.conf /opt/oai-enb/etc/enb.conf; fi
if [[ -v USE_FDD_RRU ]]; then ln -s /opt/oai-enb/etc/rru.fdd.conf /opt/oai-enb/etc/enb.conf; fi
if [[ -v USE_TDD_RRU ]]; then ln -s /opt/oai-enb/etc/rru.tdd.conf /opt/oai-enb/etc/enb.conf; fi

# Only this template will be manipulated
CONFIG_FILES=`ls /opt/oai-enb/etc/enb.conf`

# Load the USRP binaries
/usr/lib/uhd/utils/uhd_images_downloader.py -t b2xx
# /usr/lib/uhd/utils/uhd_images_downloader.py -t x3xx
# /usr/lib/uhd/utils/uhd_images_downloader.py -t n3xx


echo "=================================="
echo "== Starting eNB soft modem"
/opt/oai-enb/bin/lte-softmodem.Rel15 -O /opt/oai-enb/etc/enb.conf