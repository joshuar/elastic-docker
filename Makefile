ES_5=5.3.0
KB_5=5.3.0
ES_2=2.4.3
KB_2=4.6.3
ES_1=1.7.5
KB_1=4.1.11
GOSU_VERSION=1.10

.PHONY: all base elastic elasticsearch kibana sense elasticsearch-2 elasticsearch-5 elasticsearch-1 kibana-2 kibana-5 kibana-1

all: base elastic

elastic: base elasticsearch-2 kibana-4

base:
	docker build --rm --build-arg GOSU_VERSION=$(GOSU_VERSION) -t joshuar/gosu:latest -f base/gosu/Dockerfile base/gosu
	docker build --rm -t joshuar/java:latest -f base/java/Dockerfile base/java

elasticsearch: elasticsearch-2

elasticsearch-5: base
	cd elasticsearch && docker build --rm --build-arg ES_VERSION=$(ES_5) -t joshuar/elasticsearch:$(ES_5) -f Dockerfile-5 .

elasticsearch-2: base
	cd elasticsearch && docker build --rm --build-arg ES_VERSION=$(ES_2) -f Dockerfile-2 -t joshuar/elasticsearch:$(ES_2) .

elasticsearch-1: base
	cd elasticsearch && docker build --rm --build-arg ES_VERSION=$(ES_1) -t joshuar/elasticsearch:$(ES_1) -f Dockerfile-1 .

kibana: kibana-2

kibana-5: base
	cd kibana && docker build --rm --build-arg KB_VERSION=$(KB_5) -t joshuar/kibana:$(KB_5) -f Dockerfile-5 .

kibana-2: base
	cd kibana && docker build --rm --build-arg KB_VERSION=$(KB_2) -f Dockerfile-2 -t joshuar/kibana:$(KB_2) .

kibana-1: base
	cd kibana && docker build --rm --build-arg KB_VERSION=$(KB_1) -t joshuar/kibana:$(KB_1) -f Dockerfile-1 .
