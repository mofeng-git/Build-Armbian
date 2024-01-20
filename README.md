<h3 align=center><a href="#armbian-build-tools"><img src=".github/armbian-logo.png" alt="Armbian logo" width="144"></a><br>
build tools</h3>

<p align=right>&nbsp;</p>

## 这个项目要做什么？

- Fork自 [Build-Armbian Leo357449107](https://github.com/Leo357449107/Build-Armbian/tree/20.11),为玩客云（onecloud）构建基于 Debian 的定制 Linux 系统；
- 包括根文件系统生成、内核映像编、和引导加载程序编译和镜像打包；
- 构建OTG功能可用的能长期稳定运行的玩客云Armbain镜像；
- 为PiKVM（One-KVM）提供基础系统支持。

<p align=right>&nbsp;</p>

## 如何构建Armbain系统

- Ubuntu Focal 20.04 x64（虚拟机或实体机），至少 2GB 内存和 35GB 磁盘空间，用于本机构建，且已配置好sudo 或 root 访问权限；
- 如您希望在中国大陆的主机上进行编译，还需配置好网络代理以便脚本能正确从Github上获取所需其他编译资源。

```text
apt-get -y install git
git clone https://github.com/mofeng-git/Build-Armbian
cd Build-Armbian
./compile.sh
```

**构建示例**

```text
./compile.sh  BOARD=aml-s812 BRANCH=current RELEASE=focal BUILD_MINIMAL=yes BUILD_DESKTOP=no KERNEL_ONLY=no KERNEL_CONFIGURE=yes COMPRESS_OUTPUTIMAGE=sha,gpg,img  EXTRAWIFI=no
mkimage -A arm -O linux -T kernel -C none -a 0x00208000 -e 0x00208000 -n "Linux kernel uImage" -d ./cache/sources/linux-aml-current/meson-mx-integration-5.9-20200930/arch/arm/boot/zImage ./output/images/uImage
```
![image](https://github.com/mofeng-git/Build-Armbian/assets/62919083/38f8cfc8-418d-419d-9c7f-3d733f32927c)


## 获取支持

- 暂无

## 请求贡献

- 暂无
