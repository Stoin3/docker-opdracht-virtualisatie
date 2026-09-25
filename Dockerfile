# Voornaam Achternaam: <jouw naam>
# Studentnummer: <jouw studentnummer>
# AI-gebruik: ChatGPT/Claude gebruikt voor het opstellen en controleren van dit Dockerfile

FROM ubuntu:22.04

LABEL maintainer="Stijn Barendse - 591527"

RUN apt-get update && apt-get install -y \
    curl \
    nano \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /app

COPY ./app /app

ENV MY_ENV_VAR="hallo ik ben een container hoi hoi"

EXPOSE 8080

RUN mkdir -p /app/logs /app/data
RUN useradd -m -d /home/appuser appuser
COPY ./config /app/config
ADD https://example.com/somefile.txt /app/downloads/somefile.txt
RUN chmod +x /app/*.sh || true
VOLUME ["/app/data"]
ARG BUILD_VERSION=1.0
RUN echo "Build versie: ${BUILD_VERSION}" > /app/version.txt
USER appuser
WORKDIR /home/appuser

CMD ["bash"]
