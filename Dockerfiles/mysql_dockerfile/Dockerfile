FROM mysql:latest
COPY toystore-test.sql toystore-test.sql
ARG root_pass 
ENV MYSQL_ROOT_PASSWORD=$root_pass 
COPY docker-entrypoint.sh  /usr/local/bin/docker-entrypoint.sh

