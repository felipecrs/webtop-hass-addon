#!/bin/bash

set -ex

if [[ -x /opt/webtop-hass-addon/custom-build/run.sh ]]; then
    exec /opt/webtop-hass-addon/custom-build/run.sh
fi
