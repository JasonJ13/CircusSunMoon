#!/bin/sh
printf '\033c\033]0;%s\a' CircusSunMoon
base_path="$(dirname "$(realpath "$0")")"
"$base_path/CircusSunMoon.x86_64" "$@"
