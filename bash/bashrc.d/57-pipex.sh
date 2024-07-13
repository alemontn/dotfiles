pipex()
{
  # safely make temporary file
  tmpsh=$(mktemp /tmp/XXXXXXX-pipex)

  # copy with permissions
  install -m755 /dev/stdin "$tmpsh"
  # run
  "$tmpsh"

  rm -f "$tmpsh"
}
