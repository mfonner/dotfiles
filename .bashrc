# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# Showing git status on bash prompt
source ~/.config/git-prompt.sh
GIT_PS1_SHOWUPSTREAM="auto"
GIT_PS1_SHOWCOLORHINTS="yes"
GIT_PS1_SHOWDIRTYSTATE="yes"

#PS1='\[\033[38;5;12m\]\W $(__git_ps1 "(%s)")$ \[$(tput sgr0)\]'
PS1='\[\033[38;5;12m\]\W \[$(tput sgr0)\]\[\033[38;5;2m\]$(__git_ps1 "(%s)")\[$(tput sgr0)\]$ \[$(tput sgr0)\]'
