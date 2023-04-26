#! /bin/bash
# ./count_once.sh your-app git@gitlab.com/acme/your-app.git main

project_name=$1
git_clone_url=$2
main_branch=$3

# Prepare work folder on which we will change branch
mkdir -p "tmp" "out"
folder_name="$project_name-$(date '+%Y-%m-%d-%H-%M-%S')"
work_folder="tmp/$folder_name"
echo "Cloning project to work folder $work_folder..."
git clone $git_clone_url $work_folder
cd $work_folder

# Jump to latest commit
git checkout --force $main_branch > /dev/null 2>&1
git pull

# Count lines with sloccount
source "../../call_sloccount.sh"
