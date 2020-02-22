## `Android` 开发者之 `MAC OS` 全局小工具 --- `tips`

---

###### Author: 张帆
###### Date: 2020-02-12
##### Email: 1281641968@qq.com
##### 简书: 迷你小猪

---
### 工具部署：

1. 推荐终端：`iTerm2` 
2. 推荐安装：`oh-my-zsh`
3. 快速安装：
	+ `cd ~;rm -rf ~/Temp;mkdir -p ~/Temp;cd ~/Temp;git clone https://github.com/zhangfanschool/Tips.git`
	+ `cd ~;cp ~/Temp/Tips/tip.sh ~;chmod 755 ~/tip.sh;~/tip.sh init;rm -rf ~/Temp`

4. 重启 `iTerm2`，即可全局使用 `tips` 命令了

---

### 关于更新：
1. 保证设备联网状态下，执行 `tips -update` 即可。

---

### 关于功能：

1. 执行 `tips` 命令，会有帮助程序提示：

	```
	tip commands:[command]
		 -h,--h,help,-help,--help                                            帮助文档：介绍此工具的功能...
		 -i,--i,init,-init,--init                                            环境部署：提示使用者如何安装环境...
		 -v,--v,version,-version,--version                                   查看版本：查看当前tips的版本...
		 -lv,--lv,latest_version,-latest_version,--latest_version            查看版本：查看最新tips的版本...
		 -u,--u,update,-update,--update                                      更新组件：更新tips组件及功能...
		 -p,--p,port,-port,--port                                            连接串口：提示连接串口的方式方法，查询串口的进程ID...
		 -m,--m,mount,-mount,--mount                                         挂载分区：提示mac电脑连接Android设备后mount磁盘的方法...
		 -l,--l,log,-log,--log,logcat,-logcat,--logcat                       日志系统：提示Android设备常用打日志方法...
		 -d,--d,dump,-dump,--dump,dumpsys,-dumpsys,--dumpsys                 功能命令：常用dumpsys及pm命令...
	```

2. 关于使用：`tips` 后面跟支持的命令参数即可。如 `tips -h`, `tips -v`, `tips -lv` 等。

---

### 附带功能：

1. 协助开发者部署开发环境，安装 `tips` 程序，会在初始化阶段检查 `iTerm2`，`brew`，`brew cask`，`oh-my-zsh` 环境，如果没有，会自动帮你安装完毕。
2. `tips` 为不定期更新的小工具，前期部署好之后，后续更新，只要执行 `tips -update` 即可。
3. 彩蛋：`tips compare`持续开发中，有免费的，好用的工具，会收集进来供广大开发者使用。

---

### 其他：
1. 如在部署中遇到问题，可以 `issue`，可以邮件沟通。
2. 想加入工具的持续开发与迭代？邮件沟通，放上个人 `ssh` 公钥即可。
