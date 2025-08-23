#!/bin/bash

if [[ ! -S /var/run/docker.sock ]]; then
  echo "The add-on 'Protection mode' is enabled, not starting docker..." >&2
  export START_DOCKER=false
fi

exec /init "${@}"
