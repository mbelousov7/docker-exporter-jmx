# docker-exporter-jmx
docker JMX to Prometheus exporter

docker build -t drjetf/exporter-jmx .
docker run --rm -p "5556:5556" drjetf/exporter-jmx

ENV variables in next format
<varibale from yaml>: <variable value>
for example
hostPort: localhost:5555
