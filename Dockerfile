FROM rust:1.76-alpine3.19

RUN apk upgrade --no-cache

RUN apk add --no-cache \
  alpine-sdk cmake mold samurai make protobuf-dev

RUN rustup target add aarch64-unknown-linux-musl

COPY build.sh mimalloc.diff /tmp/

RUN chmod +x /tmp/build.sh

RUN /tmp/build.sh

ENV LD_PRELOAD=/usr/lib/libmimalloc.so

# Build with:
# docker build -t mimalloc:latest -f Dockerfile .