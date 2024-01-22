<h3 align=center><img src="https://github.com/mofeng-git/Build-Armbian/assets/62919083/add9743a-0987-4e8a-b2cb-62121f236582" alt="logo" width="300"><br></h3>
<h3 align=center><a href="https://github.com/mofeng-git/Build-Armbian/blob/master/README.md">简体中文</a>  ||  <a href="https://github.com/mofeng-git/Build-Armbian/blob/master/README-English.md">English</a></h3>
<p align=right>&nbsp;</p>

## What does the project do?

- Fork from [Build-Armbian Leo357449107](https://github.com/Leo357449107/Build-Armbian/tree/20.11), builds custom Debian-based Linux systems for OneCloud;
- Includes full process support for root filesystem generation, kernel image compilation, and bootloader compilation and image packaging;
- Building OTG-enabled Armbain images for long-term stable operation of OneCloud, and providing basic system support for PiKVM (One-KVM) project.
- 
## Getting started
> This branch is older and not well supported. OneCloud board has entered the official support of Armbian, if you need , you can visit the related projects: [armbian-build](https://github.com/armbian/build) or [armbian-onecloud](https://github.com/hzyitc/armbian-onecloud).

> The author tests only one option for this branch of the OneCloud (BOARD=aml-s812 BRANCH=current RELEASE=jammy BUILD_MINIMAL=yes), and does not deal with the availability of other options.

> The compiled images will not be released here, the base and One-KVM images will be released on the [One-KVM](https://github.com/mofeng-git/One-KVM) release page.

- Ubuntu Focal 20.04 x64 (virtual or physical machine) with at least 2GB of RAM and 35GB of disk space for local builds with sudo or root access configured;
- If you wish to build on a machine in mainland China, you maybe need to configure a  proxy so that the script can correctly fetch the required additional build resources from Github.

```bash
git clone https://github.com/mofeng-git/Build-Armbian
cd Build-Armbian
#Compile USB disk/SD card image
./compile.sh  BOARD=aml-s812 BRANCH=current RELEASE=jammy BUILD_MINIMAL=yes BUILD_DESKTOP=no KERNEL_ONLY=no KERNEL_CONFIGURE=no COMPRESS_OUTPUTIMAGE=sha,img EXTRAWIFI=yes
#Package amlogic usbburnning image
su
./lib/burnimg-pack.sh output/images/Armbian_20.12_Aml-s812_jammy_current_5.9.0-rc7_minimal.img
```

![image](https://github.com/mofeng-git/Build-Armbian/assets/62919083/38f8cfc8-418d-419d-9c7f-3d733f32927c)

## Others

**Documentation**
- [Development-Code_Review_Procedures_and_Guidelines](https://docs.armbian.com/Development-Code_Review_Procedures_and_Guidelines/)

**Tanks**

Thanks to **观棋不语٩ ི۶** for the initial feasibility experiments, **0BlueBlue0** for the guidance provided throughout the process, the group of friends for their testing and suggestions, the discussion and exchange of ideas among all the users, and the following open source projects.
- [Build-Armbian Leo357449107](https://github.com/Leo357449107/Build-Armbian/tree/20.11)
- [armbian-build](https://github.com/armbian/build)
- [armbian-onecloud](https://github.com/hzyitc/armbian-onecloud)
- [Fruity PiKVM](https://github.com/jacobbar/fruity-pikvm)
- [Open and inexpensive DIY IP-KVM based on Raspberry Pi](https://github.com/pikvm/pikvm)
