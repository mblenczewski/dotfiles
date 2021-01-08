#!/bin/sh

# this service script wont inherit our users env vars
XDG_RUNTIME_DIR=/run/user/$(id -u)
PULSE_RUNTIME_PATH="${XDG_RUNTIME_DIR}/pulse"

PULSE_ENV="env PULSE_RUNTIME_PATH=${PULSE_RUNTIME_PATH} XDG_RUNTIME_DIR=${PULSE_RUNTIME_DIR}"
PULSE="${PULSE_ENV} pulseaudio"
