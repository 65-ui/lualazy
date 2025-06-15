<!-- TOC Marked -->

+ [tmoe-link](#tmoe-link)
+ [ranger](#ranger)
+ [go](#go)
+ [nodejs npm](#nodejs-npm)
    * [修改npm镜像源(淘宝)](#修改npm镜像源(淘宝))
+ [python2](#python2)
+ [pip2](#pip2)
+ [python3](#python3)
+ [pip3](#pip3)
    * [修改pip3镜像源(淘宝)](#修改pip3镜像源(淘宝))
+ [neovim](#neovim)
    * [nodejs 支持 nvim](#nodejs-支持-nvim)
    * [python2 支持 nvim](#python2-支持-nvim)
    * [python3 支持 nvim](#python3-支持-nvim)
+ [解压缩工具](#解压缩工具)

<!-- /TOC -->

# tmoe-link

```shell
	bash -c "$(curl -Lv gitee.com/mo2/linux/raw/master/debian.sh)"
```

# ranger

```shell
sudo pacman -S ranger
```

# go

```shell
sudo pacman -S go
```

# nodejs npm

```shell
sudo pacman -S nodejs npm
```

## 修改npm镜像源(淘宝)
1. 临时使用 在 npm install XXX 时加入--registry URL即可，不会影响到本地配置，如：

```shell
npm --registry https://registry.npm.taobao.org install express
```

2. 持久使用 永久修改本地npm的配置：

```shell
npm config set registry https://registry.npm.taobao.org
```

3. 查看npm源地址有没有换成功：

```shell
npm config get registry
```

4. 重置为官方源：

```shell
npm config set registry https://registry.npmjs.org/
```

# python2

```shell
sudo pacman -S python2
```

# pip2

```shell
curl https://bootstrap.pypa.io/pip/2.7/get-pip.py -o get-pip.py
```

```shell
sudo python2 get-pip.py
```

# python3

```shell
sudo pacman -S python3
```

# pip3

```shell
wget https://bootstrap.pypa.io/get-pip.py
```

```shell
sudo python3 get-pip.py
```

## 修改pip3镜像源(淘宝)

1. 创建文件夹

```shell
mkdir ~/.pip/pip.conf
```

2.在`pip.conf`添加以下内容

```shell
[global]
timeout = 6000
index-url = https://mirrors.aliyun.com/pypi/simple/
trusted-host = mirrors.aliyun.com
```
3.下载nrm修改npm源

```shell
npm i nrm -g

查看所以源镜像
nrm ls

切换淘宝源
nrm use taobao
```

# neovim

```shell
sudo pacman -S --noconfirm neovim
```

## nodejs 支持 nvim

```shell
sudo npm install neovim
```

## python2 支持 nvim

```shell
sudo pip2 install neovim
```

## python3 支持 nvim

```shell
sudo pacman -S  --noconfirm python-pynvim
```

# 解压缩工具

```shell
sudo pacman -S thunar-archive-plugin xarchiver zip unzip p7zip arj lzop cpio unrar
```
