# vim: filetype=sh

## ask before running risky commands
alias sudo="sudo " # makes sudo use my aliases as well
alias rm="rm -i"
alias mv="mv -i"
alias cp="cp -i"

## more useful aliases
COLOR_OPTION="--color=auto"
alias ls="ls -h $COLOR_OPTION"
alias grep="grep $COLOR_OPTION"

alias mkdir="mkdir -p"

alias cd..="cd .."
alias ..="cd .."
alias ll="ls -al"

alias du="du -h"
alias df="df -h"

if $(command -v xdg-open > /dev/null 2>&1 || exit 1;)
then
    alias open="xdg-open 2> /dev/null > /dev/null"
fi

## useful commands
alias bd=". bd -si"
alias pwgen="pwgen -syncB"
alias aptnew='aptitude search "~N ?not(dbgsym)"'

