#Get logs from the running container and store in the folder mentioned below
#will include gNB logs + pcap

#path=${pwd}
path="/home/prashant/workspace/srsran-5g"
directory="gnb_logs/srsUE_logs"
date_time=$(date +"%Y-%m-%d_%H:%M:%S")
mkdir "$path/$directory/$date_time"

#where are the log files inside the container?
container_log_directory="tmp"

image="its-registry.unl.edu/nextt/runtime/srsran-4g/amd64/uhd_master:main-df286439"
docker cp $(docker ps -q --filter ancestor=$image):/$container_log_directory $path/$directory/$date_time

mv $path/$directory/$date_time/$container_log_directory/* $path/$directory/$date_time/
rm -r $path/$directory/$date_time/$container_log_directory