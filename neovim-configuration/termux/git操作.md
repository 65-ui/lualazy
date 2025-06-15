<!-- TOC Marked -->

- [git 基础](#git-基础)
- [git 分支](#git-分支)

<!-- /TOC -->

# git 基础

1. 配置用户信息

```git
git config --global user.name "xxx"
git config --global user.email "xxx@xx.com"
```

2. 创建 git 仓库

```git
git init
```

3. 查看当前仓库文件变化情况：

```git
git status
```

4. 添加修改（可使用 git add . 来添加当前仓库所有修改）

```git
git add .
```

5. 向 Git 提交内容： （.xx 为对提交的内容进行描述）

```git
git commit -m “xx”
```

6. 让 Git 不提交某些文件/忽略某些文件：创建文件  `.gitignore`  并在文件中添加文件名/文件夹名   即可  （若 git 已经开始追踪某些文件   则需要 11）
7. 回滚，撤销提交操作：

```git
git reset "移除文件名" 
```

8. 跳过暂存区一并提交

```git
git commit -a -m "描述信息"
```

9. 移除文件

```git
# 从git仓库和工作区移除index.js文件
git rm -f index.js
# 只从git 仓库中移除index.css 但保留工作区中的index.css文件
git rm --cached index.css
```

10. 查看历史提交

```git
git log
```

11. 将远程仓库克隆本地

```git
git clone "地址"
```

# git 分支

1. 查看 git 分支

```git
git branch
```

2. 创建新分支

```git
git branch 分支名称
```

3. 切换分支

```git
git checkout "分支名称"
```

4. 分支的快速创建和切换

```git
git checkout -b "分支名称"
```

5. 合并分支

```git
# 切换到主分支上
git checkout master
# 合并分支
git merge "分支"
```

6. 删除分支(本地分支)

```git
git branch -d "分支名称"
# D 强制删除分支
git branch -D "分支名称"
```

7. 冲突合并

```git
# 假设reg 分支合并master分支之间冲突
git checkout master
git merge reg
# 打开冲突手动解决冲突
git add .
git commit -m ""
```

8. 将本地推送到远程仓库

```git
# 第一次推送
git push -u 远程仓库的别名 本地分支名称:远程分支名称
git push -u origin origin
在github创建一个项目
git remote add 添加仓库
git push master
```

9. 查看远程分支所以列表

```git
git remote show 远程仓库名字
```

10. 下载远程分支(跟踪分支)

```git
git checkout 远程分支名称
# 分支重命名
git checkout -b 本地分支名称 远程仓库名字/远程分支名称
git checkout -b payment origin/pay
```

11. 拉取远程分支最新代码

```git
git pull
```

12. 删除远程仓库(远程仓库分支)

```git
git push 远程仓库名字 -- delete 远程分支名称
git push origin -- delete reg
```

# 如何创建Git个人访问令牌

1. 在任何页面的右上角，单击您的个人资料照片，然后单击 Settings（设置).
2. 在左侧边栏中，单击 Developer settings.
3. 在左侧边栏中，单击 Personal access tokens（个人访问令牌).
4. 单击 Generate new token（生成新令牌). 将本地推送到远程仓库 就是这个账号.
5. 选择要授予此令牌的作用域或权限。 要使用令牌从命令行访问仓库，请选择 repo（仓库）
6. 单击 Generate token（生成令牌).
7. 单击 将令牌复制到剪贴板。 出于安:全原因，离开此页面后，您将无法再次看到令牌.这个就是本地仓库push到Github密码.
