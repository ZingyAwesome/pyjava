ARG         PYTHON_VERSION
ARG         JAVA_VERSION
FROM        --platform=$TARGETOS/$TARGETARCH eclipse-temurin:$JAVA_VERSION-jre-alpine as java

FROM        --platform=$TARGETOS/$TARGETARCH python:$PYTHON_VERSION-alpine

ENV         JAVA_HOME=/opt/java/openjdk
COPY        --from=java $JAVA_HOME $JAVA_HOME
ENV         PATH="${JAVA_HOME}/bin:${PATH}"

LABEL       author="ZingyAwesome" maintainer="development@zingyawesome.com"

LABEL       org.opencontainers.image.source="https://github.com/ZingyAwesome/pyjava"

RUN         apk add --update --no-cache cmake make ca-certificates curl g++ gcc git openssl sqlite tar tzdata gcompat tini libffi-dev zlib-dev jpeg-dev freetype-dev \
            && adduser -D -h /home/container container

USER        container
ENV         USER=container HOME=/home/container
WORKDIR     /home/container

STOPSIGNAL  SIGINT

COPY        --chown=container:container ./entrypoint.sh /entrypoint.sh
RUN         chmod +x /entrypoint.sh
ENTRYPOINT  ["/sbin/tini", "-g", "--"]
CMD         [ "/entrypoint.sh" ]
