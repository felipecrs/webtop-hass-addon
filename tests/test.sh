#!/usr/bin/env bash

set -ex

script_dir=$(dirname "$0")
readonly script_dir

cd "${script_dir}"

docker compose build

trap 'docker compose down' EXIT

if docker compose up --wait; then
    echo "Container started healthily" >&2
else
    docker compose logs --no-log-prefix
    echo "Container failed to start healthily, see logs above" >&2
    exit 1
fi
