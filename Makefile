image=codedo/minimal-java:shell

all: build

build:
	./prepare.sh
	docker build -t $(image) .

run:
	docker run -it --rm $(image) /bin/sh
