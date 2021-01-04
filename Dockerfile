FROM ubuntu:20.04 AS build

ENV DEBIAN_FRONTEND=noninteractive

RUN set -x \
	&& apt-get update \
	&& apt-get -y upgrade \
	&& apt-get -y install tclsh pkg-config cmake libssl-dev build-essential zlib1g-dev

COPY srt /app/srt
COPY srt-live-server /app/srt-live-server

WORKDIR /app/srt

RUN ./configure && make && make install

WORKDIR /app/srt-live-server

RUN make
