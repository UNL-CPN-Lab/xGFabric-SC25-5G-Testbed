directory=$1_$(hostname)
#ip=10.53.1.3 #core's ip -> the docker container
ip=192.168.26.3
mkdir -p $directory
iperf3 -c $ip -p $4 -t 10 --json > ./$directory/$hostname_$2_$3_$5.json
