#!/usr/bin/env bash

rpm -qa --last  | grep "$(date +'%d %b %Y')" | cut -d' ' -f1  | sort
