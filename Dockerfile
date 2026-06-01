#etapa 1
FROM debian:bookworm-slim AS downloader 

RUN apt-get update && \
    apt-get install -y wget tar 

WORKDIR /tmp

RUN wget https://github.com/ghusta/docker-postgres-world-db/raw/master/world.sql

RUN find /tmp -type f

#etapa 2
FROM postgres:17-alpine

COPY --from=downloader /tmp/dbsamples-0.1/world.sql \
/docker-entrypoint-initdb.d/world.sql