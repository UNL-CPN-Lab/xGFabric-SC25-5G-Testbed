/home/ubuntu/srsran_performance.sh -y
# python3 /usr/local/lib/uhd/utils/uhd_images_downloader.py
# apt install iperf3 -y
iperf3 -s -p 55001 &
iperf3 -s -p 55002 &
iperf3 -s -p 55003 &
iperf3 -s -p 55004 &
iperf3 -s -p 55005 &
iperf3 -s -p 55006 &