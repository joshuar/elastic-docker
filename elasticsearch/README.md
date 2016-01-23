### Details

Containerized Elasticsearch Instance.  The following non-free plugins
are included:

* marvel-agent
* watcher
* shield

A license is not provided.

### Build

```
tar -czh . | docker build -t joshuar/elasticsearch:x.x.x -
```

Where `x.x.x` is the Elasticsearch version you are building.

### Run

```
sudo docker run --name elasticsearch -d -p 9200:9200/tcp -p 9300:9300/tcp \
   joshuar/elasticsearch:x.x.x
```

You may want to mount the data, config and logs directories
somewhere on the host:

```
sudo docker run --name elasticsearch -d -p 9200:9200/tcp -p 9300:9300/tcp \
  -v /path/to/es/data:/opt/elasticsearch/data:Z \
  -v /path/to/es/config:/opt/elasticsearch/config:Z \
  -v /path/to/es/logs:/opt/elasticsearch/logs:Z
  joshuar/elasticsearch:x.x.x
```

You can pass environment variables (like `ES_HEAP_SIZE`) with the `-e`
option to `docker run`:

```
sudo docker run --name elasticsearch -d -p 9200:9200/tcp -p 9300:9300/tcp \
  -e ES_HEAP_SIZE=8g \
  -e ES_JAVA_OPTS="-Des.logger.level=DEBUG" \
  -v /path/to/es/data:/opt/elasticsearch/data:Z \
  -v /path/to/es/config:/opt/elasticsearch/config:Z \
  -v /path/to/es/logs:/opt/elasticsearch/logs:Z \
  joshuar/elasticsearch:x.x.x
```

You can also pass command-line options for Elasticsearch itself to
`docker run`:

```
sudo docker run --name elasticsearch -d -p 9200:9200/tcp -p 9300:9300/tcp \
  joshuar/elasticsearch:x.x.x elasticsearch \
  -v /path/to/es/data:/opt/elasticsearch/data:Z \
  -v /path/to/es/config:/opt/elasticsearch/config:Z \
  -v /path/to/es/logs:/opt/elasticsearch/logs:Z \
  --cluster.name my_cluster_name \
  --node.name my_node_name
```
