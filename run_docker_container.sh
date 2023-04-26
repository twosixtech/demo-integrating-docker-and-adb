#!/usr/bin/env bash
# -----------------------------------------------------------------------------
# Run the Docker Container
#
# Arguments:
# N/A
#
# Example Call:
#    bash run_docker_container.sh
# -----------------------------------------------------------------------------

adb kill-server
adb -a nodaemon server start &> /dev/null &
docker-compose up -d
