FROM alpine:latest

RUN echo "http://dl-cdn.alpinelinux.org/alpine/latest-stable/community/" | tee -a /etc/apk/repositories
RUN apk update
RUN apk add alpine-sdk build-base apk-tools alpine-conf busybox \
	fakeroot syslinux xorriso mtools dosfstools grub-efi make \
	git sudo

RUN adduser -h /home/build -D build -G abuild

RUN echo 'build ALL=(ALL) NOPASSWD: ALL' | tee -a /etc/sudoers

RUN git clone https://git.alpinelinux.org/cgit/aports/ /home/build/aports
RUN cd /home/build/aports && apk update

COPY ./scripts/mkimg.kvmhost.sh /home/build/aports/scripts/mkimg.kvmhost.sh
COPY ./scripts/create-image.sh /home/build/aports/scripts/create-image.sh

RUN chmod +x /home/build/aports/scripts/mkimg.kvmhost.sh
RUN chmod +x /home/build/aports/scripts/create-image.sh

USER build
RUN abuild-keygen -i -a -n
RUN cd ~

