#
# Executes commands at the start of an interactive session.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Source Prezto.
export LC_ALL="en_US.UTF-8"
export LANG="en_IN.UTF-8"

if [ -n "${ZSH_DEBUGRC+1}" ]; then
	    zmodload zsh/zprof
fi

if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi
unsetopt correct


##########
# HISTORY
##########

HISTFILE=$HOME/.zsh_history
HISTSIZE=50000
SAVEHIST=50000

# Immediately append to history file:
setopt INC_APPEND_HISTORY

# Record timestamp in history:
setopt EXTENDED_HISTORY

# Expire duplicate entries first when trimming history:
setopt HIST_EXPIRE_DUPS_FIRST

# Dont record an entry that was just recorded again:
setopt HIST_IGNORE_DUPS

# Delete old recorded entry if new entry is a duplicate:
setopt HIST_IGNORE_ALL_DUPS

# Do not display a line previously found:
setopt HIST_FIND_NO_DUPS

# Dont record an entry starting with a space:
setopt HIST_IGNORE_SPACE

# Dont write duplicate entries in the history file:
setopt HIST_SAVE_NO_DUPS

# Share history between all sessions:
setopt SHARE_HISTORY

# Execute commands using history (e.g.: using !$) immediatel:
unsetopt HIST_VERIFY


alias ls="ls --color --classify"

# start a emacs thingy in the terminal (for very very small files)
alias ted="emacsclient -nw"

# start a emacs buffer with a new frame. 
alias ned="emacsclient -nc"

alias ec="emacsclient -n"

unset RPROMPT


typeset -U path

# for thinkpad
path=(/home/sohom/bin /home/sohom/.rbenv/bin /home/sohom/.local/bin /home/sohom/.pyenv/bin /usr/lib/ccache/bin /usr/local/go/bin /usr/local/bin /usr/local/sbin /bin /usr/bin /sbin /usr/sbin /usr/lib/jvm/default/bin /usr/bin/site_perl /usr/bin/vendor_perl /usr/bin/core_perl /home/sohom/anaconda3/bin/ /usr/games/ /home/sohom/.tfenv/bin /home/sohom/.cargo/bin /home/sohom/zig/zig-nightly-latest/ /home/sohom/zig/bin/)

#path=(/home/sohom/.pyenv/bin /home/sohom/.gem/ruby/2.4.0/bin /usr/lib/ccache/bin /usr/local/bin /usr/local/sbin /bin /usr/bin /usr/lib/jvm/default/bin /usr/bin/site_perl /usr/bin/vendor_perl /usr/bin/core_perl)


# nvm  (lazy load nvm)
nvm() {
    unset -f nvm
    export NVM_DIR=~/.nvm
    [ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
    [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
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


pyenv() {
	unset -f pyenv
	eval "$(pyenv init -)"
	pyenv "$@"
}
#
#
#if command -v pyenv 1>/dev/null 2>&1; then eval "$(pyenv init -)"; fi


# This is for different ssh keys for github

# alias gits='GIT_SSH_COMMAND="ssh -i ~/.ssh/git_people" git'
# alias gitp='GIT_SSH_COMMAND="ssh -i ~/.ssh/git_personal" git'


# This is for GO-Lang.
# Set up the system GOPATH
export GOPATH=$HOME/work_space/go/lib
export PATH=$PATH:$GOPATH/bin
export GOPATH=$GOPATH:$HOME/work_space/go/code

#rbenv() {
#	unset -f rbenv
#	eval "$(rbenv init -)"
#	rbenv "$@"
#}

[[ $commands[kubectl] ]] && source <(kubectl completion zsh)

autoload -U +X bashcompinit && bashcompinit
complete -o nospace -C /usr/bin/terraform terraform

alias xtime="/bin/time --format  '%Uu %Ss %er %MkB %C'"

#export GEM_HOME="$(ruby -e 'puts Gem.user_dir')"
#export PATH="$PATH:$GEM_HOME/bin"


# completion for aws-cli
complete -C /usr/local/bin/aws_completer aws
#eval "$(~/.rbenv/bin/rbenv init - zsh)"

export LANG=en_IN.UTF-8


[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

#if [ -d ~/.rbenv/bin ]; then 
#  eval "$(~/.rbenv/bin/rbenv init - zsh)"
#else
#  eval "$(rbenv init - zsh)"
#fi

# Find and set branch name var if in git repository.
function git_branch_name()
{
  branch=$(git symbolic-ref HEAD 2> /dev/null | awk 'BEGIN{FS="/"} {print $NF}')
  if [[ $branch == "" ]];
  then
    :
  else
    echo '- ('$branch')'
  fi
}

# Enable substitution in the prompt.
setopt prompt_subst

# Config for prompt. PS1 synonym.
RPROMPT='$(git_branch_name) $(date +%T)'


# The next line updates PATH for the Google Cloud SDK.
if [ -f '/home/sohom/google-cloud-sdk/path.zsh.inc' ]; then . '/home/sohom/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/home/sohom/google-cloud-sdk/completion.zsh.inc' ]; then . '/home/sohom/google-cloud-sdk/completion.zsh.inc'; fi


alias pssh="parallel-ssh"
alias pscp="parallel-scp"
alias l9cli-profile='source ~/.l9cli/profiles/$(ls -1 ~/.l9cli/profiles | fzf)'

alias aws-profile='export AWS_PROFILE=$(sed -n "s/\[profile \(.*\)\]/\1/gp" ~/.aws/config | fzf)'
alias bat=batcat


if [[ -s "/home/sohom/.l9/l9_alias" ]]; then
  source "/home/sohom/.l9/l9_alias"
fi

# rg to read into symlinks and ignore vcs things
# ideal for usage in shipment because we use heavy symlinking AND gitignores
alias rg="rg --no-ignore-vcs --follow"
alias kc="kubectx"
alias k="kubectl"
alias less="less -R"

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh



if [ -n "${ZSH_DEBUGRC+1}" ]; then
	    zprof
fi
