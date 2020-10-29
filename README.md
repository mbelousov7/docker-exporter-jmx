# docker-exporter-jmx
docker JMX to Prometheus exporter

docker build -t drjetf/exporter-jmx:1.4.0 .
docker push drjetf/exporter-jmx:v1.4.0
docker run --rm -it -p "5555:5555" --name jmx drjetf/exporter-jmx:v1.2.0

docker run --rm -p "5555:5555" --name jmx \
-e EXPORTER_PORT=5555 -e HOST=host1 -e PORT=7777 \
drjetf/exporter-jmx:v1.4.0


docker exec -t 3954a3594158 /bin/bash


ENV variables in next format
<varibale from yaml>: <variable value>
for example
hostPort: localhost:5555
