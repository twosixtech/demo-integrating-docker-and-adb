#!/usr/bin/env bash
# -----------------------------------------------------------------------------
# Run the Docker Image
#
# Arguments:
# N/A
#
# Example Call:
#    bash run_docker_image.sh
# -----------------------------------------------------------------------------

adb kill-server
adb -a nodaemon server start &> /dev/null &
docker-compose up -d
