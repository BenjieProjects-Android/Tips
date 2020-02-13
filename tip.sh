#!/bin/sh

### author: zhangfan
### email: 1281641968@qq.com
### TEL: 14792054362
### date: 2019年11月12日 星期二 14时26分05秒 CST
### this is a develop tool for Android developer on MAC OS.

DEFINE_TARGET_TIPS_DIR=~/.tips
DEFINE_TARGET_TIPS_PROJECT_DIR=$DEFINE_TARGET_TIPS_DIR/Tips
DEFINE_UPDATE_TIPS_DIR=~/.tips_update
DEFINE_UPDATE_TIPS_PROJECT_DIR=$DEFINE_UPDATE_TIPS_DIR/Tips
DEFINE_TIPS_PROJECT_URL=https://github.com/zhangfanschool/Tips.git

function_initial_tips() {
	if [[ -f ~/.bash_profile ]]; then
		bashProfileResult=$(cat ~/.bash_profile | grep alias | grep tips | grep tip.sh)
		if [[ "${bashProfileResult}"x == ""x ]]; then
			chmod 777 ~/.bash_profile
			echo alias tips=\'~/tip.sh\' >> ~/.bash_profile
		fi
		echo "\t\t ~/.bash_profile 环境部署完成，打开默认终端工具执行：source ~/.bash_profile;tips"
	else
		echo "\t\t 请确保电脑已经brew工具和item2工具，安装后，请打开item2工具，并执行：chmod 755 ~/tips.sh;~/tips.sh init"
	fi
	if [[ -f ~/.zshrc ]]; then
		zshellResult=$(cat ~/.zshrc | grep alias | grep tips | grep tip.sh)
		if [[ "${zshellResult}"x == ""x ]]; then
			chmod 644 ~/.zshrc
			echo alias tips=\'~/tip.sh\' >> ~/.zshrc
		fi
		echo "\t\t ~/.zshrc 环境部署完成，打开item2的终端执行：tips"
	else
		echo "\t\t 请确保电脑已经brew工具和item2工具，安装后，请打开item2工具，并执行：chmod 755 ~/tips.sh;~/tips.sh init"
	fi
}

function_install_tips_packages() {
	originDir=`pwd`
	# check tips version on gitlab and print the latest version on screen.
	rm -rf $DEFINE_UPDATE_TIPS_DIR
	rm -rf $DEFINE_TARGET_TIPS_DIR
	mkdir -p $DEFINE_UPDATE_TIPS_DIR
	cd $DEFINE_UPDATE_TIPS_DIR

	# TODO: zhangfan. here must be a remote .git url
	git clone $DEFINE_TIPS_PROJECT_URL
	cd $originDir

	if [[ -d $DEFINE_UPDATE_TIPS_PROJECT_DIR ]]; then
		rm -rf $DEFINE_TARGET_TIPS_DIR
		mkdir -p $DEFINE_TARGET_TIPS_DIR
		cp -rf $DEFINE_UPDATE_TIPS_PROJECT_DIR $DEFINE_TARGET_TIPS_DIR
		chmod 755 $DEFINE_TARGET_TIPS_DIR

		cp -rf $DEFINE_UPDATE_TIPS_PROJECT_DIR/tip.sh ~/tip.sh
		chmod 755 ~/tip.sh

		echo "\t\t 安装 tips 组件成功，重启终端工具后使用"
	else
		echo "\t\t 安装 tips 失败，请在网络可用情况下，重新执行 tips init"
	fi
	rm -rf $DEFINE_UPDATE_TIPS_PROJECT_DIR
	sync
}

function_init() {
	echo "电脑环境要求："
		echo "\t 1. MAC 电脑推荐安装终端工具：iterm2"
			echo "\t\t 1.1 确保电脑联网"
			echo "\t\t 1.2 安装 MAC 电脑必备工具 iterm2，官网安装地址：https://www.iterm2.com/downloads.html"
		echo "\t 2. 电脑具备 git，如果未安装，请参考如下文档进行安装："
			echo "\t\t 2.1 确保电脑联网"
			echo "\t\t 2.2 安装 MAC 电脑必备工具 Homebrew，官网安装地址：https://brew.sh"
			echo "\t\t 2.3 通过 Homebrew 安装 git，安装方式为：brew install git"
			echo "\t\t 2.4 打开 item2，执行 chmod 755 ~/tips.sh;~/tips.sh init"
		echo "\t 3. 全局环境部署："
			# init tips as a tool for mac os.
			function_initial_tips

			# install tips package.
			function_install_tips_packages
}

function_print_version() {
	if [[ ! -f $DEFINE_TARGET_TIPS_PROJECT_DIR/tips_version.sh ]]; then
		function_install_tips_packages
	else
		$DEFINE_TARGET_TIPS_PROJECT_DIR/tips_version.sh -version
	fi
}

function_print_latest_version() {
	if [[ ! -f $DEFINE_TARGET_TIPS_PROJECT_DIR/tips_version.sh ]]; then
		function_install_tips_packages
	else
		$DEFINE_TARGET_TIPS_PROJECT_DIR/tips_version.sh -latestVersion
	fi
}

function_update_tips() {
	# update tips by git
	if [[ ! -f $DEFINE_TARGET_TIPS_PROJECT_DIR/tips_version.sh ]]; then
		function_install_tips_packages
	else
		$DEFINE_TARGET_TIPS_PROJECT_DIR/tips_version.sh -update
	fi
}

function_print_port() {
	if [[ ! -f $DEFINE_TARGET_TIPS_PROJECT_DIR/tips_port.sh ]]; then
		function_install_tips_packages
	else
		$DEFINE_TARGET_TIPS_PROJECT_DIR/tips_port.sh
	fi
}

function_print_mount() {
	if [[ ! -f $DEFINE_TARGET_TIPS_PROJECT_DIR/tips_mount.sh ]]; then
		function_install_tips_packages
	else
		$DEFINE_TARGET_TIPS_PROJECT_DIR/tips_mount.sh
	fi
}

function_print_beyound_compare() {
	echo "I Love You"
}

function_print_log() {
	if [[ ! -f $DEFINE_TARGET_TIPS_PROJECT_DIR/tips_log.sh ]]; then
		function_install_tips_packages
	else
		$DEFINE_TARGET_TIPS_PROJECT_DIR/tips_log.sh
	fi
}

function_print_dumpsys() {
	if [[ ! -f $DEFINE_TARGET_TIPS_PROJECT_DIR/tips_dumpsys.sh ]]; then
		function_install_tips_packages
	else
		$DEFINE_TARGET_TIPS_PROJECT_DIR/tips_dumpsys.sh
	fi
}

function_print_usage() {
	if [[ ! -f $DEFINE_TARGET_TIPS_PROJECT_DIR/tips_help.sh ]]; then
		function_install_tips_packages
	else
		$DEFINE_TARGET_TIPS_PROJECT_DIR/tips_help.sh ${1}
	fi
}

function_execute() {
	case ${1} in
		"-h"|"--h"|"help"|"-help"|"--help"|"" )
			function_print_usage ${1}
			;;
		"-i"|"--i"|"init"|"-init"|"--init" )
			function_init
			;;
		"-v"|"--v"|"version"|"-version"|"--version" )
			function_print_version
			;;
		"-lv"|"--lv"|"latest_version"|"-latest_version"|"--latest_version" )
			function_print_latest_version
			;;	
		"-u"|"--u"|"update"|"-update"|"--update" )
			function_update_tips
			;;
		"-p"|"--p"|"port"|"-port"|"--port" )
			function_print_port
			;;
		"-m"|"--m"|"mount"|"-mount"|"--mount" )
			function_print_mount
			;;
		"-l"|"--l"|"log"|"-log"|"--log"|"logcat"|"-logcat"|"--logcat" )
			function_print_log
			;;
		"-d"|"--d"|"dump"|"-dump"|"--dump"|"dumpsys"|"-dumpsys"|"--dumpsys" )
			function_print_dumpsys
			;;
		"-compare" )
			function_print_beyound_compare
			;;
	esac
}

function_execute $1
