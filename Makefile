ES_VERSION=2.2.0
KB_VERSION=4.4.0

.PHONY: all elastic elasticsearch kibana

all: base elastic

elastic: base elasticsearch kibana

base:
	cd elastic-base && docker build -t joshuar/elastic-base:latest .

elasticsearch:
	cd elasticsearch && docker build -t joshuar/elasticsearch:$(ES_VERSION) .

kibana:
	cd kibana && docker build -t joshuar/kibana:$(KB_VERSION) .

curator:
	cd curator && docker build -t joshuar/curator:latest .
