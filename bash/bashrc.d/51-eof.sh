eof()
{
  while read line
  do
    if [ "${line,,}" == "eof" ]
    then
      echo "$OUT"
      OUT=
      return
    elif [ ${#OUT} -eq 0 ]
    then
      OUT+="$line"
    else
      OUT+=$'\n'"$line"
    fi
  done \
   <&2
}
