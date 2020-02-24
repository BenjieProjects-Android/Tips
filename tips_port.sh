#!/bin/sh

### author: zhangfan
### email: 1281641968@qq.com
### TEL: 14792054362
### date: 2020年02月12日
### this scrip is using for develop tools ---> tips

function_print_port() {
	echo "MAC进入串口命令：\n\t screen /dev/tty.usbserial-gggggggg1 115200"

	echo ""
	result=`ps | grep tty.usbserial-gggggggg1 | grep 115200 | grep SCREEN`
	if [[ ${result} == "" ]]; then
		echo "当前未检测到串口进程"
	else
		echo "串口进程占用信息：\n\t $result"
	fi
}

function_print_port