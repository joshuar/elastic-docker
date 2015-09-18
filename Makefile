ES_VERSION=1.7.2
LS_VERSION=1.5.4
KB_VERSION=4.1.2

.PHONY: all elastic elasticsearch logstash kibana

all: elastic

elastic: elasticsearch logstash kibana

elasticsearch:
	./build.sh elasticsearch joshuar/elasticsearch:$(ES_VERSION)

logstash:
	./build.sh logstash joshuar/logstash:$(LS_VERSION)

kibana:
	./build.sh kibana joshuar/kibana:$(KB_VERSION)
