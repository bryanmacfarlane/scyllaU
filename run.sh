#!/bin/bash -e

SCYLLA_NAME=scyllaU1

docker run --name "$SCYLLA_NAME" -h "$SCYLLA_NAME" -v "$(pwd)/scripts:/scripts" -d scylladb/scylla --overprovisioned 1 --smp 1

ps_id=$( docker ps -f name="$SCYLLA_NAME" --format "{{.ID}}" )
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
fi

status() {
    sleep 1
    docker exec -it $SCYLLA_NAME nodetool status  > /dev/null 2>&1
    return $?
}

echo "Waiting for server to start"
until status
do
  printf "."
done

echo
echo Status:
echo docker exec -it $SCYLLA_NAME nodetool status
docker exec -it $SCYLLA_NAME nodetool status 

docker exec -it $SCYLLA_NAME bash
