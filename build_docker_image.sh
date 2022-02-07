#!/usr/bin/env bash
# -----------------------------------------------------------------------------
# Build the Docker Image
#
# Arguments:
# N/A
#
# Example Call:
#    bash build_docker_image.sh
# -----------------------------------------------------------------------------

docker build -f "Dockerfile" -t adb-docker-demo .
