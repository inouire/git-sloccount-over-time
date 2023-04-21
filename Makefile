SHELL := /bin/bash

# Customize these to your project settings, and use make run without args
project_name?="deck-app"
git_clone_url?=git@gitlab.com:ppe-analytics/deck-app.git
main_branch?=master

# Or use specific args, here are some examples:
# With make
#    make run project_name=your-project git_clone_url=git@plop.com/project main
# In Bash
#    ./count_over_time.sh your-project git@plop.com/project main

# Obviously debian specific, feel free to adapt :)
install:
	sudo apt install sloccount git

run:
	./count_over_time.sh "$(project_name)" "$(git_clone_url)" "$(main_branch)"
	
.PHONY:
	install run
