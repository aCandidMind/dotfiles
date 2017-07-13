#!/usr/bin/env bash

pathcol=$(tput bold; tput setaf 4)
coloff=$(tput sgr0)

root="."                # define path here, not in 'find` arg
root="${root%/}/"       # add trailing '/'
name="${1:-*}"          # default to '*'
execCommand="${2:-cat}" # default to 'cat' command

find "$root" -name "$name" -printf "$pathcol------\n\n%p$coloff\n" -exec $execCommand {} \;
