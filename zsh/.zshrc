#
# Executes commands at the start of an interactive session.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi
unsetopt correct

alias ls="ls --color --classify"

# start a emacs thingy in the terminal (for very very small files)
alias ted="emacsclient -nw"

# start a emacs buffer with a new frame. 
alias ned="emacsclient -nc"


unset RPROMPT


typeset -U path

path=(/home/sohom/work_space/anaconda3/bin /home/sohom/.gem/ruby/2.4.0/bin /usr/lib/ccache/bin /usr/local/bin /usr/local/sbin /usr/bin /usr/lib/jvm/default/bin /usr/bin/site_perl /usr/bin/vendor_perl /usr/bin/core_perl)


# path=(~/.local/bin /other/things/in/path $path[@])

export TERM=xterm
source /usr/share/nvm/init-nvm.sh

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/home/sohom/google-cloud-sdk/path.zsh.inc' ]; then . '/home/sohom/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/home/sohom/google-cloud-sdk/completion.zsh.inc' ]; then . '/home/sohom/google-cloud-sdk/completion.zsh.inc'; fi
