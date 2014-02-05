# history
HISTCONTROL=ignoreboth
shopt -s histappend
HISTSIZE=1000
HISTFILESIZE=2000

# allow resizing of window to be useful
shopt -s checkwinsize

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# virtualenv
export WORKON_HOME=~/Envs
mkdir -p $WORKON_HOME
. /usr/local/bin/virtualenvwrapper.sh

export ECLIPSE_HOME=/usr/lib/eclipse

# Start eclimd
alias eclimd='Xvfb :1 -screen 0 1024x765x24 &; DISPLAY=:1 ./eclipse/eclimd'
