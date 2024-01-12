#!/bin/bash -e

SCYLLA_USER=scylla
echo "SCYLLA_USER=${SCYLLA_USER}"

[ -n "$SCYLLA_PASS" ] || (echo "SCYLLA_PASS not set" && exit 1)
echo "SCYLLA_PASS=${SCYLLA_PASS}"

SCYLLA_ADDR=${1:-node-0.gce-us-east-1.a2a0f939a25642525762.clusters.scylla.cloud}

echo cqlsh scylladb/scylla -u "${SCYLLA_USER}" -p "${SCYLLA_PASS}" ${SCYLLA_ADDR}
docker run -it --rm --entrypoint cqlsh scylladb/scylla -u "${SCYLLA_USER}" -p "${SCYLLA_PASS}" ${SCYLLA_ADDR}
