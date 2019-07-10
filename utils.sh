#!/usr/bin/env bash


zmx_stderr='\033[1;35m'
zmx_stdout='\033[1;36m'
zmx_no_color='\033[0m'


tailing(){

  local v="${name-$tag}"  # default is name, tag is backup

  echo "tailing logs for ${v} ...";

  local zmx_var="zmx_$1"

  while read line; do
   echo -e "${!zmx_var}$v $1${zmx_no_color}: $line"
  done;
}

export -f tailing;

