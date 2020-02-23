#!/usr/bin/env bash

all_interos_export="yep"

if [[ ! "$SHELLOPTS" =~ "allexport" ]]; then
  all_interos_export="nope"
  set -a # we export every declared function using this flag
fi

zmx_stderr='\033[1;35m'
zmx_stdout='\033[1;36m'
zmx_no_color='\033[0m'

ores_install_public_bash_utils(){
  mkdir -p "$HOME/.oresoftware/bash";
  curl -H 'Cache-Control: no-cache' --silent \
     "https://raw.githubusercontent.com/oresoftware/public-bash-utils/master/utils.sh?$(date +%s)" \
      --output "$HOME/.oresoftware/bash/public-bash-utils.sh"
}

ores_publish_local(){
  mkdir -p "$HOME/.oresoftware/bash"
  cat "$BASH_SOURCE" > "$HOME/.oresoftware/bash/public-bash-utils.sh"
}

if [[ -d 'node_modules/.bin' ]]; then
   export PATH="$PWD/node_modules/.bin:${PATH}"
fi

ores_override_local_nm_cmds(){
   npm_bin_root="$(npm bin -g)"
   export PATH="$npm_bin_root:${PATH}"
}

ores_npmcd() {
   cd "$(npm root)" && cd ..
}

ores_get_versions(){
   echo "nodejs version: $(node --version)"
   echo "npm version: $(npm --version)"
   echo "typescript version: $(tsc --version)"
}

ores_check_git_index(){

  if [[  "$skip_check_git_index" == 'yes' ]]; then
     return 0;
  fi

  if  ! git diff --quiet; then
     echo 'Changes to files need to be committed. Check your git index.';
     echo 'Use skip_check_git_index=yes to skip check.';
     exit 1;
  fi

  if  test `git status --porcelain | wc -l` != '0'; then
     echo 'Changes to (untracked) files need to be committed. Check your git index.';
     echo 'Use skip_check_git_index=yes to skip check.';
     exit 1;
  fi

}


ores_resource(){
  for f in `(cd "$HOME/.oresoftware/bash" && find . -type f)`; do
       f="${f:2}"
     . "$HOME/.oresoftware/bash/$f"
  done;
}

ores_tailing(){

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


if [[ "$all_interos_export" == "nope" ]]; then
  set +a
fi


