# vim: filetype=sh

# history configurations
# **********************
    ## delete last entry from history
    function histrm {
      last=`history | tail -1 | tr -s [:blank:] "\t" | cut -f 2`
      history -d $last
    }

    ## increase size of bash history
    export HISTSIZE=5000
    export HISEFILESIZE=5000
    ## ignore dublicates, ignore commands starting with space
    export HISTCONTROL=erasedups:ignorespace
    ## add timestamps to history
    export HISTTIMEFORMAT="%Y-%m-%d %H:%M "
    ## append instead of replace history file (history from multiple terminals)
    shopt -s histappend

    ## purge dups from historyfile whenever a new shell is opened and reload history (multiple terminals)
    ## - `tac`:         process file from bottom
    ## - `awk '[...]'`: only keep lines not yet in array x (i.e. last occurence command)
    ## - `tac`:         revert input again
    ## - `sed [...]`:   remove consecutive timestamp-lines left after awk deleted a command
    ##                  (timestamp-lines start with '#', keep last timestamp)
    if $(command -v sponge > /dev/null 2>&1 || exit 1;)
    then
        tac $HISTFILE | awk '!x[$0]++' | tac | sed -e '$!N;/^#.*\n#/D' -e 'P;D' | sponge $HISTFILE
    fi

    ## add every new command to the history file (only after command has finished)
    ##  `trap ... DEBUG` could be used to try and inject the command before execution
    ##  but this would trigger upon all commands used to prepare the prompt as well
    PROMPT_COMMAND="history -a; $PROMPT_COMMAND"
