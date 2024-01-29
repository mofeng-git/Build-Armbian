

if [ ! -f "cache/rootfs/ArchLinuxARM-2023.03-odroid-c1-rootfs.tar.gz" ];then
  curl -L -o cache/rootfs/ArchLinuxARM-armv7-latest.tar.gz https://mirrors.tuna.tsinghua.edu.cn/archlinuxarm/os/ArchLinuxARM-armv7-latest.tar.gz
fi

if [ ! -d "/tmp/amlimg" ];then
  mkdir /tmp/amlimg
fi

CURRENTWD=$PWD
shopt -s extglob

diskimg=$1
loop=$(losetup -f)
sudo losetup  --show --partscan $loop $diskimg
sudo mount ${loop}p2 /tmp/amlimg
cd /tmp/amlimg && cp -f ./etc/fstab /tmp/fstab && sudo rm -rf  bin  boot  dev  etc  home  lib64  lost+found  media  selinux  mnt  opt  proc  root  run  sbin  srv  sys  tmp    var
cd usr  && sudo rm -rf bin  games  include    libexec  local  sbin  share  src
cd lib && sudo rm -rf !(modules|firmware)
#cd ../
#sudo mv firmware firmware-backup
sudo tar -zxvf $CURRENTWD/cache/rootfs/ArchLinuxARM-armv7-latest.tar.gz -C /tmp/amlimg 2> /dev/null
sudo cp -f  /tmp/fstab ../../etc/fstab && sudo rm -rf ../../boot/*
#sudo rm -rf firmware ./modules/3.10.107-5-ARCH ./modules/extramodules-3.10--odroid-c1  && sudo  mv firmware-backup firmware
sudo umount ${loop}p2
sudo losetup -d $loop
sudo rm -rf /tmp/amlimg
sduo rm /tmp/fstab