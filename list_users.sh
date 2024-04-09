#!/bin/bash
API_URL = "https://api.github.com"

#GitHub username and token
USERNAME = $username
TOKEN = $token

#User and Repositary information through command line
REPO_OWNER=$1
REPO_NAME=$2

#Function to make a GET request to the GitHub API
function github_api_get {
  local endpoint="$1"
  local url="${API_URL}/${endpoint}"

  #send a GET request to the GitHub API with authentication
  curl -s -u "${USERNAME}":"${TOKEN}" "$URL"
}

  #Function to list users with read access to the repository
function list_users_with_read_access {
  local endpoint="repos/${REPO_OWNER}/${REPO_NAME}/collabrators"

  #fetch the list of collabrators on the repository
  collabrators="$(github_api_get "$endpoint" | jq -r '.[] | select(.permissions.pull == true | .login')"

  #display the list of collabrators with read access
  if [[-z "$collaborators" ]]; then
    echo "No users with read access found for ${REPO_OWNER}/${REPO_NAME}:"
  else
    echo "Users with read access to ${REPO_OWNER}/${REPO_NAME}:"
    echo "$collabrators"
  fi
}

echo "Listing users with read access to ${REPO_OWNER}/${REPO_NAME}
list_users_with_read_access
