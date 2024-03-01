#!/bin/bash

# Start mysql docker compose
cd mysql
docker compose up -d

# wait until mysql docker compose is fully initialized
while true; do
    if docker compose logs | grep -q "ready for connections"; then
        echo "Initialization done"
        sleep 5
        cd ..
        # Change directory to 'api' and start its Docker compose
        cd api
        docker compose up
        break
    else
        echo "Waiting for services to initialize..."
        sleep 2
    fi
done