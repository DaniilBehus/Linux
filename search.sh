#!/bin/bash

query=$(echo "$@" | tr ' ' '+')


bing_url="https://www.bing.com/search?q=${query}"


curl -s -A "Lynx" "$bing_url" | \
tr -d '\n' | \
tr '<' '\n' | \
grep -oP 'href="https?://[^"]*' | \
cut -d'"' -f2 | \
grep -vE "(microsoft|bing|creativecommons)" | \
sort | uniq
