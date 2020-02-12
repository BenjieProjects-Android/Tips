#!/bin/sh

### author: zhangfan
### email: 1281641968@qq.com
### TEL: 14792054362
### date: 2020年02月12日
### this scrip is using for develop tools ---> tips

### function list as below:
### function1: query tips local version.
### function2: query tips latest version by remote codes.
### function3: update tips.


DEFINE_TARGET_TIPS_DIR=~/.tips
DEFINE_TARGET_TIPS_PROJECT_DIR=$DEFINE_TARGET_TIPS_DIR/Tips
DEFINE_UPDATE_TIPS_DIR=~/.tips_update
DEFINE_UPDATE_TIPS_PROJECT_DIR=$DEFINE_UPDATE_TIPS_DIR/Tips
DEFINE_TIPS_PROJECT_URL=git@github.com:zhangfanschool/Tips.git

function_local_version() {
	echo "\t versionCode=1 \n\t versionName=1.0"
}

function_latest_version() {
	originDir=`pwd`
	# check tips version on gitlab and print the latest version on screen.
	rm -rf $DEFINE_UPDATE_TIPS_DIR
	mkdir -p $DEFINE_UPDATE_TIPS_DIR
	cd $DEFINE_UPDATE_TIPS_DIR
	# clone from remote.
	git clone $DEFINE_TIPS_PROJECT_URL
	cd $originDir

	if [[ -d $DEFINE_UPDATE_TIPS_PROJECT_DIR ]] && [[ -f $DEFINE_UPDATE_TIPS_PROJECT_DIR/tips_version.sh ]]; then
		echo "本地tips版本："
		function_local_version

		chmod -R 755 $DEFINE_UPDATE_TIPS_DIR
		echo "最新tips版本："
		$DEFINE_UPDATE_TIPS_PROJECT_DIR/tips_version.sh -version
	else
		echo "本地tips版本："
		function_local_version
		echo "最新tips版本查询失败，请检查网络连接情况..."
	fi
	rm -rf $DEFINE_UPDATE_TIPS_DIR
	sync
}

function_update_latest() {
	originDir=`pwd`
	# check tips version on gitlab and print the latest version on screen.
	rm -rf $DEFINE_UPDATE_TIPS_DIR
	mkdir -p $DEFINE_UPDATE_TIPS_DIR
	cd $DEFINE_UPDATE_TIPS_DIR
	# TODO: zhangfan. here must be a remote .git url
	git clone $DEFINE_TIPS_PROJECT_URL
	cd $originDir

	if [[ -d $DEFINE_UPDATE_TIPS_PROJECT_DIR ]] && [[ -f $DEFINE_UPDATE_TIPS_PROJECT_DIR/tips.sh ]]; then
		cp -rf $DEFINE_UPDATE_TIPS_PROJECT_DIR/tip.sh ~/tip.sh
		chmod 755 ~/tip.sh
		sync

		rm -rf $DEFINE_TARGET_TIPS_DIR
		mkdir -p $DEFINE_TARGET_TIPS_DIR
		cp -rf $DEFINE_UPDATE_TIPS_PROJECT_DIR $DEFINE_TARGET_TIPS_DIR
		chmod 755 $DEFINE_TARGET_TIPS_DIR
		sync
		echo "更新 tips 成功，请重启终端工具使用"
	else
		echo "更新 tips 失败，请检查网络链接情况..."
	fi
	rm -rf $DEFINE_UPDATE_TIPS_DIR
	sync
}

function_run_version() {
	case ${1} in
		"-version" )
		function_local_version
		;;
		"-latestVersion" )
		function_latest_version
		;;
		"-update" )
		function_update_latest
		;;
	esac
}

function_run_version $1
