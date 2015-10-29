ES_VERSION=2.0.0
LS_VERSION=2.0.0
KB_VERSION=4.2.0

.PHONY: all elastic elasticsearch logstash kibana

all: elastic

elastic: elasticsearch logstash kibana

elasticsearch:
	./build.sh elasticsearch joshuar/elasticsearch:$(ES_VERSION)

logstash:
	./build.sh logstash joshuar/logstash:$(LS_VERSION)

kibana:
	./build.sh kibana joshuar/kibana:$(KB_VERSION)
