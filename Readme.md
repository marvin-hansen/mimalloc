# Rust Build Image with MOLD linker and mimalloc allocator.

**Build image with:**
> docker build -t  hansenmarvin/rust-build:1.76-alpine -f Dockerfile .

**Push image to Dockerhub with:**
> docker push hansenmarvin/rust-build:1.76-alpine


## Sources:

Kerkour Blog: [How to create small Docker images for Rust](https://kerkour.com/rust-small-docker-image)

Emerson Gomes: [Testing Alternative C Memory Allocators Pt 2: The MUSL mystery](https://www.linkedin.com/pulse/testing-alternative-c-memory-allocators-pt-2-musl-mystery-gomes)

TWEAG Blog: [SUPERCHARGING YOUR RUST STATIC EXECUTABLES WITH MIMALLOC](https://www.tweag.io/blog/2023-08-10-rust-static-link-with-mimalloc/)

GITHUB: [rust-alpine-mimalloc](https://github.com/tweag/rust-alpine-mimalloc)



