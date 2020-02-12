#!/bin/sh

### author: zhangfan
### email: 1281641968@qq.com
### TEL: 14792054362
### date: 2020年02月12日
### this scrip is using for develop tools ---> tips

function_print_help() {
	usage="tip commands:[command]"
	help111="\n\t -h,--h,help,-help,--help                                            帮助文档：介绍此工具的功能..."
	init111="\n\t -i,--i,init,-init,--init                                            环境部署：提示使用者如何安装环境..."
	version="\n\t -v,--v,version,-version,--version                                   查看版本：查看当前tips的版本..."
	l_versi="\n\t -lv,--lv,latest_version,-latest_version,--latest_version            查看版本：查看最新tips的版本..."
	update1="\n\t -u,--u,update,-update,--update                                      更新组件：更新tips组件及功能..."
	port111="\n\t -p,--p,port,-port,--port                                            连接串口：提示连接串口的方式方法，查询串口的进程ID..."
	mount11="\n\t -m,--m,mount,-mount,--mount                                         挂载分区：提示mac电脑连接Android设备后mount磁盘的方法..."
	logcat1="\n\t -l,--l,log,-log,--log,logcat,-logcat,--logcat                       日志系统：提示Android设备常用打日志方法..."
	dumpsys="\n\t -d,--d,dump,-dump,--dump,dumpsys,-dumpsys,--dumpsys                 功能命令：常用dumpsys及pm命令..."
	compare="\n\t -compare                                                            beyound compare秘钥..."

	echo "$usage $help111 $init111 $version $l_versi $update1 $port111 $mount11 $logcat1 $dumpsys $compare"
}

function_print_help
