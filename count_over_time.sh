#! /bin/bash
# ./count_over_time.sh your-app git@gitlab.com/acme/your-app.git main

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

# Init report file
report_file="../../out/$folder_name.csv"
echo "DATE;LOC" > $report_file

# Get first date to work on if none provided
first_commit=$(git log --reverse --date="format:%Y-%m" --all | sed -n -e "3,3p")
first_commit_year=$((${first_commit:8:4}))
first_commit_month=$((${first_commit:13:2}))
echo "Detect first commit month for project: $first_commit_year / $first_commit_month"

# Get today date to prepare our loop
last_commit_year=$(date +%Y)
last_commit_month=$(date +%m)
echo "Looping between $first_commit_year-$first_commit_month and $last_commit_year-$last_commit_month (now), this can take a while"

# Loop on date range, ChatGPT helped me with Bash syntax on this loop ;)
current_year=$first_commit_year
current_month=$first_commit_month

while [[ $current_year -lt $last_commit_year || ($current_year -eq $last_commit_year && $current_month -le $last_commit_month) ]]; do
	year_month=$(printf "%04d-%02d" "$current_year" "$current_month")
    printf "🤖 Counting line of codes on $year_month 📆..."
    
    # Jump to commit at the given time
	git checkout --force $main_branch > /dev/null 2>&1
    git checkout --force `git rev-list -n 1 --first-parent --before="$current_year-$current_month-01" master` > /dev/null 2>&1

    # Count lines with sloccount
    source "../../call_sloccount.sh"

	# Save it in csv report
	echo "$year_month;$total_count" >> $report_file

	# Jump to next month
    current_month=$((current_month + 1))
    if [[ $current_month -gt 12 ]]; then
        current_month=1
        current_year=$((current_year + 1))
    fi
done

echo ""
echo "=============================================================================="
echo "CSV report exported to out/$work_folder.csv, time for you to make it shine! ✨"
 
