# autoload functions
function autoload_funcdir {
  if [[ ! -d "$1" ]]; then
    >&2 echo "Function directory not found: $1" && return 1
  fi
  fpath=("$1" $fpath)
  local fn; for fn in "$1"/*(.N); do
    autoload -Uz "$fn"
  done
}
ZFUNCDIR="${ZFUNCDIR:-$ZDOTDIR/functions}"
autoload_funcdir "$ZFUNCDIR"