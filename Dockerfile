# Use the official MySQL image as the base image
FROM mysql

# Copy the SQL script to initialize the database
COPY ./init.sql /docker-entrypoint-initdb.d/
# COPY ./check-script.sh .
# CMD [ "chmod", "+x", "check-script.sh"]