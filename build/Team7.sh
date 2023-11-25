#!/bin/sh
echo -ne '\033c\033]0;Invictvs- 2023\a'
base_path="$(dirname "$(realpath "$0")")"
"$base_path/Team7.x86_64" "$@"
