#!/bin/bash -e

sudo docker build -t deepin-shim-review .

id=$(sudo docker create deepin-shim-review)
sudo docker cp $id:/build/shimia32.efi .
sudo docker cp $id:/build/shimia32.cab .
sudo docker rm -v $id

sha256sum -c shimia32.efi.sha256sum

echo "To remove the container image used for this build: sudo docker image rm deepin-shim-review"

