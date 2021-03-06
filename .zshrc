#gentoo completion stuff
autoload -U compinit promptinit
compinit
promptinit; promptinit gentoo
zstyle ':completion::complete:*' use-cache 1
# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="ohcibi"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git vi-mode battery)


# Customize to your needs...
#
# some custom aliases
source ~/.aliases
#nocorrect aliases
alias sudo='nocorrect sudo'

PATH=$HOME/.rvm/bin:$PATH

source $ZSH/oh-my-zsh.sh

#bindkey for history search and delete char
bindkey "\e[3~" delete-char
bindkey "^R" history-incremental-search-backward

#bindkey for bol and eol
bindkey "\e[7~" beginning-of-line
bindkey "\e[8~" end-of-line


path=(~/bin ~/local/bin $path)

unset RUBYOPT


doge
