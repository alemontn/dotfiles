clear_history()
{
  for HIST in $HISTFILE $ROOT/etc/bash_history* $HOME/.bash_history*
  do
    : >"$HIST" &&
      echo "cleared history file $HIST"
  done

  history -c &&
    echo "cleared history"
}
