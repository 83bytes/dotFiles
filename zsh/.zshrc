#
# Executes commands at the start of an interactive session.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Source Prezto.
export LC_ALL="en_US.UTF-8"
export LANG="en_IN.UTF-8"

# if [ -n "${ZSH_DEBUGRC+1}" ]; then
#     zmodload zsh/zprof
# fi

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
if [[ $OSTYPE == darwin* ]]; then
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

# start silverbullet with personal data dir
alias sb-start="silverbullet ~/workspace/personal/sb-data"

unset RPROMPT


typeset -U path

# Common paths
path=(
  /opt/homebrew/bin        # macOS Homebrew
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


# fnm (Fast Node Manager)
if (( $+commands[fnm] )); then
    typeset -g _fnm_lazy_initialized=0

    _fnm_lazy_init() {
        (( _fnm_lazy_initialized )) && return 0

        eval "$(command fnm env --use-on-cd)" || return
        _fnm_lazy_initialized=1
        command fnm use --silent-if-unchanged >/dev/null 2>&1
    }

    fnm()      { _fnm_lazy_init; command fnm "$@" }
    node()     { _fnm_lazy_init; command node "$@" }
    npm()      { _fnm_lazy_init; command npm "$@" }
    npx()      { _fnm_lazy_init; command npx "$@" }
    corepack() { _fnm_lazy_init; command corepack "$@" }
    pnpm()     { _fnm_lazy_init; command pnpm "$@" }
    yarn()     { _fnm_lazy_init; command yarn "$@" }
fi



pyenv() {
    unset -f pyenv
    eval "$(pyenv init -)"
    pyenv "$@"
}

# pyenv initialization deferred until first `pyenv` command.


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

rbenv() {
	unset -f rbenv
	eval "$(rbenv init -)"
	rbenv "$@"
}

if [[ -n $commands[kubectl] ]]; then
    _kubectl_completion_cache="${XDG_CACHE_HOME:-$HOME/.cache}/prezto/kubectl-completion.zsh"
    _kubectl_completion_loaded=0

    _kubectl_load_completion() {
        (( _kubectl_completion_loaded )) && return 0

        if [[ ! -s $_kubectl_completion_cache || $commands[kubectl] -nt $_kubectl_completion_cache ]]; then
            command kubectl completion zsh >| "$_kubectl_completion_cache" || return
        fi

        source "$_kubectl_completion_cache" || return
        _kubectl_completion_loaded=1
    }

    _kubectl_lazy_complete() {
        _kubectl_load_completion || return
        _kubectl "$@"
    }

    kubectl() {
        _kubectl_load_completion || return
        command kubectl "$@"
    }

    compdef _kubectl_lazy_complete kubectl
fi

autoload -U +X bashcompinit && bashcompinit

if [ -x "/usr/bin/terraform" ]; then
    complete -o nospace -C /usr/bin/terraform terraform
fi




# completion for aws-cli
if [ -x "/usr/local/bin/aws_completer" ]; then
    complete -C /usr/local/bin/aws_completer aws
fi

# Clock, directory, and Sorin's asynchronous Git status before the prompt arrows.
zstyle ':prezto:module:git:info:branch' format ' %%B%F{2}(%b)%f%%b'
PROMPT='%D{%T} ${SSH_TTY:+"%F{9}%n%f%F{7}@%f%F{3}%m%f "}%F{4}${_prompt_sorin_pwd}%(!. %B%F{1}#%f%b.)${_prompt_sorin_git:+ }${_prompt_sorin_git}${editor_info[keymap]} '
RPROMPT=''


# The next line updates PATH for the Google Cloud SDK.
if [ -f "$HOME/google-cloud-sdk/path.zsh.inc" ]; then . "$HOME/google-cloud-sdk/path.zsh.inc"; fi

# The next line enables shell command completion for gcloud.
if [ -f "$HOME/google-cloud-sdk/completion.zsh.inc" ]; then . "$HOME/google-cloud-sdk/completion.zsh.inc"; fi


alias pssh="parallel-ssh"
alias pscp="parallel-scp"

# # Handle bat alias (batcat on some Linux, bat on others)
if command -v batcat >/dev/null 2>&1; then
    alias bat=batcat
fi


# rg to read into symlinks and ignore vcs things
# ideal for usage in shipment because we use heavy symlinking AND gitignores
alias rg="rg -i -uu --no-ignore-vcs --follow --glob '!.git/**'"
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
elif command -v fzf >/dev/null 2>&1 && [[ -t 0 ]]; then
    _fzf_completion_cache="${XDG_CACHE_HOME:-$HOME/.cache}/prezto/fzf.zsh"
    if [[ ! -s $_fzf_completion_cache || $commands[fzf] -nt $_fzf_completion_cache ]]; then
        command fzf --zsh >| "$_fzf_completion_cache"
    fi
    [[ -s $_fzf_completion_cache ]] && source "$_fzf_completion_cache"
    unset _fzf_completion_cache
fi


#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"


# bun completions
[ -s "/Users/sohom/.bun/_bun" ] && source "/Users/sohom/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"


export PATH="/opt/homebrew/opt/libpq/bin:$PATH"

# Machine-local Vault helpers.
if [[ "${HOST%%.*}" == "M25000JX00" ]]; then
  source "$HOME/.cloudflare/vault-helpers.zsh"
fi

if [ -n "${ZSH_DEBUGRC+1}" ]; then
    zprof
fi

# Nix (not on office laptop)
if [[ "${HOST%%.*}" != "M25000JX00" ]]; then
    unset __ETC_PROFILE_NIX_SOURCED
    unset __NIX_PROFILE_SOURCED

    if [ -e '/nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh' ]; then
    . '/nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh'
fi
# End Nix