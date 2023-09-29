#!/bin/bash

# Source the configuration file
source config.sh

cd project-clone

echo fetching

git fetch -p origin

echo copying

cd ../
cp -u -R project-clone/. project-modified

cd project-modified

git remote set-url origin --push "$target_repo"

echo filtering

export FILTER_BRANCH_SQUELCH_WARNING=1

# Build the filter-branch command dynamically
filter_cmd="git filter-branch -f --env-filter '"

for old_email in "${!email_mappings[@]}"; do
    new_author="${email_mappings[$old_email]}"
    filter_cmd+="
        if [ \"\$GIT_COMMITTER_EMAIL\" = \"$old_email\" ]; then
            export GIT_COMMITTER_EMAIL=\"$(echo $new_author | cut -d' ' -f1)\"
            export GIT_COMMITTER_NAME=\"$(echo $new_author | cut -d' ' -f2-)\"
        fi
        if [ \"\$GIT_AUTHOR_EMAIL\" = \"$old_email\" ]; then
            export GIT_AUTHOR_EMAIL=\"$(echo $new_author | cut -d' ' -f1)\"
            export GIT_AUTHOR_NAME=\"$(echo $new_author | cut -d' ' -f2-)\"
        fi
    "
done

filter_cmd+=" ' --tag-name-filter cat -- --branches --tags"
eval "$filter_cmd"

echo pushing

git push #-f
