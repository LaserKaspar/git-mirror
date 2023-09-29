#!/bin/bash

# Define source and target repositories
source_repo="git@github.com:LaserKaspar/Snowboards.git"
target_repo="git@gameprojects.spengergasse.at:KAS19559/5ahmng_2223_snowboards.git"

# Define email mappings
declare -A email_mappings=(
    # ["source-email"]="target-email target-name"
    ["KAS19559@spengergasse.at"]="ich@felixkaspar.com Kaspar Felix"
    ["BUK19444@spengergasse.at"]="51358097+ThatDragonn@users.noreply.github.com Simon Buketits"
    # Add more mappings as needed
)