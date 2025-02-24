FROM ubuntu:24.04
ARG FLAC_VERSION=1.4.3+ds-2.1ubuntu2

LABEL org.opencontainers.image.authors="Ieuan Jenkins hi@ieuan.net"
LABEL org.opencontainers.image.source="https://github.com/jensyseng/audio-archiver"
LABEL org.opencontainers.image.title="audio-archiver"
LABEL org.opencontainers.image.description="An image for managing the archiving/restoring of audio recordings from/to WAV/FLAC"

RUN apt-get update \
  && apt-get upgrade -y  \
  && apt-get install --no-install-recommends -y flac=${FLAC_VERSION} \
  && rm -rf /var/lib/apt/lists/*

USER ubuntu
WORKDIR /workdir
