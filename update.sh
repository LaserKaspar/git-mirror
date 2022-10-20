cd project-clone

echo fetching

git fetch -p origin

echo copying

cd ../
cp -u -R project-clone/. project-modified

cd project-modified

git remote set-url origin --push git@gameprojects.spengergasse.at:KAS19559/5ahmng_2223_snowboards.git

echo filtering

# Change usernames

export FILTER_BRANCH_SQUELCH_WARNING=1

git filter-branch -f --env-filter '
OLD_EMAIL="ich@felixkaspar.com"
CORRECT_NAME="Kaspar Felix"
CORRECT_EMAIL="KAS19559@spengergasse.at"

if [ "$GIT_COMMITTER_EMAIL" = "$OLD_EMAIL" ]
then
    export GIT_COMMITTER_NAME="$CORRECT_NAME"
    export GIT_COMMITTER_EMAIL="$CORRECT_EMAIL"
fi
if [ "$GIT_AUTHOR_EMAIL" = "$OLD_EMAIL" ]
then
    export GIT_AUTHOR_NAME="$CORRECT_NAME"
    export GIT_AUTHOR_EMAIL="$CORRECT_EMAIL"
fi

OLD_EMAIL="51358097+ThatDragonn@users.noreply.github.com"
CORRECT_NAME="Simon Buketits"
CORRECT_EMAIL="BUK19444@spengergasse.at"

if [ "$GIT_COMMITTER_EMAIL" = "$OLD_EMAIL" ]
then
    export GIT_COMMITTER_NAME="$CORRECT_NAME"
    export GIT_COMMITTER_EMAIL="$CORRECT_EMAIL"
fi
if [ "$GIT_AUTHOR_EMAIL" = "$OLD_EMAIL" ]
then
    export GIT_AUTHOR_NAME="$CORRECT_NAME"
    export GIT_AUTHOR_EMAIL="$CORRECT_EMAIL"
fi
' --tag-name-filter cat -- --branches --tags

echo pushing

git push
