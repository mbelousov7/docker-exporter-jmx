#!/bin/sh

if [ -z "$EXPORTER_PORT" ]; then
  EXPORTER_PORT=5555
fi

if [ -z "$HOST" ] || [ -z "$JMXURL" ]; then
  HOSTPORT="hostPort: localhost:5556"
fi

if [ "$HOST" ] || [ "$PORT" ]; then
  HOSTPORT="hostPort: $HOST:$PORT"
fi

if [ -z "$JVM_OPTS" ]; then
  JVM_OPTS=""
fi

if [ -z "$JMXURL" ]; then
  JMXURL=""
fi

if [ -z "$SSL" ]; then
  SSL=""
fi

if [ -z "$USERNAME" ]; then
  USERNAME=""
fi

if [ -z "$PASSWORD" ]; then
  PASSWORD=""
fi

if [ -z "$JMX_ROLE" ]; then
  JMX_ROLE=default
fi

#envsubst < /opt/exporter-jmx/configs/$JMX_ROLE.yml > /opt/exporter-jmx/default.yml
sed "s/INSTANCE/$HOST/g;s/HOSTPORT/$HOSTPORT/g;s/JMXURL/$JMXURL/g;s/SSL/$SSL/g;s/USERNAME/$USERNAME/g;s/PASSWORD/$PASSWORD/g" /opt/exporter-jmx/configs/$JMX_ROLE.yml > /opt/exporter-jmx/default.yml

if [ -z "$CONFIG_YAML" ]; then
  CONFIG_YAML=/opt/exporter-jmx/default.yml
fi

java $JVM_OPTS -jar /opt/exporter-jmx/bin/jmx_prometheus_httpserver.jar $EXPORTER_PORT $CONFIG_YAML
