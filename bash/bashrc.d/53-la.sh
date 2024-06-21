la()
{
  if [ ${#1} -ne 0 ] && [ -d "$1" ]
  then
    PUSHED=1
    pushd "$1" >/dev/null
  elif [ -f "$1" ]
  then
    ls "$1"
    return
  else
    PUSHED=0
  fi

  OUT="$(ls -A)"
  for RM in .git .gitmodules
  do
    if [[ " $OUT " =~ " $RM " ]]; then
      OUT="${OUT/$RM}"
    fi
  done
  lsd ${OUT[@]}

  if [ $PUSHED -eq 1 ]; then
    popd >/dev/null
  fi
}
