#!/usr/bin/env bash


zmx_stderr='\033[1;35m'
zmx_stdout='\033[1;36m'
zmx_no_color='\033[0m'

publish_local(){
 cat "$BASH_SOURCE" > "$HOME/.oresoftware/bash/public-bash-utils.sh"
}


ores_resource(){
  for f in `(cd "$HOME/.oresoftware/bash" && find . -type f)`; do
       f="${f:2}"
     . "$HOME/.oresoftware/bash/$f"
  done;
}

tailing(){

   local v="$name";

    if [[ -z "$v" ]]; then
       v="$tag"
    fi

  echo "tailing logs for ${v} ...";

  local zmx_var="zmx_$1"

  while read line; do
   echo -e "${!zmx_var}$v $1${zmx_no_color}: $line"
  done;
}

export -f tailing;

