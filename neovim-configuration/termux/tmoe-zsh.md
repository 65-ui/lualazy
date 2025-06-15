<!-- TOC Marked -->

+ [介绍](#介绍)
+ [安装](#安装)
  * [Android-Termux](#android-termux)
  * [Debian/Ubuntu/Mint/Kali/Deepin/Devuan/MX 等 deb 系发行版](#debian/ubuntu/mint/kali/deepin/devuan/mx-等-deb-系发行版)
  * [RedHat/Fedora/CentOS](#redhat/fedora/centos)
  * [Arch/Manjaro](#arch/manjaro)
  * [OpenWRT/Entware(只测试了 mipsel 架构路由器的 Entware 系统)](#openwrt/entware(只测试了-mipsel-架构路由器的-entware-系统))
  * [Alpine/iOS-iSH](#alpine/ios-ish)
  * [Void](#void)
+ [相关依赖为](#相关依赖为)
+ [使用说明](#使用说明)

<!-- /TOC -->

# 介绍

1. Tmoe-zsh（原名 Termux-zsh）可以轻松方便地为 GNU/Linux 和 Android-Termux 配置 zsh 主题，支持 Alpine、Arch、Debian、Entware、Fedora 和 Void。 Easily configure zsh themes for GNU/Linux and Android-Termux.

# 安装

## Android-Termux

```shell
apt install -y curl
```

```shell
bash -c "$(curl -LfsS 'https://gitee.com/mo2/zsh/raw/master/zsh.sh')"
```

## Debian/Ubuntu/Mint/Kali/Deepin/Devuan/MX 等 deb 系发行版

```shell
if [ ! -f /usr/bin/wget ]; then
    apt update || sudo apt update || su -c 'apt update'
    apt install -y wget  || sudo apt install -y wget || su -c "apt install -y wget"
fi
```

```shell
bash -c "$(wget -qO- 'https://gitee.com/mo2/zsh/raw/master/zsh.sh')"
```

## RedHat/Fedora/CentOS

```shell
dnf install -y curl || yum install -y curl
```

```shell
bash -c "$(curl -LfsS 'https://gitee.com/mo2/zsh/raw/master/zsh.sh')"
```

## Arch/Manjaro

```shell
pacman -Syu --noconfirm curl
```

```shell
bash -c "$(curl -LfsS 'https://gitee.com/mo2/zsh/raw/master/zsh.sh')"
```

## OpenWRT/Entware(只测试了 mipsel 架构路由器的 Entware 系统)

```shell
opkg update
```

```shell
opkg install libustream-openssl ca-bundle ca-certificates wget bash
```

```shell
bash -c "$(wget --no-check-certificate -qO- 'https://gitee.com/mo2/zsh/raw/master/zsh.sh')"
```

## Alpine/iOS-iSH

```shell
apk add -q wget
```

```shell
wget -qO- 'https://gitee.com/mo2/zsh/raw/master/zsh.sh' | ash
```

## Void

```shell
xbps-install -S
xbps-install -y wget
```

```shell
bash -c "$(wget -qO- 'https://gitee.com/mo2/zsh/raw/master/zsh.sh')"
```

# 相关依赖为

```shell
zsh git pv wget tar xz newt(whiptail)
```

# 使用说明

1. Change color scheme: `zshcolor`
2. Change theme: `zshtheme`
3. Change font: `zshfont`
4. Start zsh manager: `zsh-i`
