add_path()
{
 for ADD in $@
 do
  if [[ ! ":$PATH:" == *":$ADD:"* ]]
  then
   PATH+=:"$ADD"
  fi
 done
}

# root dirs
add_path /sbin /usr/sbin
# user bin
add_path "$ROOT"/bin
# cargo
add_path "$ROOT"/share/cargo/bin
# spicetify
add_path "$ROOT"/share/spicetify
# pmbootstrap
add_path "$ROOT"/opt/pmbootstrap/bin
# libadwaita-theme-changer
add_path "$ROOT"/opt/libadwaita-theme-changer/bin
