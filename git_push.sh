#!/bin/bash
time=$(date "+%Y-%m-%d %H:%M:%S")
git_user_name=`git config user.name`
git_user_emal=`git config user.email`
if [ ! -n "$1" ] ;then
  echo "Please enter a message !"
  exit -1
fi
message="$1
Shell automatically submit code for ${git_user_name} email for ${git_user_emal} ${time}"
if [ ! -n "$2" ] ;then
  echo "Please enter git branch !"
  exit -1
fi
branch=$2
git pull origin ${branch}
git add --all
git commit -m "${message}"
git push origin ${branch}