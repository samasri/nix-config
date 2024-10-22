# print git branch
_pgb() {
  txt=$(git branch 2>&1)
  local e=$?
  if [ "$e" -eq "0" ]; then
      #local b=$(echo "$txt" | grep '*' | awk '{ print $1 }')
      # echo "$b"
      # local b=$(echo "$txt" | grep '*' | cut --delimiter=' ' --fields=2)
      # echo "$b"
      local b=$(echo "$txt" | grep '*')
      echo "${b:2}"
  fi
}

# print git status
_pgs() {
  txt=$(git status --porcelain 2>&1)
  local e=$?
  if [ "$e" -eq "0" ] && [ -n "$txt" ]; then
      echo "+"
  fi
}

# print git branch and status
_pgbs() {
  local b=$(_pgb)
  local s=$(_pgs)
  if [ -n "$b" ]; then
      echo "($b$s)"
  fi
}

# IMPORTANT: must capture exit status $? of previous command
# FIRST, otherwise, later commands in PS1 will overwrite $?
PS1='\[\033[01;32m\]samasri\[\033[00m\]:\w$(_pgbs)\$ '

export LSCOLORS='exfxcxdxbxegedabagacad'

ls() {
  command ls -G "$@"
}