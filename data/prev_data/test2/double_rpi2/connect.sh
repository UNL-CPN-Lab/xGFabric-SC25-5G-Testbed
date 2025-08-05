
#base_path="/home/vuranlab/networking_scripts/dongle_scripts/check_status"

#echo "---> enter connect.sh" >> $dongle_base_path/logs/$(date +\%m-\%d-\%Y)

# Bring up the data connection
#python3 $dongle_base_path/helper/dongle.py -c 'AT$QCRMCALL=1,1'
#sleep 3
sudo ifconfig wwan0 up
sudo udhcpc -i wwan0

#echo "---> exit connect.sh" >> $dongle_base_path/logs/$(date +\%m-\%d-\%Y)
