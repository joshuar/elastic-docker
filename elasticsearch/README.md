### Build

```
tar -czh . | docker build -t joshuar/elasticsearch:x.x.x -
```

Where `x.x.x` is the Elasticsearch version you are building.

### Run

```
sudo docker run -d -p 9200:9200/tcp -p 9300:9300/tcp \
   joshuar/elasticsearch:x.x.x
```

You may want to mount the data, config, logs and plugins directories
somewhere on the host:

```
sudo docker run -d -p 9200:9200/tcp -p 9300:9300/tcp \
  -v /var/lib/docker/es/data:/opt/elasticsearch/data
  -v /var/lib/docker/es/config:/opt/elasticsearch/config
  -v /var/lib/docker/es/logs:/opt/elasticsearch/logs
  -v /var/lib/docker/es/plugins:/opt/elasticsearch/plugins
  joshuar/elasticsearch:x.x.x
```

You can pass environment variables (like `ES_HEAP_SIZE`) with the `-e`
option to `docker run`:

```
sudo docker run -d -p 9200:9200/tcp -p 9300:9300/tcp \
  -e ES_HEAP_SIZE=8g \
  -e ES_JAVA_OPTS="-Des.logger.level=DEBUG" \
   joshuar/elasticsearch:x.x.x
```
