# Build Stage:
FROM --platform=linux/amd64 ubuntu:20.04 as builder

## Install build dependencies.
RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y gcc

## Add Source Code
ADD . /md5
WORKDIR /md5

## Build Step
RUN gcc md5.c -o md5

# Package Stage
FROM debian:bullseye-slim
COPY --from=builder /md5/md5 /
