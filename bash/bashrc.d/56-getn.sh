getn()
{
  if [ "$1" == "--help" ] || [ "$1" == "-h" ]
  then
    echo "Usage: getn <#>"
    echo "get nth (0-9) word from input"
    return
  fi

  n="$1"
  # provided input is empty or non-numeric
  if [ -z "$n" ] || [ -n "${n//[0-9]}" ]
  then
    echo "$FUNCNAME: value provided must be a numeric value"
    return 1
  fi

  # not running from a pipe
  if [ ! -p /dev/stdin ]
  then
    echo "$FUNCNAME: cannot correctly read from stdin as it is not a pipe"
    return 1
  fi

  # capure input to a variable
  in=$(</dev/stdin)

  # set integer word count
  declare -i wc=0

  for word in $in
  do
    # increment wc by 1
    wc+=1
    if [ $wc -eq $n ]
    then
      out="$word"$'\n'
      break
    fi
  done

  echo -n "$out"

  if [ ${#out} -eq 0 ]
  then
    return 1
  fi
}
