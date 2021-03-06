## .bashrc file for interactive bash(1) shells.

## are we an interactive shell?
[ -z "$PS1" ] && return


if [ -d $HOME/.config/bash/ ]; then
    for f in $HOME/.config/bash/*.bashrc
    do
        . "$f"
    done
fi


# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# Bash Completion, if available
# *****************************
# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

## might be needed to suppress expansion of ~ in bash_completion
#_expand() {
#  return 0
#}

