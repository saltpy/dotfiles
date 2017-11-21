export PATH=~/bin:/usr/local/sbin:$PATH

HISTCONTROL=ignoredups
HISTSIZE=
HISTFILESIZE=

if [ -z "$SSH_AUTH_SOCK" ] ; then
    eval `ssh-agent -s`
    ssh-add
fi

. ~/.bash_prompt
. ~/.bash_alias
. ~/.inputrc
