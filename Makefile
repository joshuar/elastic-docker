ES_VERSION=2.1.0
KB_VERSION=4.2.1

.PHONY: all elastic elasticsearch kibana

all: elastic

elastic: elasticsearch kibana

elasticsearch:
	./build.sh elasticsearch joshuar/elasticsearch:$(ES_VERSION)

kibana:
	./build.sh kibana joshuar/kibana:$(KB_VERSION)
