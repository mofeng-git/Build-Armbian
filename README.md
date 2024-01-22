<h3 align=center><img src="https://github.com/mofeng-git/Build-Armbian/assets/62919083/add9743a-0987-4e8a-b2cb-62121f236582" alt="logo" width="300"><br></h3>
<h3 align=center><a href="https://github.com/mofeng-git/Build-Armbian/blob/master/README.md">简体中文</a>  ||  <a href="https://github.com/mofeng-git/Build-Armbian/blob/master/README-English.md">English</a></h3>
<p align=right>&nbsp;</p>

## 这个项目是做什么的？

- Fork自 [Build-Armbian Leo357449107](https://github.com/Leo357449107/Build-Armbian/tree/20.11)，为玩客云构建基于 Debian 的定制 Linux 系统；
- 包括根文件系统生成、内核映像编译、和引导加载程序编译和镜像打包的全流程支持；
- 构建OTG功能可用的能长期稳定运行的玩客云Armbain镜像，为PiKVM（One-KVM）提供基础系统支持。


## 如何构建Armbain系统？
> 此分支版本较老，没有完善支持。玩客云已进入Armbian官方支持，若有需求，可访问相关项目：[armbian-build](https://github.com/armbian/build)或[armbian-onecloud](https://github.com/hzyitc/armbian-onecloud)。

> 作者仅维护此分支玩客云的一个选项（BOARD=aml-s812 BRANCH=current RELEASE=jammy BUILD_MINIMAL=yes），不处理其他选项的可用性问题。

>编译好的镜像不会在此处发布， 基础镜像与One-KVM镜像将会在[One-KVM](https://github.com/mofeng-git/One-KVM) release页发布。

- Ubuntu Focal 20.04 x64（虚拟机或实体机），至少 2GB 内存和 35GB 磁盘空间，用于本机构建，且已配置好sudo 或 root 访问权限；
- 如您希望在中国大陆的主机上进行编译，还需配置好网络代理以便脚本能正确从Github上获取所需其他编译资源。

```bash
git clone https://github.com/mofeng-git/Build-Armbian
cd Build-Armbian
#编译U盘/SD卡镜像
./compile.sh  BOARD=aml-s812 BRANCH=current RELEASE=jammy BUILD_MINIMAL=yes BUILD_DESKTOP=no KERNEL_ONLY=no KERNEL_CONFIGURE=no COMPRESS_OUTPUTIMAGE=sha,img EXTRAWIFI=yes
#打包晶晨线刷镜像
su
./lib/burnimg-pack.sh output/images/Armbian_20.12_Aml-s812_jammy_current_5.9.0-rc7_minimal.img
```

![image](https://github.com/mofeng-git/Build-Armbian/assets/62919083/38f8cfc8-418d-419d-9c7f-3d733f32927c)


## 其他
**参考文档**
- [Development-Code_Review_Procedures_and_Guidelines](https://docs.armbian.com/Development-Code_Review_Procedures_and_Guidelines/)

**致谢**

感谢**观棋不语٩ ི۶**进行初始可行性实验、**0蓝蓝0**全过程提供的指导、群友的测试和建议、各位网友的讨论交流和下列开源项目。
- [Build-Armbian Leo357449107](https://github.com/Leo357449107/Build-Armbian/tree/20.11)
- [armbian-build](https://github.com/armbian/build)
- [armbian-onecloud](https://github.com/hzyitc/armbian-onecloud)
- [Fruity PiKVM](https://github.com/jacobbar/fruity-pikvm)
- [Open and inexpensive DIY IP-KVM based on Raspberry Pi](https://github.com/pikvm/pikvm)
