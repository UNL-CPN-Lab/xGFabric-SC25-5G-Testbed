#!/bin/bash

# Default values
MODE=""         # {single|double}
BANDWIDTH=""
MODULATION=""
PORT=""
DEVICE=""
TEST=""
SAMPLE=""
PROTO=""
TIME=10
IP=""
#IP = "10.53.1.3 (5G)"
#IP = "192.168.26.3 (4G)"

usage() {
  echo "Usage: $0 -m <single|double> -b <bandwidth> -g <modulation> -d <device> -t <test#> -p <port> -P <tcp|udp> -s <sample#> -i <server IP> -T <duration>"
  echo
  echo "Example:"
  #echo "  $0 -m double -b 20 -g QAM16 -d laptop -t test3 -p 5201 -P udp -s 2 -i iperf.he.net -T 15"
  echo "$0 -P tcp -g QAM64 -d laptop -t test1 -T 10 -i iperf.he.net -p 5201 -b 20 -m single -s 5"
  exit 1
}

# Parse options
while getopts ":m:b:g:d:t:p:P:s:i:T:" opt; do
  case $opt in
    m) MODE="$OPTARG" ;;
    b) BANDWIDTH="$OPTARG" ;;
    g) MODULATION="$OPTARG" ;;
    d) DEVICE="$OPTARG" ;;
    t) TEST="$OPTARG" ;;
    p) PORT="$OPTARG" ;;
    P) PROTO="$OPTARG" ;;
    s) SAMPLE="$OPTARG" ;;
    i) IP="$OPTARG" ;;
    T) TIME="$OPTARG" ;;
    \?) echo "Invalid option -$OPTARG" >&2; usage ;;
    :) echo "Option -$OPTARG requires an argument." >&2; usage ;;
  esac
done

# Validate required args
if [[ -z $MODE || -z $BANDWIDTH || -z $MODULATION || -z $TEST || -z $IP ]]; then
  echo "Error: Missing required arguments."
  usage
fi

# Construct output directory and filename
DIR="${DEVICE}/${PROTO}/${TEST}/$(whoami)_${MODE}"
FILENAME="${BANDWIDTH}_${MODULATION}_s${SAMPLE}.json"

mkdir -p "$DIR"

# Run iperf3 test
echo "Running iperf3 test to $IP on port $PORT using $PROTO for $TIME seconds..."
iperf3 -c "$IP" -p "$PORT" -t "$TIME" --json > "${DIR}/${FILENAME}"

echo "Saved: ${DIR}/${FILENAME}"