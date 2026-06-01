#etapa 1
FROM debian:bookworm-slim AS downloader 

RUN apt-get update && \
    apt-get install -y wget tar 

WORKDIR /tmp

RUN wget https://ftp.postgresql.org/pub/projects/pgFoundry/dbsamples/world/world-1.0/world-1.0.tar.gz

RUN tar -xzf world-1.0.tar.gz

#etapa 2
FROM postgres:17-alpine

COPY --from=downloader /tmp/dbsamples-0.1/world.sql \
/docker-entrypoint-initdb.d/world.sql