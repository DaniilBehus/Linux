#!/bin/bash
query="$(echo "$@" | tr ' ' '+')"
url="https://arxiv.org/search/?query=${query}&searchtype=all&source=header"
curl -s "$url" | \
awk '{gsub(/>/,"\n>"); print}' | \
grep -oP '[0-9]{4}\.[0-9]{4,5}' | \
sed 's/<\/a//g' | \
sort -u
