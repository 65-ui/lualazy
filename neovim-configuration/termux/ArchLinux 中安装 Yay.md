<!-- TOC GitLab -->


+ [YAY](#yay)
  * [第 1 步：在 ArchLinux 上安装 base-devel 包](#第-1-步在-archlinux-上安装-base-devel-包)
  * [第 2 步：安装 Git](#第-2-步安装-git)
  * [第 3 步：克隆 Yay 存储库](#第-3-步克隆-yay-存储库)
  * [第 4 步：安装 Yay AUR 助手](#第-4-步安装-yay-aur-助手)
  * [第 5 步：使用 Yay 安装和管理软件包](#第-5-步使用-yay-安装和管理软件包)

<!-- /TOC -->

# YAY

## 第 1 步：在 ArchLinux 上安装 base-devel 包

第一步是安装 基础开发 package 提供了一组用于从 AUR 构建或编译包的包。 如果您使用的是最小的 ArchLinux 安装，它可能没有预先安装，因此请按如下方式安装：

```bash
sudo pacman -S --needed base-devel
```

## 第 2 步：安装 Git

接下来，安装 Git。 这是一个免费的开源版本控制系统，可让您轻松管理和跟踪代码存储库。

```bash
sudo pacman -S git
```

## 第 3 步：克隆 Yay 存储库

1. 下一步是从 GitHub 克隆 Yay 存储库。 我们将使用 Git 版本控制工具来小丑存储库。 但首先，导航到 /选择 目录。

```bash
cd /opt
```

2. 然后克隆 Yay 存储库。

```bash
sudo git clone https://aur.archlinux.org/yay.git
```

3. 默认情况下，克隆的 yay 目录为 root 用户所有，属于 root 组。 我们需要将所有权更改为登录用户，如下所示。

```bash
sudo chown -R winnie:winnie yay-git/
```

## 第 4 步：安装 Yay AUR 助手

1. 最后，要安装 Yay，请导航到克隆目录。

```bash
cd yay-git
```

2. 并运行下面的命令。

```bash
makepkg -si
```

3. 安装后，确认安装的 yay 版本，如图所示。

```bash
yay --version
```

## 第 5 步：使用 Yay 安装和管理软件包

> > 安装 Yay 后，让我们看一下您可以执行的一些任务。

1. 要更新系统包，请运行以下命令：

```bash
yay -Syy
```

2. 要运行包括内核在内的系统的完整升级，请发出以下命令：

```bash
yay -Syu
```

3. 要安装软件包，请使用以下语法:

```bash
yay -S package
```

4. 为了 example, 要安装 Nginx Web 服务器，请运行：

```bash
yay -S nginx
```

5. 您可以启动并检查网络服务器的状态以确保安装成功。

```bash
sudo systemctl start nginx
```

```bash
sudo systemctl status nginx
```
