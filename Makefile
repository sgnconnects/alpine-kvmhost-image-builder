all: docker_build docker_run docker_getfile
cleanall: clean deep_clean

docker_build:
	sudo docker build -t alpine-builder .

docker_run:
	sudo docker run --name alpinebuilder alpine-builder sh /home/build/aports/scripts/create-image.sh

docker_getfile:
	sudo docker cp alpinebuilder:/home/build/alpine-kvmhost-latest-x86_64.iso .

clean:
	sudo docker stop alpinebuilder
	sudo docker rm alpinebuilder

deep_clean:
	sudo docker rmi alpine-builder
	rm -rf alpine-kvmhost-latest-x86_64.iso
