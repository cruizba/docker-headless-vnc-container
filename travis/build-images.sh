#!/usr/bin/env bash
set -e -o pipefail

DIST=$1
DESKTOP=$2
BASE_NAME="cruizba/ptaki-$DIST-$DESKTOP-vnc:${TRAVIS_TAG:-$TRAVIS_BRANCH}"
if [[ -z "$DIST" ]] || [[ -z $DESKTOP ]]; then
    echo "You must specify a distribution and a desktop environment" >&2
    exit 1
fi

echo "Building $BASE_NAME"
docker build -t ${BASE_NAME} -f ./Dockerfile.${DIST}.${DESKTOP}.vnc . \
    && echo "$BASE_NAME image was built succesfully" || { echo "Error build $BASE_NAME"; exit 1; }
