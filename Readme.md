# Git Mirror

This is a collection of scripts to pull a repository form one remote and push it to another remote. It will require 2x the storage of the repository in order to convert your user account from one remote to the other.

## Mirror from one remote repository to another

1. Add ssh keys if needed (put them in the folder './.ssh/')
2. Configure config.sh and run init.sh
3. Run update.sh
4. Repeat step 3 if you want to update your sync

If you need to force-push you can update the last line of update.sh to do so.

## Features

- Mirror from one remote repository to another
- Rename Accounts (e.g. private email -> work email)

## Todo
- Incremental (Make the rewrites of the users incremental, so it doesn't need to rewrite the entire histoy every time)

## Motivation

We needed to put all our school projects on a school run git server. We didn't want to rely on their infrastructure (it also wasn't acessible from without the schools network) so we did most of the work on another git server, and then synced it to the schools internal server, when we were at school.