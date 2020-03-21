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

alias ec="emacsclient -n"

unset RPROMPT


typeset -U path

# for thinkpad
path=(/home/sohom/.rbenv/bin /home/sohomb/.local/bin /home/sohomb/.pyenv/bin /usr/lib/ccache/bin /usr/local/bin /usr/local/sbin /bin /usr/bin /usr/sbin /usr/lib/jvm/default/bin /usr/bin/site_perl /usr/bin/vendor_perl /usr/bin/core_perl /home/sohomb/anaconda3/bin/ /usr/games/)

#path=(/home/sohom/.pyenv/bin /home/sohom/.gem/ruby/2.4.0/bin /usr/lib/ccache/bin /usr/local/bin /usr/local/sbin /bin /usr/bin /usr/lib/jvm/default/bin /usr/bin/site_perl /usr/bin/vendor_perl /usr/bin/core_perl /home/sohom/work_space/anaconda3/bin/)


# nvm  (lazy load nvm)
nvm() {
    unset -f nvm
    export NVM_DIR=~/.nvm
    [ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
    nvm "$@"
}

node() {
    unset -f node
    export NVM_DIR=~/.nvm
    [ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
    node "$@"
}

npm() {
    unset -f npm
    export NVM_DIR=~/.nvm
    [ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
    npm "$@"
}


# The next line updates PATH for the Google Cloud SDK.
if [ -f '/home/sohomb/google-cloud-sdk/path.zsh.inc' ]; then . '/home/sohom/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/home/sohomb/google-cloud-sdk/completion.zsh.inc' ]; then . '/home/sohom/google-cloud-sdk/completion.zsh.inc'; fi

pyenv() {
	unset -f pyenv
	eval "$(pyenv init -)"
	pyenv "$@"
}
#
#
#if command -v pyenv 1>/dev/null 2>&1; then eval "$(pyenv init -)"; fi


# This is for different ssh keys for github

alias gits='GIT_SSH_COMMAND="ssh -i ~/.ssh/git_people" git'
alias gitp='GIT_SSH_COMMAND="ssh -i ~/.ssh/git_personal" git'


# This is for GO-Lang.
# Set up the system GOPATH
export GOPATH=$HOME/work_space/go
export PATH=$PATH:$GOPATH/bin

rbenv() {
	unset -f rbenv
	eval "$(rbenv init -)"
	rbenv "$@"
}


