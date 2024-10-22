# Prints the path that needs to be exported (in later functions)
# Takes:
# 1. Optional "-" specifying that the path (which comes in the next argument) is not relative
# 2. Path/Value that needs to be exported to the variable
_get_path() {
  if [ "" == "$1" ]; then echo $PWD
  elif [ "-" == "$1" ]; then echo "${@:2}" # Add all except 1st arg to path
  else echo "$PWD/$@"
  fi
}

export_path() {
  export PATH=$(_get_path $@):$PATH
}

# Start VSCode
vscode() {
    ~/Applications/Home\ Manager\ Apps/Visual\ Studio\ Code.app/Contents/MacOS/Electron "$@"
}