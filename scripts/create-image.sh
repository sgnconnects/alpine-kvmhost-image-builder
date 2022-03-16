#! /bin/sh

scripts_path="/home/build/aports/scripts"

outdir="/home/build/"
arch="x86_64"
repository="https://dl-cdn.alpinelinux.org/alpine/latest-stable/main"
extrarepository="https://dl-cdn.alpinelinux.org/alpine/latest-stable/community"
profilename="kvmhost"

sh $scripts_path/mkimage.sh --tag latest \
--outdir $outdir \
--arch $arch \
--repository $repository \
--extra-repository $extrarepository \
--profile $profilename

