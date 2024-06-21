_err()
{
  # capture exit code of previous command so it doesn't get changed
  ret=$?
  if [ ! $ret -eq 0 ]
  then
    echo -n "$ret|"
  fi
}

# split ps1 up into parts
_ps1_e="\[\e[1;31m\]"
_ps1_h="\[\e[1;32m\]\h "
_ps1_w="\[\e[1;36m\]\w "
_ps1_b="\[\e[m\]"
_ps1_u="$"

# set user symbol based on UID
if [ $(id -u) -eq 0 ]
then
  _ps1_u="#" _ps1_h=
fi

PS1="$_ps1_e"'$(_err)'"$_ps1_h$_ps1_w$_ps1_b$_ps1_u "
export PS1
