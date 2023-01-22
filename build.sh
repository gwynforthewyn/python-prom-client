#!/bin/bash -elx

THIS_SCRIPT_DIR=$(cd $(dirname "${0}") && pwd)
cd "${THIS_SCRIPT_DIR}"

function help() {
  echo "${0} --push"
  echo "Options:"
  echo "--push - provide flag to push to docker hub"
}

PUSH="false"

for arg in $@; do
  case $arg in
    "--push")  PUSH="true"; shift;;
  esac
done


IMAGE_TAG=playtechnique/py-demo
IMAGE_VERSION=0.0.1
IMAGE_NAME="${IMAGE_TAG}:${IMAGE_VERSION}"

VERBOSE=${false#${VERBOSE}}


if [[ "$VERBOSE" = "true" ]]; then
  docker build . -t "${IMAGE_NAME}"
else
  docker build . -t "${IMAGE_NAME}" >/dev/null 2>&1
fi

echo "${IMAGE_NAME}"

if [[ "${PUSH}" = true ]]; then
  docker push "${IMAGE_NAME}"
fi
