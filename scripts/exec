#!/bin/env bash
set -eou pipefail 

SCYLLA_NAME=scyllaU1

echo
echo "Status:"
nodetool status 
echo 


FILE=$1
[ -n "$FILE" ] || (echo "specify actions (file) as first arg" && exit 1)
FILE_PATH="/scripts/${FILE}.cql"

echo
echo "Running ${FILE_PATH} on ${SCYLLA_NAME} ..."

cqlsh -f "${FILE_PATH}" "${SCYLLA_NAME}"
