#!/bin/bash
# Start Hadoop + Spark cluster using plain Docker

# Clean up old containers
docker rm -f master worker1 worker2 >/dev/null 2>&1 || true

# Create network if not exists
docker network create hadoop-net >/dev/null 2>&1 || true

# Run master
docker run -itd \
  --network hadoop-net \
  --hostname master \
  --name master \
  -p 9870:9870 -p 8088:8088 -p 8080:8080 -p 7077:7077 \
  my-hadoop-cluster

# Run workers
docker run -itd \
  --network hadoop-net \
  --hostname worker1 \
  --name worker1 \
  my-hadoop-cluster

docker run -itd \
  --network hadoop-net \
  --hostname worker2 \
  --name worker2 \
  my-hadoop-cluster

echo "[OK] Hadoop + Spark cluster is running"
echo "Use: docker exec -it master bash"
