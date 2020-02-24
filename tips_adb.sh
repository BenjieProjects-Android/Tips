#!/bin/sh

### author: zhangfan
### email: 1281641968@qq.com
### TEL: 14792054362
### date: 2020年 2月22日 星期六 19时55分42秒 CST
### this is a develop tool for Android developer on MAC OS.

function_operator_apks() {
	echo "adb 连接设备：adb connect <IP>;adb root;adb connect <IP>;adb remount"
		echo "\t 例如：adb connect 192.168.1.103;adb root;adb connect 192.168.1.103;adb remount"

	echo "adb 安装命令：adb install -r -d -t <apkFilePath>"
		echo "\t 例如：adb install -r -d -t ~/Downloads/Demo.apk"

	echo "adb 卸载命令：adb uninstall <appPackage>"
		echo "\t 例如：adb uninstall com.android.demo"

	echo "adb 获取Android设备的文件：adb pull <androidFilePath> <targetFilePath>"
		echo "\t 例如：adb pull /data/logcat.txt ~/Desktop/logcat.txt"

	echo "adb 推送文件到Android设备：adb push <targetFilePath> <androidFilePath>"
		echo "\t 例如：adb push ~/Desktop/Demo.apk /system/app/Demo.apk"
}

function_start_activity() {
	echo "adb 启动Activity："
		echo "启动主界面：adb shell am start <appPackage>"
			echo "\t 例如：adb shell am start com.android.settings"

		echo ""

		echo "显示启动界面：adb shell am start -n <appPackage/classReferencePath>"
			echo "\t 例如：adb shell am start -n com.android.settings/com.android.settings.Settings"

		echo "显示启动界面并传递int参数：adb shell am start -n <appPackage/classReferencePath> -ei <intKey> <intValue>"
			echo "\t 例如：adb shell am start -n com.android.settings/com.android.settings.Settings -ei position 0"

		echo "显示启动界面并传递string参数：adb shell am start -n <appPackage/classReferencePath> -es <stringKey> <stringValue>"
			echo "\t 例如：adb shell am start -n com.android.settings/com.android.settings.Settings -es title helloWorld"

		echo "显示启动界面并传递boolean参数：adb shell am start -n <appPackage/classReferencePath> -ez <booleanKey> <booleanValue>"
			echo "\t 例如：adb shell am start -n com.android.settings/com.android.settings.Settings -ez isGirl false"

		echo ""

		echo "隐式启动界面：adb shell am start -a <action> -c <category1> -c <category2> ... -c <categoryN>"
			echo "\t 例如：adb shell am start -a android.settings.DATE_SETTINGS -c android.intent.category.DEFAULT"

		echo "隐式启动界面并传递int参数：adb shell am start -a <action> -c <category1> -c <category2> ... -c <categoryN> -ei <intKey> <intValue>"
			echo "\t 例如：adb shell am start -a android.settings.DATE_SETTINGS -c android.intent.category.DEFAULT -ei position 0"

		echo "隐式启动界面并传递string参数：adb shell am start -a <action> -c <category1> -c <category2> ... -c <categoryN> -es <stringKey> <stringValue>"
			echo "\t 例如：adb shell am start -a android.settings.DATE_SETTINGS -c android.intent.category.DEFAULT -es title helloWorld"

		echo "隐式启动界面并传递boolean参数：adb shell am start -a <action> -c <category1> -c <category2> ... -c <categoryN> -ez <booleanKey> <booleanValue>"
			echo "\t 例如：adb shell am start -a android.settings.DATE_SETTINGS -c android.intent.category.DEFAULT -ez isGirl false"

		echo "更多传参，请访问：https://www.jianshu.com/p/ea84febaa7bd"
}

function_start_receiver() {
	echo "adb 发送广播："
		echo "不带参数发送：adb shell am broadcast -a <action> -c <cetegory1> -c <cetegory2> ... -c <cetegoryN>"
			echo "\t 例如：adb shell am broadcast -a com.android.ACTION_DEMO -c com.android.CATEGORY_DEMO"

		echo "发送并传递int参数：adb shell am broadcast -a <action> -c <cetegory1> -c <cetegory2> ... -c <cetegoryN> -ei <intKey> <intValue>"
			echo "\t 例如：adb shell am broadcast -a com.android.ACTION_DEMO -c com.android.CATEGORY_DEMO -ei position 0"

		echo "发送并传递string参数：adb shell am broadcast -a <action> -c <cetegory1> -c <cetegory2> ... -c <cetegoryN> -es <stringKey> <stringValue>"
			echo "\t 例如：adb shell am broadcast -a com.android.ACTION_DEMO -c com.android.CATEGORY_DEMO -es title helloWorld"

		echo "发送并传递boolean参数：adb shell am broadcast -a <action> -c <cetegory1> -c <cetegory2> ... -c <cetegoryN> -ez <booleanKey> <booleanValue>"
			echo "\t 例如：adb shell am broadcast -a com.android.ACTION_DEMO -c com.android.CATEGORY_DEMO -ez isGirl false"

		echo "更多传参，请访问：https://www.jianshu.com/p/ea84febaa7bd"
}

function_start_service() {
	echo "Android8.0及以下 adb 启动服务："
		echo "显示启动：adb shell am startservice <package/classReferencePath>"
		echo "\t 例如：adb shell am startservice com.android.demo/com.android.demo.MainService"

		echo "显示启动并传递int参数：adb shell am startservice <package/classReferencePath> -ei <intKey> <intValue>"
			echo "\t 例如：adb shell am startservice -a com.android.demo/com.android.demo.MainService -ei position 0"

		echo "启动并传递string参数：adb shell am startservice <package/classReferencePath> -es <stringKey> <stringValue>"
			echo "\t 例如：adb shell am startservice com.android.demo/com.android.demo.MainService -es title helloWorld"

		echo "启动并传递boolean参数：adb shell am startservice <package/classReferencePath> -ez <booleanKey> <booleanValue>"
			echo "\t 例如：adb shell am startservice com.android.demo/com.android.demo.MainService -ez isGirl false"

		echo ""

		echo "隐式启动：adb shell am startservice -a <action> -c <cetegory> - <cetegory2> ... -c <cetegoryN>"
		echo "\t 例如：adb shell am startservice -a com.android.ACTION_DEMO -c com.android.CETEGORY_DEMO"

		echo "启动并传递int参数：adb shell am startservice -a <action> -c <cetegory1> -c <cetegory2> ... -c <cetegoryN> -ei <intKey> <intValue>"
			echo "\t 例如：adb shell am startservice -a com.android.ACTION_DEMO -c com.android.CATEGORY_DEMO -ei position 0"

		echo "启动并传递string参数：adb shell am startservice -a <action> -c <cetegory1> -c <cetegory2> ... -c <cetegoryN> -es <stringKey> <stringValue>"
			echo "\t 例如：adb shell am startservice -a com.android.ACTION_DEMO -c com.android.CATEGORY_DEMO -es title helloWorld"

		echo "启动并传递boolean参数：adb shell am startservice -a <action> -c <cetegory1> -c <cetegory2> ... -c <cetegoryN> -ez <booleanKey> <booleanValue>"
			echo "\t 例如：adb shell am startservice -a com.android.ACTION_DEMO -c com.android.CATEGORY_DEMO -ez isGirl false"

		echo "更多传参，请访问：https://www.jianshu.com/p/ea84febaa7bd"

		echo ""

	echo "Android8.0以上 adb 启动服务："
		echo "将 8.0 以下的 startservice 换成 start-foreground-service，其他保持不变"
}

function_logcat() {
	echo ""
	echo "按TAG过滤日志：adb logcat -c;adb logcat -s TAG"

	echo ""
	echo "按关键字过滤日志：adb logcat -c;adb logcat -vthreadtime | grep -e FilterString1 -e FilterString2 ... -e FilterStringN"

	echo ""
	echo "按关键字过滤日志，忽略大小写：adb logcat -c;adb logcat -vthreadtime | grep -e -i FilterString1 -e -i FilterString2 ... -e FilterStringN"

	echo ""
	echo "过滤Java崩溃信息：方式1：adb logcat *:E \n\t 方式2：adb logcat -s AndroidRuntime"

	echo ""
	echo "过滤日志并写入到文件：adb logcat -vthreadtime > /data/logcat_xxx.txt"
}

function_print_support_commands() {
	echo "adb 操作apk          tips -adb apks"
	echo "adb 启动Activity命令  tips -adb activity"
	echo "adb 发送广播命令       tips -adb receiver"
	echo "adb 启动Service命令   tips -adb service"
	echo "adb 抓取日志命令       tips -adb log"

	echo ""
	echo "adb 更多命令，请访问：https://www.cnblogs.com/622698abc/archive/2013/06/11/3132306.html"
}

function_print_adb_cmds() {
	case ${2} in
		"apks" )
		function_operator_apks
		;;
		"activity" )
			function_start_activity
		;;
		"receiver" )
			function_start_receiver
		;;
		"service" )
			function_start_service
		;;
		"log" )
			function_logcat
		;;
		* )
			function_print_support_commands
		;;
	esac
}

function_print_adb_cmds "$@"