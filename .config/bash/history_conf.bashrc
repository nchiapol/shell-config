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
    ## append instead of replace history file (history from multiple terminals)
    shopt -s histappend
    ## purge dups from historyfile whenever a new shell is opened and reload history (multiple terminals)
    if $(command -v sponge > /dev/null 2>&1 || exit 1;)
    then
        tac $HISTFILE | awk '!x[$0]++' | tac | sponge $HISTFILE
    fi
    ## add every new command to the history file
    PROMPT_COMMAND="history -a; $PROMPT_COMMAND"
