# Keep zsh open when run with eval:
# zsh -is eval 'shell command'
if [[ $1 == eval ]]; then
  "$@"
  set --
fi
