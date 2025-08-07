sysctl -w net.ipv4.ip_forward=1

#iptables -t nat -A POSTROUTING -s 10.45.0.0/16 ! -o ogstun -j MASQUERADE
iptables -t nat -A POSTROUTING -s 129.93.240.0/16 ! -o ogstun -j MASQUERADE

#set sub_db with slices data
/open5gs/set_slices.sh

5gc -c open5gs-5gc.yml
