#!/usr/bin/env bash

set -e;

ql_gray='\033[1;30m'
ql_magenta='\033[1;35m'
ql_cyan='\033[1;36m'
ql_orange='\033[1;33m'
ql_green='\033[1;32m'
ql_no_color='\033[0m'


mkdir -p "$HOME/.oresoftware/bash"

curl -H 'Cache-Control: no-cache' "https://raw.githubusercontent.com/oresoftware/public-bash-utils/master/utils.sh?$(date +%s)" \
--output "$HOME/.oresoftware/bash/public-bash-utils.sh"


echo "";
echo -e "${ql_green} => public-bash-utils download/installation succeeded.${ql_no_color}";
echo "";
