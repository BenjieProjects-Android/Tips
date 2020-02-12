## Android 开发者之 MAC OS 全局小工具 --- tips

---

###### Author: 张帆
###### Date: 2020-02-12
##### Email: 1281641968@qq.com
##### 简书: 迷你小猪

---
### 工具部署：

1. 推荐安装MAC终端工具：iTerm2 
2. 推荐安装：oh-my-zshell
3. 源码 clone：`git clone git@github.com:zhangfanschool/Tips.git`
4. 将 tip.sh 拷贝至用户目录：MAC 一般是：~ 路径下，该路径代表用户目录
5. 打开 iTerm2 终端，执行如下命令：
	
	```
	chmod 755 ~/tip.sh;~/tip.sh init
	```
6. 重启 iTerm2 终端，即可全局使用 tips 命令了

---

### 关于更新：
1. 保证设备联网状态下，执行 `tips -update` 即可。

---

### 关于功能：

1. 执行 tips 命令，会有帮助程序提示：

	```
	➜  Desktop tips
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
2. 关于使用：tips 后面跟支持的命令参数即可。如 `tips -h`, `tips -v`, `tips -lv` 等。

---

### 其他：
1. 如在部署中遇到问题，可以 issue，可以邮件沟通。
2. 想加入工具的持续开发与迭代？邮件沟通，放上个人 ssh 公钥即可。