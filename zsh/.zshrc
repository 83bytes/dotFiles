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

# Cross-platform ls alias
if [[ $(uname) == "Darwin" ]]; then
  # macOS (BSD ls)
  alias ls="ls -G"
else
  # Linux (GNU ls)
  alias ls="ls --color --classify"
fi

# start a emacs thingy in the terminal (for very very small files)
alias ted="emacsclient -nw"

# start a emacs buffer with a new frame. 
alias ned="emacsclient -nc"

alias ec="emacsclient -n"

unset RPROMPT


typeset -U path

# Common paths
path=(
  $HOME/.opencode/bin
  $HOME/bin
  $HOME/.rbenv/bin
  $HOME/.local/bin
  $HOME/.pyenv/bin
  /usr/lib/ccache/bin
  /usr/local/go/bin
  /usr/local/bin
  /usr/local/sbin
  /bin
  /usr/bin
  /sbin
  /usr/sbin
  /opt/homebrew/bin        # macOS Homebrew
  /usr/lib/jvm/default/bin
  /usr/bin/site_perl
  /usr/bin/vendor_perl
  /usr/bin/core_perl
  $HOME/anaconda3/bin/
  /usr/games/
  $HOME/.tfenv/bin
  $HOME/.cargo/bin
  $HOME/zig/zig-nightly-latest/
  $HOME/zig/bin/
  /opt/nvim-linux-x86_64/bin
)


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


# This is for GO-Lang.
# Set up the system GOPATH
export GOPATH=$HOME/work_space/go/lib
export PATH=$PATH:$GOPATH/bin
export GOPATH=$GOPATH:$HOME/work_space/go/code

# Java Home (Linux specific mostly, but harmless if dir missing)
if [ -d "/usr/lib/jvm/java-21-openjdk-amd64" ]; then
    export JAVA_HOME=/usr/lib/jvm/java-21-openjdk-amd64
    export PATH=$JAVA_HOME/bin:$PATH
fi

#rbenv() {
#	unset -f rbenv
#	eval "$(rbenv init -)"
#	rbenv "$@"
#}

[[ $commands[kubectl] ]] && source <(kubectl completion zsh)

autoload -U +X bashcompinit && bashcompinit

if [ -x "/usr/bin/terraform" ]; then
    complete -o nospace -C /usr/bin/terraform terraform
fi

alias xtime="/bin/time --format  '%Uu %Ss %er %MkB %C'"



# completion for aws-cli
if [ -x "/usr/local/bin/aws_completer" ]; then
    complete -C /usr/local/bin/aws_completer aws
fi

export LANG=en_IN.UTF-8


[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion


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
if [ -f "$HOME/google-cloud-sdk/path.zsh.inc" ]; then . "$HOME/google-cloud-sdk/path.zsh.inc"; fi

# The next line enables shell command completion for gcloud.
if [ -f "$HOME/google-cloud-sdk/completion.zsh.inc" ]; then . "$HOME/google-cloud-sdk/completion.zsh.inc"; fi


alias pssh="parallel-ssh"
alias pscp="parallel-scp"

# Handle bat alias (batcat on some Linux, bat on others)
if command -v batcat >/dev/null 2>&1; then
    alias bat=batcat
fi


# rg to read into symlinks and ignore vcs things
# ideal for usage in shipment because we use heavy symlinking AND gitignores
alias rg="rg --no-ignore-vcs --follow"
alias kc="kubectx"
alias k="kubectl"
alias less="less -R"

export PNPM_HOME="$HOME/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac


if [ -f ~/.fzf.zsh ]; then
    source ~/.fzf.zsh
elif command -v fzf >/dev/null 2>&1; then
    # If fzf is installed but ~/.fzf.zsh doesn't exist (likely via brew)
    source <(fzf --zsh)
fi


#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"


if [ -n "${ZSH_DEBUGRC+1}" ]; then
    zprof
fi