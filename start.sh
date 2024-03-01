#!/bin/bash

# Start mysql docker compose
docker compose up -d

# wait until mysql docker compose is fully initialized
while true; do
    if docker compose logs | grep -q "ready for connections"; then
        echo "Initialization done"
        sleep 5
        cd api
        # Change directory to 'api' and start its Docker compose
        docker compose up
        break
    else
        echo "Waiting for services to initialize..."
        # for _ in {1..3}; do
        #     echo -e "."
        #     sleep 0.5
        # done
        sleep 2
    fi
done



# Change directory to 'api' and start its Docker compose
# cd api
# docker compose up
