# BetterMirror

## Mirror from one remote repository to another
1. Add ssh keys if needed (put them in the folder './.ssh')
2. Configure and run init.sh (It will pull from remote1)
3. Configure update.sh
4. Run update.sh to push to remote2 (It will rename and push to remote2)
5. Repeat step 4 if you want to update remote2

## Features

- Mirror from one remote repository to another
- Rename Accounts (e.g. private email -> work email)
- Incremental (Uses the power of git to be fast)