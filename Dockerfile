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

CMD ["bash"]