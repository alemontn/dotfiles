endl()
{
  IN=$(</dev/stdin) IN="${IN##*' '}"
  echo "$IN"
}
