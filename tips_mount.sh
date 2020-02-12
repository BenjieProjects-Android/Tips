#!/bin/sh

### author: zhangfan
### email: 1281641968@qq.com
### TEL: 14792054362
### date: 2020年02月12日
### this scrip is using for develop tools ---> tips

function_print_mount() {
	mountAdb="adb connect IP;adb root;adb connect IP;adb remount"
	echo "mount by adb:\n\t$mountAdb"

	echo ""
	mountSystemSerial_Android7below="mount -o remount /system"
	mountTvConfigSerial_Android7below="mount -o remount /tvconfig"
	echo "below Android 7.0, mount system by serial:\n\t$mountSystemSerial_Android7below"
	echo "below Android 7.0, mount tvconfig by serial:\n\t$mountTvConfigSerial_Android7below"

	echo ""
	mountSystemSerial_Android9below="mount -o rw,remount /system"
	mountVendorSerial_Android9below="mount -o rw,remount /vendor"
	mountTvConfigSerial_Android9below="mount -o rw,remount /tvconfig"
	echo "below Android 9.0, mount system by serial:\n\t$mountSystemSerial_Android9below"
	echo "below Android 9.0, mount vendor by serial:\n\t$mountVendorSerial_Android9below"
	echo "below Android 9.0, mount tvconfig by serial:\n\t$mountTvConfigSerial_Android9below"

	echo ""
	mountSystemSerial_Android9="mount -o rw,remount /;mount -o rw,remount /system"
	mountVendorSerial_Android9="mount -o rw,remount /;mount -o rw,remount /vendor"
	echo "Android 9.0, mount system by serial:\n\t$mountSystemSerial_Android9"
	echo "Android 9.0, mount vendor by serial:\n\t$mountVendorSerial_Android9"
}

function_print_mount