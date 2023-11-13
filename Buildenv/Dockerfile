FROM debian:latest

ARG PREMAKE_VERSION=5.0.0
ARG PREMAKE_PATH="/bin/premake"

ENV PATH="$PATH:${PREMAKE_PATH}"

RUN apt update && \
    apt upgrade -y && \
    apt install -y build-essential mingw-w64 wget

WORKDIR ${PREMAKE_PATH}

RUN wget -q https://github.com/premake/premake-core/releases/download/v${PREMAKE_VERSION}-beta2/premake-${PREMAKE_VERSION}-beta2-linux.tar.gz && \
    tar -xzf premake-${PREMAKE_VERSION}-beta2-linux.tar.gz && \
    rm premake-${PREMAKE_VERSION}-beta2-linux.tar.gz

WORKDIR "/root/host"
