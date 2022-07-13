FROM ubuntu:focal-20220531

MAINTAINER Panagiotis Atmatzidis <atma@convalesco.org>

RUN apt-get update -q
RUN apt-get install -y -q curl ca-certificates jq iputils-ping netcat-openbsd nmap wget gnupg2
RUN wget -qO - https://www.mongodb.org/static/pgp/server-5.0.asc | apt-key add - && \
    echo "deb [ arch=amd64,arm64 ] https://repo.mongodb.org/apt/ubuntu focal/mongodb-org/5.0 multiverse" | tee /etc/apt/sources.list.d/mongodb-org-5.0.list
RUN apt-get update -q
RUN apt-get install --only-upgrade mongocli
RUN curl -1sLf 'https://packages.vectorized.io/nzc4ZYQK3WRGd9sy/redpanda/cfg/setup/bash.deb.sh' | bash && \
    apt install redpanda -y
