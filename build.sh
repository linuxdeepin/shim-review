#!/bin/bash -e

sudo docker build -t uos-shim-review .

id=$(sudo docker create uos-shim-review)

arch=`uname -m`
if  [ $arch = "x86_64" ];then
	sudo docker cp $id:/build/shimx64.efi .
	sudo docker cp $id:/build/shimx64.cab .
	sudo docker cp $id:/build/shimx64.cksum .
	sha256sum -c shimx64.cksum
elif [ $arch = "aarch64" ];then
	sudo docker cp $id:/build/shimaa64.efi .
	sudo docker cp $id:/build/shimaa64.cab .
	sudo docker cp $id:/build/shimaa64.cksum .
	sha256sum -c shimaa64.cksum
fi

sudo docker rm -v $id

echo "To remove the container image used for this build: sudo docker image rm uos-shim-review"

