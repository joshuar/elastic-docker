ES_2=2.4.1
KB_2=4.6.1
ES_1=1.7.5
KB_1=4.1.11
GOSU_VERSION=1.10

.PHONY: all base elastic elasticsearch kibana sense elasticsearch-2 elasticsearch-5 elasticsearch-1 kibana-2 kibana-5 kibana-1

all: base elastic

elastic: base elasticsearch-2 kibana-4

base:
	cd base && docker build --rm --build-arg GOSU_VERSION=$(GOSU_VERSION) -t joshuar/elastic-base:latest .

elasticsearch: elasticsearch-2

elasticsearch-5: base
	cd elasticsearch && docker build --rm --build-arg ES_VERSION=$(ES_VERSION) -t joshuar/elasticsearch:$(ES_VERSION) -f Dockerfile-5

elasticsearch-2: base
	cd elasticsearch && docker build --rm --build-arg ES_VERSION=$(ES_2) -f Dockerfile-2 -t joshuar/elasticsearch:$(ES_2) .

elasticsearch-1: base
	cd elasticsearch && docker build --rm --build-arg ES_VERSION=$(ES_1) -t joshuar/elasticsearch:$(ES_1) -f Dockerfile-1 .

kibana: kibana-2

kibana-5: base
	cd kibana && docker build --rm --build-arg KB_VERSION=$(KB_VERSION) -t joshuar/kibana:$(KB_VERSION) -f Dockerfile-5

kibana-2: base
	cd kibana && docker build --rm --build-arg KB_VERSION=$(KB_2) -f Dockerfile-2 -t joshuar/kibana:$(KB_2) .

kibana-1: base
	cd kibana && docker build --rm --build-arg KB_VERSION=$(KB_1) -t joshuar/kibana:$(KB_1) -f Dockerfile-1 .
