# Official releases: https://hub.docker.com/_/rust
# FROM rust:1.77-alpine3.19

# Update tags in build.yaml when updating to new Rust version.
# Rust version: 1.77
# Alpine version: 3.19
# Cargo-Chef version: 0.1.66
#
# Official releases: https://hub.docker.com/r/lukemathwalker/cargo-chef
FROM lukemathwalker/cargo-chef:0.1.66-rust-1.77-alpine3.19

# Update apk packagte list
RUN apk upgrade --no-cache

# Add build dependencies
RUN apk add --no-cache alpine-sdk cmake mold samurai make protoc protobuf-dev musl-dev

# Add musl build target for ARM64 linux
RUN rustup target add aarch64-unknown-linux-musl

# Add musl build target for Intel/AMD linux
RUN rustup target add x86_64-unknown-linux-musl

# Add script and patch
COPY build.sh mimalloc.diff /tmp/

# Make script executable
RUN chmod +x /tmp/build.sh

# Run script to build mimalloc and patch default allocator to use mimalloc
RUN /tmp/build.sh

# Export environment variable to override default memory allocator
ENV LD_PRELOAD=/usr/lib/libmimalloc.so
