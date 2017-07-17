# vim: filetype=sh

## Set a fancy prompt
## With full path (relative to home)
red='\e[1;31m'
green='\e[1;32m'
yellow='\e[1;33m'
cyan='\e[1;36m'

# Test connection type:
if pstree -ps $$ | grep -q sshd
then
    CNX=${cyan}      # Connected on remote machine, via ssh (good).
else
    CNX=${green}     # Connected on local machine.
fi

# Test user type:
if [ "${USER}" == "root" ]
then
    SU=${red}           # User is root.
elif [ "${USER}" != "$(logname)" ]; then
    SU=${yellow}        # User is not login user.
else
    SU=${CNX}           # User is normal.
fi

export PS1="\[${SU}\]\u\[${CNX}\]@\h: \w\[\e[0;36m\]\$(__git_ps1)\[${CNX}\] \$\[\e[0m\] "
