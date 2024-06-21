SDKMAN_DIR="$ROOT"/share/sdkman

if [ -n "$SDKMAN_SOURCED" ] && [ $SDKMAN_SOURCED -ne 1 ]
then
  . "$SDKMAN_DIR"/bin/sdkman-init.sh 2>/dev/null &&
    SDKMAN_SOURCED=1
fi
