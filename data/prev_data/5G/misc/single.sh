directory=$1_$(hostname)
ip=10.53.1.3 #gNB's ip -> the docker container
#ip=129.93.208.46
mkdir -p $directory
iperf3 -c $ip -p $4 --json > ./$directory/$hostname_$2_$3_$5.json
