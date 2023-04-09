#!/bin/bash

# Parse command line arguments
while [[ $# -gt 0 ]]; do
    key="$1"

    case $key in
    -t | --token)
        ACCESS_TOKEN="$2"
        shift # past argument
        shift # past value
        ;;
    -n | --name)
        REPO_NAME="$2"
        shift # past argument
        shift # past value
        ;;
    -u | --user)
        GIT_USER="$2"
        shift # past argument
        shift # past value
        ;;
    *) # unknown option
        echo "Unknown option: $1"
        exit 1
        ;;
    esac
done

# Check if access token is provided
if [[ -z "${ACCESS_TOKEN}" ]]; then
    echo "Please provide access token with -t or --token argument"
    exit 1
fi

# Check if access token is provided
if [[ -z "${REPO_NAME}" ]]; then
    echo "Please provide access repo name with -n or --name argument"
    exit 1
fi

# Check if access token is provided
if [[ -z "${GIT_USER}" ]]; then
    echo "Please provide access git username with -u or --user argument"
    exit 1
fi

# Set default values for other arguments
REPO_NAME="${REPO_NAME:-autoGit}"
GIT_USER="${GIT_USER:-sergi-s}"

Check if the repository already exists
if curl --silent --fail --head "https://github.com/${GIT_USER}/${REPO_NAME}" >/dev/null; then
    echo "Repository ${REPO_NAME} already exists, pushing code..."
    git remote set-url origin "https://github.com/${GIT_USER}/${REPO_NAME}.git"
    git add .
    git commit -m "Initial commit"
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
    git push https://${GIT_USER}:${ACCESS_TOKEN}@github.com/${GIT_USER}/${REPO_NAME}.git
fi
