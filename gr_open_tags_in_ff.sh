#!/usr/bin/env bash

gr $1 git config remote.origin.url | awk --field-separator ':' '/git@git/ { print substr($NF, 1, length($NF)-4) }'| xargs -d"\n" -I"{}" firefox "github.com/{}/releases/tag/$2"
