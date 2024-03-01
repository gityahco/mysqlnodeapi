#!/bin/bash

# Start the main Docker compose
docker compose up -d

# check_ready() {
#     docker compose logs | grep "ready for connections"
# }

# # Wait until services are fully initialized
# while check_ready; do
#     echo "Waiting for services to initialize..."
#     sleep 1
# done
# echo "Initialization done"
while true; do
    if docker compose logs | grep -q "ready for connections"; then
        echo "Initialization done"
        sleep 5
        cd api
        docker compose up
        break
    else
        echo -n "Waiting for services to initialize"
        for _ in {1..3}; do
            echo -n "."
            sleep 0.5
        done

    fi
done



# # Change directory to 'api' and start its Docker compose
# cd api
# docker compose up
