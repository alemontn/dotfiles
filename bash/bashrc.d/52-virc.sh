virc()
{
  SELF=0

  case "$1" in
    "-h"|"--help")
      echo "Usage: $FUNCNAME [ARGUMENT] [RC]"
      echo "edit bashrc or a file in bashrc.d"
      echo
      echo " -h, --help  print this help"
      echo " -l, --list  list terms from bashrc.d to edit"
      # hello self ^_^
      echo " -s, --self  edit virc itself"
      echo
      echo "If no RC file is provided, bashrc will be assumed"
      echo
      return
      ;;
    "-l"|"--list")
      for RC in "$ROOT"/etc/bashrc.d/*-*.sh
      do
        RC="${RC#*'-'}" RC="${RC%'.sh'}"
        echo "* $RC"
      done
      return
      ;;
    "-s"|"--self")
      RC=$(echo "$ROOT"/etc/bashrc.d/*-virc.sh)
      ;;
    "")
      RC="$RCFILE"
      ;;
    *)
      RC=$(echo "$ROOT"/etc/bashrc.d/*-"$1".sh)

      if [ ! -f "$RC" ]
      then
        echo "$FUNCNAME: $1: failed to match term to any file in $ROOT/etc/bashrc.d"
        return 1
      fi
      ;;
  esac

  TMPRC=$(mktemp /tmp/XXXXXXX-"$USER"-rc-"${RC##*'/'}")

  if ! command -v "$EDITOR" >/dev/null
  then
    EDITOR="nano"
    export EDITOR
  fi

  echo "$(<$RC)" >"$TMPRC"
  $EDITOR "$TMPRC"

  if [ "$(sha256sum - <$RC)" == "$(sha256sum - <$TMPRC)" ]
  then
    echo "$FUNCNAME: no changes made to rc file ($RC)"
  else
    cp "$TMPRC" "$RC" &&
     echo "$FUNCNAME: saved rc file ($RC)"
  fi

  rm "$TMPRC"
}
alias vi"${SHELL##*'/'}"rc=virc
