#!/bin/bash

source config.sh

git clone --mirror "$source_repo" project-clone

mkdir project-modified
cp -u -R project-clone/. project-modified

cd project-modified
git remote set-url origin --push "$target_repo"
