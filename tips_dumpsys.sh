#!/bin/sh

### author: zhangfan
### email: 1281641968@qq.com
### TEL: 14792054362
### date: 2020年02月12日
### this scrip is using for develop tools ---> tips

function_print_dumpsys() {
	echo "查看dumpsys支持的功能列表：\n\t dumpsys -l"

	echo ""
	echo "查看某个应用的包信息：\n\t dumpsys package 包名 \n\t pm dump 包名 "

	echo ""
	echo "查看某个应用的版本及路径：\n\t dumpsys package 包名 | grep -e codePath -e version \n\t pm dump 包名 | grep -e codePath -e version"

	echo ""
	echo "查看当前前台应用Activity：\n\t dumpsys activity | grep mFocus"

	echo ""
	echo "查看当前前台窗口：\n\t dumpsys window | grep mFocus"
}

function_print_dumpsys