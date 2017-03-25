# Load files in ~/.zsh/functions, ~/.zsh/configs/pre, ~/.zsh/configs, and
# ~/.zsh/configs/post in this order
_load_settings() {
  _base="$1"

  # Load functions
  _fdir="$_base/functions"
  if [ -d "$_fdir" ]; then
    for function in "$_fdir"/*; do
      source $function
    done
  fi

  # Load configs, configs/pre and configs/post
  _dir="$_base/configs"
  if [ -d "$_dir" ]; then
    if [ -d "$_dir/pre" ]; then
      for config in "$_dir"/pre/**/*(N-.); do
        . $config
      done
    fi

    for config in "$_dir"/**/*(N-.); do
      case "$config" in
        "$_dir"/pre/*)
          :
          ;;
        "$_dir"/post/*)
          :
          ;;
        *)
          if [ -f $config ]; then
            . $config
          fi
          ;;
      esac
    done

    if [ -d "$_dir/post" ]; then
      for config in "$_dir"/post/**/*(N-.); do
        . $config
      done
    fi
  fi
}
_load_settings "$HOME/.zsh"

# Private config
[[ -f ~/.zshrc.private ]] && source ~/.zshrc.private

# Local config
[[ -f ~/.zshrc.local ]] && source ~/.zshrc.local

# Private local config
[[ -f ~/.zshrc.private.local ]] && source ~/.zshrc.private.local

# X11 config
[[ -f ~/.zshrc.x11 ]] && source ~/.zshrc.x11

# aliases
[[ -f ~/.aliases ]] && source ~/.aliases
