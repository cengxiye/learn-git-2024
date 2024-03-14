# 基于以下内容创作本代码，用于讲解DevOps精讲课Git与Github章节
# https://www.bookstack.cn/read/backlog-git-tutorial/35.md
# https://www.youtube.com/watch?v=tRZGeaHPoaw&ab_channel=KevinStratvert


# 常用命令
git XXX -h # 询问git XXX是啥意思
git help XXX # 更详细的解释，打开一个本地html页面给你解释
git log --oneline # 看看我之前所有的commit历史（以简洁的形式）
git reset XXX # 回溯到某个commit上


# 事前预备
git config --global user.name "Sid Zhang"
git config --global user.email cengxiye@yeah.net
git init # 初始化文件夹，观察生成的隐藏文件夹，F8运行本行代码
# 创建一个myfile.txt文件
git status # 这是我们超常用的命令
git add myfile.txt # git add .可以track所有目录里文件
git commit -m "first commit" # 此时此刻，照张照片，贴在相册，可以回溯
# 画图解释目前的历史记录


# 建立分支
# 白板讲解“什么是分支？”
git branch issue1 # 建立一个名为issue1的分支
git branch # 查看所有分支，发现head还指在master
# 画图解释目前的历史记录


# 切换分支
git checkout issue1 # 切换到issue1分支，-b可以创建分支并切换，git switch是创建并切换（推荐）
# 画图解释目前的历史记录
# 修改myfile.txt文件
git add myfile.txt
git commit -m "add new content"
# 现在master落后于issue1，head指向issue1
# 画图解释目前的历史记录


# 合并分支
# 画图解释目前的历史记录
# 先切换master分支，然后把issue1分支导入到master分支
git checkout master
# 打开myfile.txt档案以确认内容，应该是旧的
git merge issue1 # 打开myfile.txt档案以确认内容，应该是新的，此时head在master上
# 画图解释目前的历史记录


# 删除分支
# 既然issue1分支的内容已经顺利地合并到master分支了，现在可以将其删除了
git branch -d issue1 # 删除了issue1分支
git branch # 检查现在只有master分支了
# 画图解释目前的历史记录


# 并行操作
# 首先创建issue2分支和issue3分支，并切换到issue2分支
git branch issue2
git branch issue3
git checkout issue2
git branch
# 画图解释目前的历史记录
# 在issue2分支的myfile.txt添加commit命令的说明后提交
git add .\myfile.txt
git commit -m "add content from issue2"
# 画图解释目前的历史记录
# 接着，切换到issue3分支
git checkout issue3
# 打开myfile.txt档案，由于在issue2分支添加了新内容，所以issue3分支的myfile.txt里没有新内容
git add myfile.txt
git commit -m "add content from issue3"
# 画图解释目前的历史记录
# 对比切换到issue2和issue3分支，给观众展示myfile.txt内容的区别


# 解决合并的冲突
# 把issue2分支和issue3分支的修改合并到master
# 切换master分支后，与issue2分支合并
git checkout master
git merge issue2 # 没有冲突，这是fast-forward合并
# 画图解释目前的历史记录
git merge issue3 # 出现冲突报警，由于在同一行进行了修改，所以产生了冲突
# 打开myfile.txt文件，处理冲突
git add myfile.txt
git commit -m "merge issue3"
# 画图解释目前的历史记录


# 用rebase合并
# 合并issue3分支的时候，使用rebase可以使提交的历史记录显得更简洁
# 现在暂时取消刚才的合并
git reset --hard HEAD~
# 画图解释目前的历史记录
# 切换到issue3分支后，对master执行rebase
git checkout issue3
git rebase master
# 和merge时的操作相同，修改在myfile.txt发生冲突的部分
# rebase的时候，修改冲突后的提交不是使用commit命令，而是执行rebase命令指定 —continue选项
# 若要取消rebase，指定 —abort选项
git add myfile.txt
git rebase --continue # 按i进入insert模式，输入comment，Esc后:wq保存并退出
# 画图解释目前的历史记录
# 这样，在master分支的issue3分支就可以fast-forward合并了，切换到master分支后执行合并
git checkout master
git merge issue3
# myfile.txt的最终内容和merge是一样的，但是历史记录如下
# 画图解释目前的历史记录






# 创建Github Repo
# 先在Github上创建一个Repo，创建完后，下面三行是自动生成的
git remote add origin https://github.com/cengxiye/learn-git-2024.git # 首先将远程仓库的地址添加到本地仓库，并将其命名为 "origin"
git branch -M main # 将当前分支（默认是master）重命名为main
git push -u origin main # 将本地的"main"分支推送到远程仓库"origin"。-u参数用于设置"origin"作为默认的远程仓库
# 以后可以直接使用git push而不需要指定远程仓库和分支。这个命令会将本地的"main"分支的内容推送到远程仓库，实现同步


# 简要介绍Github
# About，填写有关你这个Repo的信息
# Issue，提交bug和feature request，可以assign给其他人/可以加labels等等
# Actions，可以run test，测试你得代码
# Projects，可以管理你的项目
# Wiki，类似一个有关于你项目的百科
# Security，诸如代码安全扫描等
# Insights，查看项目数据
# Settings，设置你的项目
# Release，回到你Repo的主页，可以发布1.0版本你的release，你的代码被打包成zip


# PUSH
# 在main branch上，修改mytext.txt文件
git add .\myfile..txt
git commit -m "change file, to be pushed to origin"
git push
# 检查Github上的文件，已经更新


# PULL
# 在Github上修改txt
git pull
# 在本地main branch上，检查txt


# FETCH
# 在Github上修改txt
git fetch
git diff main origin/main
# git fetch：只是将远程仓库的变更下载到本地，不会自动合并到当前分支
# git pull = git fetch + git merge

# CLONE
git clone https://github.com/cengxiye/sid.github.io.git
# 适用场景：使用 git clone 通常是在开始新项目或者从头开始的时候
# 适用场景：使用 git pull 通常是在你已经有了一个本地仓库，希望获取最新变更时
# 操作对象：git clone 操作的对象是整个远程仓库
# 操作对象：git pull 操作的对象是当前分支上的远程变更
# 执行时机：git clone 只需要执行一次，创建本地仓库的拷贝
# 执行时机：git pull 需要在你想要获取远程仓库变更时执行