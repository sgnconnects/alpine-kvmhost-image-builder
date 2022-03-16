#Docker container to build KVM host on Alpine Linux Standard

simply run `make`. Or `sudo make` or `doas make` depending on your docker setup.

You should get an iso file ready to be used for a KVM host on Alpine Linux Standard.

at the end use `make clean` to clear the docker containers. You can also use `make cleanall` to also remove the docker images and the iso file. Do not forget sudo or doas if required.

No license
