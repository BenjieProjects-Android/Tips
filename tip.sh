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
	if [[ ! -f ~/.bash_profile ]]; then
		touch ~/.bash_profile
	fi
	chmod 777 ~/.bash_profile
	bashProfileResult=$(cat ~/.bash_profile | grep alias | grep tips | grep tip.sh)
	if [[ "${bashProfileResult}"x == ""x ]]; then
		echo "" >> ~/.bash_profile
		echo alias tips=\'~/tip.sh\' >> ~/.bash_profile
		echo "\t\t MAC默认终端已经部署完成，如果您想使用默认终端工具，打开后，输入source ~/.bash_profile，即可全局使用tips命令"
	fi
	if [[ -d ~/.oh-my-zsh ]] && [[ -f ~/.zshrc ]]; then
		zshellResult=$(cat ~/.zshrc | grep alias | grep tips | grep tip.sh)
		if [[ "${zshellResult}"x == ""x ]]; then
			chmod 644 ~/.zshrc
			echo "" >> ~/.zshrc
			echo alias tips=\'~/tip.sh\' >> ~/.zshrc
		fi
		echo "\t\t oh-my-zsh环境部署完成，使用item2的终端即可全局使用 tips 命令"
	else
		echo "\t\t 未检测到电脑安装oh-my-zsh，安装iTerm2工具后，安装oh-my-zsh"
		echo "\t\t 安装好 iTerm2和oh-my-zsh后，执行：chmod 755 ~/tips.sh;~/tips.sh init完成iTerm2环境部署"
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
	rm -rf $DEFINE_UPDATE_TIPS_DIR
	sync
}

function_check_git() {
	brewResult=`type brew`
	if [[ ${brewResult} == *"brew not found"* ]]; then
		echo "\t\t 提示：brew 程序未安装，官网安装地址：https://brew.sh"
		echo "===>>> 正在为您安装brew程序 <<<==="
		/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
		echo "===>>> brew程序已安装完成 <<<==="
	fi
	gitResult=`type git`
	if [[ ${gitResult} == *"git not found"* ]]; then
		echo "\t\t 提示：git 程序未安装"
		echo "===>>> 正在为您安装git程序 <<<==="
		brew install git
		echo "===>>> git程序已安装完成 <<<==="
	fi
}

function_check_init_result() {
	# check tips
	if [[ -d $DEFINE_TARGET_TIPS_PROJECT_DIR ]] && [[ -f $DEFINE_TARGET_TIPS_PROJECT_DIR/tip.sh ]] && [[ -f ~/tip.sh ]]; then
		bashProfileResult=$(cat ~/.bash_profile | grep alias | grep tips | grep tip.sh)
		if [[ ${bashProfileResult} != "" ]]; then
			echo "tips初始化完成，MAC 默认终端部署完成，全局可用tips程序!!!"
		fi
		if [[ -d ~/.oh-my-zsh ]] && [[ -f ~/.zshrc ]]; then
			zshellResult=$(cat ~/.zshrc | grep alias | grep tips | grep tip.sh)
			if [[ "${zshellResult}" != "" ]]; then
				echo "tips初始化完成，iTerm2终端部署完成，全局可用tips程序!!!"
			else
				echo "tips初始化完成，iTerm2终端部署失败，so boring"
			fi
		fi
	fi
}

function_init() {
	echo "tips初始化中，请稍候..."
		echo "\t 1. git 程序检查中..."
			function_check_git
		echo "\t 2. iterm2，如已安装，请忽略。如未安装，请手动下载安装，官网安装地址：https://www.iterm2.com/downloads.html"
			# echo "\t\t 打开 item2，执行 chmod 755 ~/tips.sh;~/tips.sh init"
		echo "\t 3. tips全局环境部署中..."
			# init tips as a tool for mac os.
			function_initial_tips
			# install tips package.
			function_install_tips_packages
	# check tips
	function_check_init_result
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
