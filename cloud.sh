#!/bin/bash -e

SCYLLA_USER=scylla
echo "SCYLLA_USER=${SCYLLA_USER}"

[ -n "$SCYLLA_PASS" ] || (echo "SCYLLA_PASS not set" && exit 1)
echo "SCYLLA_PASS=${SCYLLA_PASS}"

SCYLLA_ADDR=${1}

echo cqlsh scylladb/scylla -u "${SCYLLA_USER}" -p "${SCYLLA_PASS}" ${SCYLLA_ADDR}
docker run -it --rm --entrypoint cqlsh scylladb/scylla -u "${SCYLLA_USER}" -p "${SCYLLA_PASS}" ${SCYLLA_ADDR}
