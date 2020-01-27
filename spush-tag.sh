#!/bin/bash

# Gather required parameters from user
if [[ -z "$1" ]]; then
	echo -e "ERR: Missing required parameters"
	echo -e "Usage: spush-tag [tag] [repo-dir(s)]"
	exit
fi

dirs=("$@")
currentDir=${PWD}

# Remove repos
if [[ ! -d ~/webiik-repos/cli/ ]]; then
	mkdir -p ~/webiik-repos/cli/
fi

if [[ "$#" == 1 ]]; then
	# Tag all repos

	# List all directories in src/Webiik
	for dir in src/*
	do
		# Remove the trailing "/"
		dir=${dir%*/}

		# Get everything after the final "/"
		dir=${dir##*/}

		# Remove existing split repo dir
		if [[ -d ~/webiik-repos/cli/${dir} ]]; then
			sudo rm -r ~/webiik-repos/cli/${dir}
		fi

		mkdir ~/webiik-repos/cli/${dir}

		cd ~/webiik-repos/cli/${dir}

		git init --bare

		cd ${currentDir}

		git subtree split --prefix=src/${dir} -b ${dir}

		git push ~/webiik-repos/cli/${dir} ${dir}:master

		cd ~/webiik-repos/cli/${dir}

		repo=$(echo ${dir} | perl -pe 's/([a-z]|[0-9])([A-Z])/\1-\2/g')
		repo=$(echo ${repo} | tr '[:upper:]' '[:lower:]')

		git remote add origin https://github.com/webiik/cli-${repo}.git

		git tag ${1}

		git push origin master --tags --force

		cd ${currentDir}

		git branch -D ${dir}

		git subtree push --prefix=src/${dir} https://github.com/webiik/cli-${repo}.git master --squash
	done
fi

if [[ "$#" > 1 ]]; then
	# Tag one or more repos
	for dir in "${dirs[@]:1}"
	do
		# Check if dir exists
		if [[ ! -d "src/${dir}" ]]; then
			echo -e "🚨ERR: src/${dir} doesn't exist, skipped."
			continue
		fi

		# Remove existing split repo dir
		if [[ -d ~/webiik-repos/cli/${dir} ]]; then
			sudo rm -r ~/webiik-repos/cli/${dir}
		fi

		mkdir ~/webiik-repos/cli/${dir}

		cd ~/webiik-repos/cli/${dir}

		git init --bare

		cd ${currentDir}

		git subtree split --prefix=src/${dir} -b ${dir}

		git push ~/webiik-repos/cli/${dir} ${dir}:master

		cd ~/webiik-repos/cli/${dir}

		repo=$(echo ${dir} | perl -pe 's/([a-z]|[0-9])([A-Z])/\1-\2/g')
		repo=$(echo ${repo} | tr '[:upper:]' '[:lower:]')

		git remote add origin https://github.com/webiik/cli-${repo}.git

		git tag ${1}

		git push origin master --tags --force

		cd ${currentDir}

		git branch -D ${dir}

		git subtree push --prefix=src/${dir} https://github.com/webiik/cli-${repo}.git master --squash
	done
fi