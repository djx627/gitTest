#!/bin/sh -e
#git——将远程分支合并到远程分支
cd .
pwd

if [ $# -lt 2 ];then
    echo -e "\033[31mError!\033[0m"
    echo -e "\033[41;37musage: $0 From_branch_name To_branch_name\033[0m"
    exit;
fi

git branch -a  

FROM_BRANCH_NAME=$1
TO_BRANCH_NAME=$2


if [ "$1" = 'test' -a "$2" != 'test' ] 
then
    echo -e "\033[31mError!\033[0m"
    echo -e "\033[41;37m禁止将test分支合并到其他分支！\033[0m"
    exit
fi

if [ "$1" = 'sim' -a "$2" != 'sim' ] 
then
    echo -e "\033[31mError!\033[0m"
    echo -e "\033[41;37m禁止将sim分支合并到其他分支！\033[0m"
    exit
fi

#if [ "$2" = 'sim' -o "$2" = 'online' ]
#then
#    echo -e "\033[31mError!\033[0m"
#    echo -e "\033[41;37m禁止合并分支到sim分支和online！\033[0m"
#    exit
#fi

#branchLine=$(git branch|fgrep '* '$FROM_BRANCH_NAME|wc -l)
#if [ $branchLine -eq 0 ];then
#    echo -e "\033[41;37m当前本地分支与参数中的源分支不同\033[0m"
#    exit;
#fi

#git status
#git checkout $FROM_BRANCH_NAME
#echo -e "\033[41;37mcommit fromB！\033[0m"
#git commit -am $FROM_BRANCH_NAME
#echo -e "\033[41;37mpush origin fromB！\033[0m"
#git push origin $FROM_BRANCH_NAME
echo -e "\033[41;37mcheckout toB！\033[0m"
git checkout $TO_BRANCH_NAME
echo -e "\033[41;37mfetch origin toB！\033[0m"
git fetch origin $TO_BRANCH_NAME
echo -e "\033[41;37mmerge fetch_head！\033[0m"
git merge FETCH_HEAD
echo -e "\033[41;37mfetch origin fromB！\033[0m"
git fetch origin $FROM_BRANCH_NAME
echo -e "\033[41;37mmerge fetch_head！\033[0m"
git merge FETCH_HEAD
echo -e "\033[41;37mpush origin toB！\033[0m"
git push origin $TO_BRANCH_NAME

echo -e "\033[31mgit push $FROM_BRANCH_NAME to $TO_BRANCH_NAME  Done!\033[0m\n"
git branch -a
exit
