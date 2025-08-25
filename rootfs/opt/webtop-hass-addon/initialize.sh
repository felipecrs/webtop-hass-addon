#!/bin/bash

set -eu

if [[ -x /addon_config/initialize.sh ]]; then
  if ! /addon_config/initialize.sh; then
    echo "Error: /addon_config/initialize.sh failed." >&2
    exec "${SHELL}"
  fi
fi
