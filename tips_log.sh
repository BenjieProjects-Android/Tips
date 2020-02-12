#!/bin/sh

### author: zhangfan
### email: 1281641968@qq.com
### TEL: 14792054362
### date: 2020年02月12日
### this scrip is using for develop tools ---> tips

function_print_log() {
	echo "关闭kernel日志：\n\t echo 0 > /proc/sys/kernel/printk"

	echo ""
	echo "按TAG过滤日志：\n\t logcat -c;logcat -s TAG"

	echo ""
	echo "按关键字过滤日志：\n\t logcat -c;logcat -vthreadtime | grep -e FilterString1 -e FilterString2 ... -e FilterStringN"

	echo ""
	echo "按关键字过滤日志，忽略大小写：\n\t logcat -c;logcat -vthreadtime | grep -e -i FilterString1 -e -i FilterString2 ... -e FilterStringN"

	echo ""
	echo "过滤Java崩溃信息：\n\t 方式1：logcat *:E \n\t 方式2：logcat -s AndroidRuntime"

	echo ""
	echo "过滤日志并写入到文件：\n\t logcat -vthreadtime > /data/logcat_xxx.txt"

	echo ""
	echo "关于Log系统，如想了解更多，请访问：\n\t Android logcat 命令行工具：https://www.jianshu.com/p/f97d332286b7 \n\t Android 抓取系统各功能日志：https://www.cnblogs.com/bluestorm/p/9188159.html"
}

function_print_log