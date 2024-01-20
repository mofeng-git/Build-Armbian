#!/bin/bash

sudo apt install img2simg

if [ ! -d "output/amlimg" ];then
  mkdir output/amlimg
fi

if [ ! -d "/tmp/amlimg" ];then
  mkdir /tmp/amlimg
fi

if [ ! -f "output/amlimg/AmlImg" ];then
  curl -L -o output/amlimg/AmlImg https://github.com/hzyitc/AmlImg/releases/download/v0.3.1/AmlImg_v0.3.1_linux_amd64
  chmod +x output/amlimg/AmlImg
fi

if [ ! -f "output/amlimg/eMMC.burn.img" ];then
  curl -L -o output/amlimg/eMMC.burn.img https://github.com/hzyitc/u-boot-onecloud/releases/download/build-20221028-0940/eMMC.burn.img
fi

#if [ ! -f "packages/bsp/aml-s812/eMMC.burn.img" ];then
  #exit 0
#fi

diskimg=$1
loop=$(losetup -f)
./output/amlimg/AmlImg unpack output/amlimg/eMMC.burn.img output/amlimg
sudo losetup  --show --partscan $loop $diskimg
sudo img2simg ${loop}p1 output/amlimg/boot.simg
sudo img2simg ${loop}p2 output/amlimg/rootfs.simg
sudo losetup -d $loop
#sudo chown $(id -u):$(id -g) -R output/amlimg/


cat <<EOF >>output/amlimg/commands.txt
PARTITION:boot:sparse:boot.simg
VERIFY:boot:normal:boot.VERIFY
PARTITION:rootfs:sparse:rootfs.simg
VERIFY:rootfs:normal:rootfs.VERIFY
EOF

echo -n "sha1sum $(sha1sum output/amlimg/boot.simg | awk '{print $1}')" >output/amlimg/boot.VERIFY
echo -n "sha1sum $(sha1sum output/amlimg/rootfs.simg | awk '{print $1}')" >output/amlimg/rootfs.VERIFY

burnimg=$diskimg.burn.img
./output/amlimg/AmlImg pack $burnimg output/amlimg/
echo "complete! File:$burnimg"
#pixz -9 <$burnimg >${burnimg}.xz
