#!/usr/bin/env bash
set -euo pipefail

image="docker.io/grawradiosondes/whitepaper-base:latest"
podman build --platform linux/amd64 -t "$image" .
podman push "$image"
