# Voornaam Achternaam: <jouw naam>
# Studentnummer: <jouw studentnummer>
# AI-gebruik: ChatGPT/Claude gebruikt voor het opstellen en controleren van dit Dockerfile

FROM nginx:alpine

LABEL maintainer="Stijn Barendse - 591527"

RUN apk update && apk add --no-cache curl nano

WORKDIR /usr/share/nginx/html

RUN rm -rf ./*

COPY ./app/index.html .

RUN mkdir -p /app/logs /app/data

RUN sed -i 's/listen       80;/listen       8080;/' /etc/nginx/conf.d/default.conf

ENV MY_ENV_VAR="hallo ik ben een container hoi hoi"

EXPOSE 8080

ARG BUILD_VERSION=1.0
RUN echo "Build versie: ${BUILD_VERSION}" > /usr/share/nginx/html/version.txt

VOLUME ["/app/data"]

CMD ["nginx", "-g", "daemon off;"]