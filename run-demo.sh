#!/bin/bash
NAME=${NAME:='demo'}
IMG='jack6liu/postfix'
TAG='alpine'

if [[ "$1" ]]; then
    NAME=$1
fi
if [[ "$2" ]]; then
    PORT=$2
fi

echo ">> run ${NAME}<<"
docker run --detach             \
           --name ${NAME}       \
           --hostname ${NAME}   \
           --publish 25:25      \
           ${IMG}:${TAG}
