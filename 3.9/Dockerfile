FROM        --platform=$TARGETOS/$TARGETARCH python:3.9-alpine

LABEL       author="ZingyAwesome" maintainer="development@zingyawesome.com"

LABEL       org.opencontainers.image.source="https://github.com/ZingyAwesome/pyjava"

RUN         apk add --update --no-cache cmake make ca-certificates curl g++ gcc git openssl sqlite tar tzdata gcompat libffi-dev zlib-dev jpeg-dev openjdk11-jre-headless \
				&& adduser -D -h /home/container container

USER        container
ENV         USER=container HOME=/home/container
WORKDIR     /home/container

COPY        ./../entrypoint.sh /entrypoint.sh
CMD         [ "/bin/ash", "/entrypoint.sh" ]