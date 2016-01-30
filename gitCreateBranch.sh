#!/bin/sh
#git——创建分支脚本
cd .
pwd

#git branch  

if [ $# -lt 1 ];then
    echo -e "\033[31mError!\033[0m"
    echo -e "\033[41;37musage: $0 new_branch_name\033[0m"
    exit;
fi


FROM_BRANCH_NAME=$1

branchLine=$(git branch|fgrep $FROM_BRANCH_NAME|wc -l)
if [ $branchLine -ne 0 ];then
    echo -e "\033[41;37m$FROM_BRANCH_NAME is exist\033[0m"
    git checkout $FROM_BRANCH_NAME
    branchLine=$(git branch -r|fgrep 'origin/'$FROM_BRANCH_NAME|wc -l)
    if [ $branchLine -ne 0 ];then
        echo -e "\033[41;37mpull origin $FROM_BRANCH_NAME \033[0m"
        git pull origin $FROM_BRANCH_NAME
    else
        echo -e "\033[41;37mpull origin online hah \033[0m"
        git pull origin online
    fi
else
    echo -e "\033[41;37mgit checkout master\033[0m"
    git checkout master
    echo -e "\033[41;37m$FROM_BRANCH_NAME is't exist\033[0m"
    git checkout -b $FROM_BRANCH_NAME
    echo -e "\033[41;37mpull origin online\033[0m"
    git pull origin online
fi
echo -e "\033[41;37mAll branchs\033[0m"
git branch -a
exit
