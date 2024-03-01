#!/bin/bash

# Start mysql docker compose
cd mysql/
pwd
docker compose up -d
cd ..
pwd

# wait until mysql docker compose is fully initialized
while true; do
    if docker compose logs | grep -q "ready for connections"; then
        echo "Initialization done"
        sleep 5
        # Change directory to 'api' and start its Docker compose
        cd api
        pwd
        docker compose up
        break
    else
        echo "Waiting for services to initialize..."
        sleep 2
    fi
done