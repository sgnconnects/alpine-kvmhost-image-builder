all: docker_build docker_run docker_getfile
cleanall: clean deep_clean

docker_build:
	docker build -t alpine-builder .

docker_run:
	docker run --name alpinebuilder alpine-builder sh /home/build/aports/scripts/create-image.sh

docker_getfile:
	docker cp alpinebuilder:/home/build/alpine-kvmhost-latest-x86_64.iso .

clean:
	docker stop alpinebuilder
	docker rm alpinebuilder

deep_clean:
	docker rmi alpine-builder
	rm -rf alpine-kvmhost-latest-x86_64.iso

test:
	sh scripts/test-image.sh
