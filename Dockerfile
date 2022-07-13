FROM ubuntu:focal-20220531

MAINTAINER Panagiotis Atmatzidis <atma@convalesco.org>

RUN export DEBIAN_FRONTEND=noninteractive
RUN apt update -q
RUN apt install curl gnupg2 -y
RUN curl -1sLf 'https://packages.vectorized.io/nzc4ZYQK3WRGd9sy/redpanda/cfg/setup/bash.deb.sh' | bash
RUN curl -1sLf https://www.mongodb.org/static/pgp/server-5.0.asc | apt-key add - && \
    echo "deb [ arch=amd64,arm64 ] https://repo.mongodb.org/apt/ubuntu focal/mongodb-org/5.0 multiverse" | tee /etc/apt/sources.list.d/mongodb-org-5.0.list
RUN apt update -q
RUN apt-get install mongocli ca-certificates jq iputils-ping netcat-openbsd nmap dnsutils bind9-utils redpanda -o Dpkg::Options::="--force-confold" -y -q
