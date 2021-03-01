FROM anapsix/alpine-java:8

ENV VERSION=0.13.0
ENV JAR=jmx_prometheus_httpserver-$VERSION-distrib.jar

RUN apk update && apk upgrade && apk --update add curl && rm -rf /tmp/* /var/cache/apk/*

RUN mkdir -p /opt/exporter-jmx/bin && \
    mkdir -p /opt/exporter-jmx/configs && \
    curl -L https://repo1.maven.org/maven2/io/prometheus/jmx/jmx_prometheus_httpserver/$VERSION/$JAR -o /opt/exporter-jmx/bin/$JAR

COPY start.sh /opt/exporter-jmx/
COPY ./configs/* /opt/exporter-jmx/configs/

RUN chmod -R 775 /opt

CMD sh /opt/exporter-jmx/start.sh
