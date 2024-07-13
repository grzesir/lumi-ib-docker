#!/bin/bash

# Build the Docker image
docker build -t lumi-ib-docker .

# Stop and remove the existing container if it exists
docker stop ib-gateway-container 2>/dev/null
docker rm ib-gateway-container 2>/dev/null

# Run the new container with environment variables
docker run -d --name ib-gateway-container -p 4004:4004 --env-file .env lumi-ib-docker

# Display the running containers
docker ps

# Follow the logs of the new container
docker logs -f ib-gateway-container
