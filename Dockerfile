ARG BASE_IMAGE="openjdk:18-alpine"
FROM --platform=linux/amd64 ${BASE_IMAGE}

LABEL maintainer="cchuyong@naver.com"
LABEL title="magcloud-backend"

WORKDIR /usr/src/app

COPY ./app.jar .

ENV PORT=8080
EXPOSE ${PORT}/tcp

STOPSIGNAL SIGTERM

ENTRYPOINT ["java","-XX:+AlwaysPreTouch","-XX:+UseG1GC","-XX:MaxGCPauseMillis=400","-server","-XX:InitialHeapSize=2g","-XX:MaxHeapSize=2g","-Xms2G","-Xmx2G","-jar","app.jar"]

