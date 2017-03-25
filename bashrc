prompt_color() {
	if [ $UID -eq 0 ]; then echo "1;31m"; else echo "1;32m"; fi
}

prompt_user() {
	if [ $UID -eq 0 ]; then echo '\h'; else echo '\u@\h'; fi
}

# Style promt
PS1='\[\033['`prompt_color`'\]'`prompt_user`'\[\033[0m\] \[\033[1;34m\]\W \$\[\033[0m\] '

# Private config
[[ -f ~/.bashrc.private ]] && source ~/.bashrc.private

# Local config
[[ -f ~/.bashrc.local ]] && source ~/.bashrc.local

# Private local config
[[ -f ~/.bashrc.private.local ]] && source ~/.bashrc.private.local

# X11 config
[[ -f ~/.bashrc.x11 ]] && source ~/.bashrc.x11

# aliases
[[ -f ~/.aliases ]] && source ~/.aliases

# If not running interactively, don't proceed
[[ $- != *i* ]] && return

# RVM
[[ -s "/usr/local/rvm/scripts/rvm" ]] && . "/usr/local/rvm/scripts/rvm"
[[ -s "/etc/profile.d/rvm.sh" ]] && . "/etc/profile.d/rvm.sh"

# NVM
[[ -f /usr/share/nvm/init-nvm.sh ]] && source /usr/share/nvm/init-nvm.sh


