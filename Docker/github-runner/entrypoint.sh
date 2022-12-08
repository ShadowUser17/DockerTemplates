#!/bin/sh

./config.sh \
--name "${RUNNER_NAME}" \
--url "${RUNNER_REPOSITORY}" \
--work "${RUNNER_WORK_DIRECTORY}" \
--token "${RUNNER_TOKEN}" \
--unattended \
--replace

remove() {
    ./config.sh remove --unattended --token "${RUNNER_TOKEN}"
}

trap 'remove; exit 130' INT
trap 'remove; exit 143' TERM

./run.sh "$*" &
wait $!
