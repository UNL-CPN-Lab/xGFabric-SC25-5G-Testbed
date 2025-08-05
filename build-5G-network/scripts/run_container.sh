#docker exec -it $(docker ps -q --filter ancestor=its-registry.unl.edu/nextt/runtime/srsran-4g/amd64/uhd_master:main-df286439) /bin/bash
image="its-registry.unl.edu/nextt/runtime/srsran-4g/amd64/uhd_master:main-df286439"
docker exec -it $(docker ps -q --filter ancestor=$image) /bin/bash