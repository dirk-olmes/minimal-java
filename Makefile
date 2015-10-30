image=codedo/minimal-java:dockerfile

all: build

build:
	docker build -t $(image) .

run:
	docker run -it --rm $(image) /bin/sh
