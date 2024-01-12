#!/bin/bash -e

SCYLLA_NAME=scyllaU1

# get all containers with the scylla image
ps_id=$(docker ps -a --format "{{json . }}" | jq -r ". | select (.Image|startswith(\"scylladb\"))|.ID")

echo "ids: $ps_id"

if [[ "$ps_id" == "" ]]; then
    echo "Could not stop.  Do containers exist?"
    docker ps -a -f name="${SCYLLA_NAME}"
    echo 
    exit 1
fi    

# need ids on one line
# https://stackoverflow.com/a/66261380/775184
ps_ids="${ps_id//$'\n'/ }"

echo
echo "Stopping ${ps_ids} ..."
docker stop $ps_ids || true

echo
echo "Removing $ps_ids ..."  
docker rm $ps_ids 