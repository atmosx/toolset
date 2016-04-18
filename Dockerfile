FROM ubuntu:16.04
MAINTAINER Panagiotis Atmatzidis <atma@convalesco.org>

ENV BATS_VERSION 0.4.0

RUN apt-get update -q \
	&& apt-get install -y -q bash make curl ca-certificates python kafkacat \
	&& curl -o "/tmp/v${BATS_VERSION}.tar.gz" -L \
		"https://github.com/sstephenson/bats/archive/v${BATS_VERSION}.tar.gz" \
	&& tar -x -z -f "/tmp/v${BATS_VERSION}.tar.gz" -C /tmp/ \
	&& bash "/tmp/bats-${BATS_VERSION}/install.sh" /usr/local \
	&& rm -rf /tmp/*
