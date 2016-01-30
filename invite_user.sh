#!/bin/bash

github_token=$1
github_org=$2
user_file=$3

GITHUB_URL="https://api.github.com"

IFS=$'\n' read -d '' -r -a lines < $user_file
for user in "${lines[@]}"
do
  echo "Invite $user"
  api_endpoint="${GITHUB_URL}/orgs/${github_org}/memberships/${user}"
  /usr/bin/curl -H "Authorization: token ${github_token}" -H "Content-type: application/json" -X PUT -d '{"role": "member"}' "${api_endpoint}"
done
