FROM rust:1.76-alpine3.19

LABEL org.opencontainers.image.source=https://github.com/marvin-hansen/mimalloc
LABEL org.opencontainers.image.description="Docker base image using Microsoft mimalloc"
LABEL org.opencontainers.image.licenses=MIT

RUN apk upgrade --no-cache

RUN apk add --no-cache alpine-sdk cmake mold samurai make protobuf-dev

# Extra packages required to build for vendored (_`openssl-dev` + `openssl-libs-static` not required since `vendored` builds from source_):
# https://github.com/sfackler/rust-openssl/issues/1627
RUN apk add --no-cache make musl-dev perl

# Add musl build target
RUN rustup target add aarch64-unknown-linux-musl

# Add script and patch
COPY build.sh mimalloc.diff /tmp/

# Make script executable
RUN chmod +x /tmp/build.sh

# Run script to build mimalloc and patch default allocator to use mimalloc
RUN /tmp/build.sh

# Export environment variable to override default memory allocator
ENV LD_PRELOAD=/usr/lib/libmimalloc.so
