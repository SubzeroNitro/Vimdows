FROM alpine:latest

RUN apk -U upgrade
RUN apk -Ui add \
    build-base\
    mingw-w64-gcc \
    wget

RUN cd dev && \
    mkdir premake && \
    cd premake && \
    wget "https://github.com/premake/premake-core/releases/download/v5.0.0-beta2/premake-5.0.0-beta2-linux.tar.gz" && \
    tar xzf premake-5.0.0-beta2-linux.tar.gz && \
    rm premake-5.0.0-beta2-linux.tar.gz

WORKDIR "dev/host"
