# docker-exporter-jmx
docker JMX to Prometheus exporter


#Examples
```
docker build -t drjetf/exporter-jmx:v1.7.0 .
docker push drjetf/exporter-jmx:v1.7.0
docker run --rm -it -p "5555:5555" --name jmx drjetf/exporter-jmx:v1.2.0

docker run --rm -p "5555:5555" --name jmx \
-e JMX_ROLE=default -e HOST=host1 -e PORT=7777 \
drjetf/exporter-jmx:v1.7.0

docker run --rm -it -p "5555:5555" --name jmx \
-e JMX_ROLE=default -e HOST=host1 -e PORT=7777 \
drjetf/exporter-jmx:v1.7.0


docker exec -t jmx /bin/bash
docker exec jmx cat opt/exporter-jmx/default.yml
```

#Enviroments
ENV variables in next format
<varibale from yaml>: <variable value>
for example
hostPort: localhost:5555

##env HOST is mandatory to set
