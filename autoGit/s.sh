#!/bin/bash

# Check if access token is provided
if [[ -z "$1" ]]; then
    echo "Please provide access token as argument"
    exit 1
fi
# Set access token
ACCESS_TOKEN=$1

# Set the name of the repository and the directory containing the code
REPO_NAME="autoGit"
CODE_DIR="./"
GIT_USER="sergi-s"

# Check if the repository already exists
if curl --silent --fail --head "https://github.com/${GIT_USER}/${REPO_NAME}" >/dev/null; then
    echo "Repository ${REPO_NAME} already exists, pushing code..."
    git remote set-url origin "https://github.com/${GIT_USER}/${REPO_NAME}.git"
    git add .
    git commit -m "Initial commit"
    # git push origin main
    git push https://${GIT_USER}:${ACCESS_TOKEN}@github.com/${GIT_USER}/${REPO_NAME}.git

else
    echo "Creating repository ${REPO_NAME}..."

    curl -H "Authorization: token ${ACCESS_TOKEN}" -H "Content-Type: application/json" --data '{"name":"'${REPO_NAME}'"}' https://api.github.com/user/repos

    git config --global init.defaultBranch main
    git init
    git branch -M main
    git remote add origin "https://github.com/${GIT_USER}/${REPO_NAME}.git"
    git add .
    git commit -m "Initial commit"
    # git push -u origin main
    git push https://${GIT_USER}:${ACCESS_TOKEN}@github.com/${GIT_USER}/${REPO_NAME}.git
fi
