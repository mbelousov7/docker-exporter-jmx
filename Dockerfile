FROM centos:latest

RUN yum update -y && yum install -y java-1.8.0-openjdk  gettext

ENV VERSION 0.14.0
ENV JAR jmx_prometheus_httpserver-$VERSION-jar-with-dependencies.jar

RUN mkdir -p /opt/exporter-jmx/bin && mkdir -p /opt/exporter-jmx/configs

RUN curl -L https://repo1.maven.org/maven2/io/prometheus/jmx/jmx_prometheus_httpserver/$VERSION/$JAR -o /opt/exporter-jmx/bin/$JAR

COPY start.sh /opt/exporter-jmx/
COPY ./configs/* /opt/exporter-jmx/configs/

CMD sh /opt/exporter-jmx/start.sh
