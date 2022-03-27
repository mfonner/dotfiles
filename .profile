# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
#umask 022

# if running bash
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
	. "$HOME/.bashrc"
    fi
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/.local/bin" ] ; then
    PATH="$HOME/.local/bin:$PATH"
fi

# Set ls color output by default and other niceties
alias ls='ls --color=auto'
alias l='ls -l'
alias ll='ls -lah'

# Safer cp and mv operations
alias cp='cp -iv'
alias mv='mv -iv'

# Alias vim to always use neovim
alias vim='lvim'

# Common directories functions
alias cd..='cd ../'                         # Go back 1 directory level (for fast typers)
alias ..='cd ../'                           # Go back 1 directory level
alias ...='cd ../../'                       # Go back 2 directory levels
alias .3='cd ../../../'                     # Go back 3 directory levels
alias .4='cd ../../../../'                  # Go back 4 directory levels
alias .5='cd ../../../../../'               # Go back 5 directory levels
alias .6='cd ../../../../../../'            # Go back 6 directory levels

# Ensure we are using Python3 for everything
alias pip='python3 -m pip'
alias pip3='python3 -m pip'

# nvm path to avoid errors with lunarvim 
export PATH=~/.npm-global/bin:$PATH

# put ansible in our path
export PATH=~/.local/bin:$PATH

# Setting editor 
export EDITOR='lvim'

# Fixing gpg ioctl errors
export GPG_TTY=$(tty)
