rmstr()
{
  # get first n words
  if [[ "$1" == "-n"[0-9] ]]
  then
    # remove first 2 chars since they are -n which means nothing in this context
    char="${1:2}"
    shift
  elif [ "$1" == "-h" ] || [ "$1" == "--help" ]
  then
    echo "Usage: $FUNCNAME [ARGUMENT] <STR>"
    echo "remove a string from a text"
    echo
    echo "Arguments:"
    echo " -h, --help     print this help"
    echo " -l, --literal  don't take arguments"
    echo " -n[#]          get first n words"
    echo
    return
  # move to next args
  elif [ "$1" == "-l" ] || [ "$1" == "--literal" ]
  then
    shift
  fi

  rm="$1"

  # if running from a pipe
  if [ -t 1 ]
  then
    in=$(</dev/stdin)
  else
    in="$*"
  fi

  if [ ! ${#chars} -eq 0 ]
  then
    # remove last word until n has been achieved
    declare -i loop=0
    while [ ! $loop -eq $chars ]
    do
      in="${in%' '*}"
      loop+=1
    done
  fi

  if [ ! ${#rm} -eq 0 ]
  then
    in="${in/"$rm"}"
  fi

  echo "$in"
}
