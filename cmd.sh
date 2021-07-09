#!/usr/bin/env sh

set -e

statusCode=$(curl \
    --silent \
    --output \
    /response \
    --write-out "%{http_code}" \
    -X POST "https://api.github.com/repos/${ownerName}/${repoName}/branches/${oldName}/rename" \
    --header "Authorization: token ${accessToken}" \
    -d @/body)

if test "$statusCode" -ne 201; then
cat /response
exit 1
fi