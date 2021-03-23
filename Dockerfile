FROM postgres:12

MAINTAINER Krasen Penchev <hello@krasenpenchev.com>

COPY bg_ispell /tmp/bg_ispell
WORKDIR /tmp/bg_ispell

RUN cp ./* `pg_config --sharedir`/tsearch_data/

ADD ./initdb.sh /docker-entrypoint-initdb.d/initdb.sh
RUN chmod +x /docker-entrypoint-initdb.d/initdb.sh
