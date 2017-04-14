export PATH=~/bin:$PATH

HISTCONTROL=ignoredups
HISTSIZE=
HISTFILESIZE=

. ~/.bash_prompt
. ~/.bash_alias

eval `ssh-agent`
ssh-add ~/.ssh/id_rsa
