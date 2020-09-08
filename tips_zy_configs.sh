#!/bin/sh

### author: zhangfan
### email: 1281641968@qq.com
### TEL: 14792054362
### date: 2020年 9月 8日 星期二 11时23分01秒 CST
### this is a develop tool for zy developers for zy configs.

function_supported_config_files() {
	echo "ZY Config 支持的文件品类：xml、properties 文件"
	echo "ZY Config 设计规范文档编号：pageId=182676858"
	echo "配置原则："
		echo "\t 1.配置变更/更新，必须兼容历史版本功能。"
		echo "\t 2.强类型的配置变更，必须包含与之匹配的数据类型相关的测试用例。"
		echo "\t 3.包含配置项的修改，git log 的第一关键字，必须是 config。"
		echo "\t 4.历史工程的不做修改"
}

function_print_switch_type() {
	echo "\n number 类型："
		echo "\t key命名：enable_function_xxx"
		echo "\t value：true/false"
}

function_print_number_type() {
	echo "\n number 类型："
		echo "\t key命名：config_number_function_xxx"
		echo "\t value：0/1/2"
}

function_print_enum_type() {
	echo "\n enum 类型："
		echo "\t key命名：config_enum_function_xxx"
		echo "\t value：EnumXxx，符合驼峰命名，需添加注释，说明各枚举定义代表的含义。"
}

function_print_string_type() {
	echo "\n string 类型："
		echo "\t key命名：config_string_function_xxx"
		echo "\t value：功能需要的字符串"
}

function_print_list_type() {
	echo "\n list/array 类型："
		echo "\t key命名：config_list_function_xxx"
		echo "\t value：功能需要的列表，如包名清单 com.cvte.tv.provision,com.cvte.tv.setting,com.cvte.settings"
		echo "\t list/array类型的值，需要使用 \",\" 或 \"|\" 隔开，解析时使用字符串分割的形式使用。"
}

function_print_all_type() {
	echo "\n 查看adb 操作apk          tips -adb apks"
	function_print_switch_type
	function_print_number_type
	function_print_enum_type
	function_print_string_type
	function_print_list_type
}

function_print_config_tips() {
	case ${2} in
		"enable"|"disable"|"switch" )
			function_print_switch_type
		;;
		"number"|"int"|"integer" )
			function_print_number_type
		;;
		"enum"|"Emum" )
			function_print_enum_type
		;;
		"string"|"str" )
			function_print_string_type
		;;
		"list"|"array"|"collection"|"collections" )
			function_print_list_type
		;;
		"all"|"type"|* )
			function_print_all_type
		;;
	esac
}

function_supported_config_files
function_print_config_tips "$@"