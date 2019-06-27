#!/usr/bin/env bash


tailing(){
  echo "tailing logs for ${name} ...";
  while read line; do
   echo "$name $1: $line"
  done;
}

export -f tailing;