ES_VERSION=2.3.4
KB_VERSION=4.5.2

.PHONY: all base elastic elasticsearch kibana sense

all: base elastic

elastic: base elasticsearch kibana

base:
	cd base && docker build -t joshuar/elastic-base:latest .

elasticsearch: base
	cd elasticsearch && docker build --build-arg ES_VERSION=$(ES_VERSION) -t joshuar/elasticsearch:$(ES_VERSION) .

kibana: base
	cd kibana && docker build --build-arg KB_VERSION=$(KB_VERSION) -t joshuar/kibana:$(KB_VERSION) .

sense: base
	cd sense && docker build --build-arg KB_VERSION=$(KB_VERSION) -t joshuar/sense:$(KB_VERSION) .
