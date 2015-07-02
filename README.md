## Building

You can use the provided Makefile.  To build all images, just run
`make all`.

See the README files in each directory for manual building instructions.

### Elastic Products

Run `make elastic` to make Elasticsearch, Logstash and Kibana images,
or run `make` with the individual targets `elasticsearch`, `logstash`
or `kibana` to build them individually.
