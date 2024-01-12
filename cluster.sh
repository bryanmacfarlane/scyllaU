#!/bin/bash 

set -eou pipefail

# https://sort.veritas.com/public/documents/HSO/2.0/linux/productguides/html/hfo_admin_ubuntu/ch04s03.htm
echo "setting fs.aio-max-nr to greater than 65536 ..."
# sudo sysctl -a | grep aio
sudo sysctl -a | grep fs.aio-max-nr
sudo sysctl -w fs.aio-max-nr=1048576

# does not work on macos.  11k was the highest allowed
# https://forum.scylladb.com/t/running-3-node-scylladb-in-docker/1057
# sudo sysctl -w kern.aiomax=1048576
# sudo sysctl kern.aiomax=11000
# sysctl -a | grep aio

SCYLLA_NAME=scyllaU

checkNode() {
    ps_id=$( docker ps -f name="$1" --format "{{.ID}}" )
    echo "container id: $ps_id"

    if [[ "$ps_id" == "" ]]; then
        echo "FAILED!"
        docker ps -a

        echo
        echo "LOGS:"
        docker logs "$ps_id"

        echo
        echo "Removing ..."
        docker rm "$ps_id"

        exit 1
    fi    
}

status() {
    sleep 1
    docker exec -it "${1}" nodetool status  > /dev/null 2>&1
    return $?
}

waitForNode() {
    echo "Waiting for ${1} to start"
    until status $1
    do
        printf "."
    done 
    echo "ready"   
}

# Start up the first node
FIRST_NAME="${SCYLLA_NAME}1"
docker run --name "${FIRST_NAME}" -h "${FIRST_NAME}" -v "$(pwd)/scripts:/scripts" -d scylladb/scylla --overprovisioned 1 --smp 1

checkNode "${FIRST_NAME}"
waitForNode "${FIRST_NAME}"

# exit 0

NODE1_IP="$(docker inspect --format='{{ .NetworkSettings.IPAddress }}' ${FIRST_NAME})"
echo "NODE1_IP=${NODE1_IP}"

# Start up the the other two nodes and seed to first node
for i in {2..3}
do
    CURR_NAME="${SCYLLA_NAME}$i"
    echo "creating node ${CURR_NAME} seeding to ${NODE1_IP}..."
    docker run --name "${CURR_NAME}" -h "$CURR_NAME" -d scylladb/scylla --seeds="${NODE1_IP}" --overprovisioned 1 --smp 1    
    # docker run --name "${CURR_NAME}" -h "$CURR_NAME" -v "$(pwd)/scripts:/scripts" -d scylladb/scylla --overprovisioned 1 --smp 1

    checkNode "${CURR_NAME}"
    waitForNode "${CURR_NAME}"
done


echo
echo Status:
echo docker exec -it $FIRST_NAME nodetool status
docker exec -it $FIRST_NAME nodetool status 

docker exec -it $FIRST_NAME bash
