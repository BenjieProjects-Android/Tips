#!/bin/sh

### author: zhangfan
### email: 1281641968@qq.com
### TEL: 14792054362
### date: 2020年 2月19日 星期三 14时37分16秒 CST
### this is a develop tool for Android developer on MAC OS.

function_notice_param() {
	echo "查询Android设备无线MAC地址：tips -mac wifi"
	echo "查询Android设备有线MAC地址：tips -mac ethernet"
}

function_print_wlan_mac() {
	echo "Android设备无线MAC地址查看："
	echo "\t 在adb shell环境下或串口环境下执行：cat /sys/class/net/wlan0/address"
}

function_print_ethernet_mac() {
	echo "Android设备无线MAC地址查看："
	echo "\t 在adb shell环境下或串口环境下执行：cat sys/class/net/eth0/address"
}

function_search_Android_mac() {
	case ${2} in
		"wifi" )
		function_print_wlan_mac
		;;
		"ethernet" )
		function_print_ethernet_mac
		;;
		* )
		function_notice_param
		;;
	esac
}

function_search_Android_mac "$@"