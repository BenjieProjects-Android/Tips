#!/bin/sh

### author: zhangfan
### email: 1281641968@qq.com
### TEL: 14792054362
### date: 2020年02月12日
### this scrip is using for develop tools ---> tips

function_print_port() {
	echo "MAC 进入串口命令：\n\t screen /dev/tty.usbserial-gggggggg1 115200"

	echo ""
	echo "查找串口占用进程：\n\t ps | grep tty.usbserial-gggggggg1"
}

function_print_port