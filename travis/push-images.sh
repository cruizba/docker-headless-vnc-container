#!/usr/bin/env bash
set -e -o pipefail

DIST=$1
DESKTOP=$2
BASE_NAME="cruizba/ptaki-$DIST-$DESKTOP-vnc:${TRAVIS_TAG:-$TRAVIS_BRANCH}"

if [[ -z "$DIST" ]] || [[ -z $DESKTOP ]]; then
    echo "You must specify a distribution and a desktop environment" >&2
    exit 1
fi

echo "Pushing in docker hub $BASE_NAME"
docker push $BASE_NAME

if [[ ! -z "$TRAVIS_TAG" ]]; then
    docker push cruizba/ptaki-$DIST-$DESKTOP-vnc:latest
fi