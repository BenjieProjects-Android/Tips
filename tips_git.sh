#!/bin/sh

### author: zhangfan
### email: 1281641968@qq.com
### TEL: 14792054362
### date: 2020年02月12日
### this scrip is using for develop tools ---> tips

DEFILE_TOOLS_DIR=~/Desktop/jiras_zhiyan
DEFINE_TEMP_FILE_DIR=$DEFILE_TOOLS_DIR/temp
DEFINE_TEMP_FILE_RECORDING_JIRAID=$DEFINE_TEMP_FILE_DIR/jira_id_projects.txt
DEFING_TEMP_FILE_RECORDING_PROJECT_VERSION_DIFFS=$DEFINE_TEMP_FILE_DIR/debug_commits.txt

# 更新某套代码的所有分支
function_updateAllCodes() {
	if [[ $1 == "" ]] || [[ ! -d $1 ]] || [[ ! -d $1/.git ]]; then
		echo "$1 is illegal"
		exit 1
	fi
	cd $1
	git checkout master 
	git remote prune origin
	git branch -vv | grep ': 丢失]'| grep -v "\*" | awk '{ print $1; }' | xargs git branch -D
	git branch -vv | grep ': gone]'| grep -v "\*" | awk '{ print $1; }' | xargs git branch -D

	git branch -r | grep -v '\->' | while read remote; 
	do 
		git branch --track "${remote#origin/}" "$remote";
	done
	git fetch --all
	git pull --all
	cd -
}

function_getVersionDiffers() {
	# $1 git
	# $1 getDiffers
	# $3 is project path(abs path)
	# $4 is project name
	# $5 is versionA
	# $6 is versionB

	# check illegal params
	if [[ "${3}" == "" ]] || [[ "${4}" == "" ]] || [[ "${5}" == "" ]] || [[ "${6}" == "" ]] ; then
		echo "param is illegal, execute as this:"
		echo "\t tips git getDiffers /Users/zhangfan/project/android/StarkOS3.0/Settings Settings 1.38.7 1.38.4"
		exit 1
	fi
	if [[ ! -d $3 ]] || [[ ! -d $3/.git ]]; then
		echo "param is illegal, param1 must be a dir with git control"
		exit 1
	fi
	originDir=$(pwd)
	cd $3
	# update all branches for current project
	git stash
	function_updateAllCodes $3
	cd $3
	versionAExists=$(git tag -l --sort=-creatordate | grep $5)
	versionBExists=$(git tag -l --sort=-creatordate | grep $6)
	if [[ "${versionAExists}" == "" ]] || [[ "${versionBExists}" == "" ]]; then
		echo "param is illegal, versionA or versionB is not exists in this project"
		git stash pop
		cd $originDir
		exit 1
	fi
	# get version differents
	if [[ ! -d $DEFINE_TEMP_FILE_DIR ]]; then
		mkdir -p $DEFINE_TEMP_FILE_DIR
	fi
	rm -rf $DEFING_TEMP_FILE_RECORDING_PROJECT_VERSION_DIFFS
	git log --oneline --no-merges $5 ^$6 >> $DEFING_TEMP_FILE_RECORDING_PROJECT_VERSION_DIFFS
	result=$(cat $DEFING_TEMP_FILE_RECORDING_PROJECT_VERSION_DIFFS)
	if [[ $result == "" ]]; then
		rm -rf $DEFING_TEMP_FILE_RECORDING_PROJECT_VERSION_DIFFS
		git stash pop
		cd $originDir
		echo "$4工程，版本 $5 和 $6 暂无差异"
		exit 1
	fi
	git stash pop
	# get jiraIds and checking from jira systems
	jiraIds=$(cat $DEFING_TEMP_FILE_RECORDING_PROJECT_VERSION_DIFFS | grep -oE "\[(JIRA#([A-Za-z0-9]+-[0-9]+))\]" | sed -n "s/.*\[JIRA#\(.*\)\].*/\1/p"  | sort | uniq)
	echo "#####project::$4#####" >> $DEFINE_TEMP_FILE_RECORDING_JIRAID
	echo "$jiraIds" >> $DEFINE_TEMP_FILE_RECORDING_JIRAID

	rm -rf $DEFING_TEMP_FILE_RECORDING_PROJECT_VERSION_DIFFS
	cd $originDir
	echo "getDiffers sucess!!! file is ===>>> $DEFING_TEMP_FILE_RECORDING_PROJECT_VERSION_DIFFS,please checking"
}

function_execute() {
	case ${2} in
		"getDiffers" )
			echo "===>>> get differs beginning <<<==="
			function_getVersionDiffers "$@"
			echo "===>>> get differs ending <<<==="
			;;
		"updateCode" )
			if [[ $3 == "" ]] || [[ ! -d $3 ]] || [[ ! -d $3/.git ]]; then
				echo "第三个参数必须是目录，且受到git管控"
				exit 1
			fi
			function_updateAllCodes $3
			;;
		* )
			echo "tips git getDiffers/updateCode"
			;;
	esac
}

function_execute "$@"
