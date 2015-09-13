ES_VERSION=1.7.1
LS_VERSION=1.5.4
KB_VERSION=4.1.2

.PHONY: all elastic elasticsearch logstash kibana

all: elastic

elastic: elasticsearch logstash kibana

elasticsearch:
	cd elasticsearch && tar -czh . | docker build -t joshuar/elasticsearch:$(ES_VERSION) -

logstash:
	cd logstash && tar -czh . | docker build -t joshuar/logstash:$(LS_VERSION) -

kibana:
	cd kibana4 && docker build -t joshuar/kibana:$(KB_VERSION) .
