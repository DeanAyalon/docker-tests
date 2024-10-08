#!/bin/sh

# Execution context
cd "$(dirname "$0")/exports"

# Container name
if [ -z "$1" ]; then
    echo Please specify a container to export
    exit 1
fi
container=$1

# Directory
docker export -o "$container.tar" "$container" || exit 1

# Extract
[ -d "$container" ] || mkdir "$container"
tar xf "$container.tar" -C "$container"