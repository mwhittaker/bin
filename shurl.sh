#! /bin/bash

# shurl: a url shortener
#
# This script uses the Google URL Shortener API to shorten URLs from the
# command line. Make sure you have a Google API Key placed in
# $HOME/.shurl-api-key.

set -euo pipefail

main() {
    local readonly api_key_file="$HOME/.shurl-api-key"
    local readonly api_key="$(cat $api_key_file)"

    for url in "$@"; do
        curl "https://www.googleapis.com/urlshortener/v1/url?key=$api_key" \
            -s \
            -H 'Content-Type: application/json' \
            -d "{\"longUrl\": \"$url\"}" \
        | jq -r '.id'
    done
}

main "$@"
