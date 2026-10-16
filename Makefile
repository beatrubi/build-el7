RUNTIME:=$(shell which podman || which docker)
IMAGE:=build-el7:latest

all: container

container:
	$(RUNTIME) build -t $(IMAGE) .

run:
	$(RUNTIME) run -ti --rm $(IMAGE)
