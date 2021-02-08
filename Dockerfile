FROM openjdk:11-slim
COPY --from=python:3.8-slim / /


LABEL       author="ZingyAwesome" maintainer="zingy@zingyawesome.com"

RUN apt-get update -y \
 && apt-get install -y ash make curl ca-certificates openssl git tar sqlite fontconfig tzdata iproute2 python3-dev gcc g++ libffi-dev \
 && useradd -d /home/container -m container

USER        container
ENV         USER=container HOME=/home/container

WORKDIR     /home/container

COPY        ./entrypoint.sh /entrypoint.sh

CMD         ["/bin/ash", "/entrypoint.sh"]
