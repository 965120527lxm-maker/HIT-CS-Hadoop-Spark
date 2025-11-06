#!/bin/bash
# Stop and remove all Hadoop cluster containers

docker stop master worker1 worker2 >/dev/null 2>&1 || true
docker rm master worker1 worker2 >/dev/null 2>&1 || true

echo "Cluster containers removed."
