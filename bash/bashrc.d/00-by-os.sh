. /etc/os-release
if [ "$ID" == "fedora" ] && [ "$PWD" == $(realpath -L "$HOME") ]
then
  cd
  alias apt='sudo apt'
fi
