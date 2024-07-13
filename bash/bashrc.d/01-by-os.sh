if [ "$ID" == "darwin" ] && [ "$PWD" == $(realpath -L "$HOME") ]
then
  cd
  alias apt='sudo apt'
fi

if [ "$ID" == "debian" ]
then
  alias dnf='sudo dnf'
  alias emerge='sudo emerge'
  alias pacman='sudo pacman'
fi
