#!/bin/sh

if [ -z "$EXPORTER_PORT" ]; then
  EXPORTER_PORT=5556
fi

if [ -z "$JMX_PORT" ]; then
  JMX_PORT=5555
fi

if [ -z "$JMX_HOST" ]; then
  JMX_HOST=localhost
fi

if [ -z "$JVM_OPTS" ]; then
  JVM_OPTS=""
fi

if [ -z "$JMX_ROLE" ]; then
  JMX_ROLE=default
fi

sed "s/HOSTPORT/$JMX_HOST:$JMX_PORT/g" /opt/exporter-jmx/configs/$JMX_ROLE.yaml > /opt/exporter-jmx/config.yaml

if [ -z "$CONFIG_YAML" ]; then
  CONFIG_YAML=/opt/exporter-jmx/config.yaml
fi

java $JVM_OPTS -jar /opt/exporter-jmx/bin/jmx_prometheus_httpserver-$VERSION-jar-with-dependencies.jar $EXPORTER_PORT $CONFIG_YAML
