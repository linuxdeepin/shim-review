FROM debian:bookworm-20220711

RUN apt update -y && \
    DEBIAN_FRONTEND=noninteractive apt install -y bsdmainutils gcc git lcab make dos2unix curl bzip2 quilt

RUN mkdir /build
COPY . orig
COPY  patches/*.patch build_shim UOS-UEFI-RSA.der sbat.uos.csv  /build/
    
WORKDIR /build

RUN chmod +x build_shim && \
    ./build_shim

WORKDIR /


