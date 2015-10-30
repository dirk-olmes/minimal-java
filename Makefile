all: build

build:
	docker build -t codedo/minimal-java:dockerfile .

run:
	docker run -it --rm codedo/minimal-java:dockerfile /bin/sh
