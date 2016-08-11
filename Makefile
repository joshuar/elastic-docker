ES_VERSION=2.3.5
KB_VERSION=4.5.4
KOPF_VERSION=2.1.1
GOSU_VERSION=1.9

.PHONY: all base elastic elasticsearch kibana sense elasticsearch-2 elasticsearch-5 elasticsearch-1 kibana-4 kibana-5

all: base elastic

elastic: base elasticsearch-2 kibana-4

base:
	cd base && docker build --build-arg GOSU_VERSION=$(GOSU_VERSION) -t joshuar/elastic-base:latest .

elasticsearch: elasticsearch-2

elasticsearch-5: base
	cd elasticsearch && docker build --build-arg ES_VERSION=$(ES_VERSION) -t joshuar/elasticsearch:$(ES_VERSION) -f Dockerfile-5

elasticsearch-2: base
	cd elasticsearch && docker build --build-arg ES_VERSION=$(ES_VERSION) -t joshuar/elasticsearch:$(ES_VERSION) .

elasticsearch-1: base
	cd elasticsearch && docker build --build-arg ES_VERSION=$(ES_VERSION) -t joshuar/elasticsearch:$(ES_VERSION) -f Dockerfile-1

kibana: kibana-4

kibana-5: base
	cd kibana && docker build --build-arg KB_VERSION=$(KB_VERSION) -t joshuar/kibana:$(KB_VERSION) -f Dockerfile-5

kibana-4: base
	cd kibana && docker build --build-arg KB_VERSION=$(KB_VERSION) -t joshuar/kibana:$(KB_VERSION) .

sense: base
	cd sense && docker build --build-arg KB_VERSION=$(KB_VERSION) -t joshuar/sense:$(KB_VERSION) .

kopf: base
	cd kopf && docker build --build-arg KOPF_VERSION=$(KOPF_VERSION) -t joshuar/kopf:$(KOPF_VERSION) .
