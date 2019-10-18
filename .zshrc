# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/Users/mcoleman9/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="robbyrussell"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in ~/.oh-my-zsh/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS=true

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

ZSH_THEME="powerlevel9k/powerlvel9k"
source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# vvvvvv Micah's aliases vvvvv
alias df='df -h'
alias l='ls -lahtrG'
alias ldir='l | grep ^d'
alias ldnod='ldir | grep -Ev "\.\S*$"'
alias lnod='l | grep -Ev "\.\S*$"'
cdl() { cd $1; l;}
alias cp='cp -p'
if  [ `uname` = 'Darwin' ]; then
    alias d='du -h -d 1'
else
    alias d='du -h --max-depth=1'
fi
alias dg='d | grep G'
alias dgm='d | grep -e G -e M'
alias dqr='diff -qr'
# alias grep='grep -n --color=auto'
alias g='grep -n --color=auto'
alias igrep='grep -i'
alias hd='hexdump -C'
alias python2='/Users/mcoleman9/anaconda2/bin/python'
# alias python3='/Users/mcoleman9/anaconda3/bin/python'
alias conda2='~/anaconda2/bin/conda'
alias python=python3
alias p='python'
alias p2='python2'
alias p3='python3'
alias pmc='python -m cProfile -s time'
alias jun='jupyter notebook'
# export PYTHONPATH=/Library/Python/2.7/site-packages:/System/Library/Frameworks/Python.framework/Versions/2.7:/usr/local/lib/python2.7/site-packages/:/usr/local/lib/python2.7/site-packages/gtk-2.0
alias bc='bc -q'
alias pe='perl'
alias pw='perl -w'
alias godb='cd ~/Dropbox'
alias cut='cut --delimiter=" "'
alias viz="vi ~/.zshrc"
alias soz="source ~/.zshrc"
alias viv='sudo vi ~/.vimrc'
alias goback='cd $OLDPWD'
alias vi='vim'
alias h='head'
alias h1='head -1'
alias h2='head -2'
alias h3='head -3'
alias h4='head -4'
alias h5='head -5'
alias h50='head -50'
alias t='tail'
alias t1='tail -1'
alias t2='tail -2'
alias t3='tail -3'
alias t4='tail -4'
alias t5='tail -5'
alias t50='tail -50'
alias hist='history'
alias ht='history | tail'
go() { cd ~/$1; }
bb() { echo $1 | bc -l; }
alias fii='find . -iname '
alias fwc='find . | wc'
alias lwc='l . | wc'
alias wcl='wc -l'
alias eject='diskutil unmount'
alias apwd='a="$PWD"'
alias cda='cd "$a"'
alias bpwd='b="$PWD"'
alias cdb='cd "$b"'
alias cpwd='c="$PWD"'
alias cdc='cd "$c"'
alias g11='g++ --std=c++11'
# ^^^^^^ end Micah's aliases ^^^^

# vvvvv Micah's git aliases vvvvvvvvvv
alias ga='git add'
alias gd='git diff'
alias gvi='git difftool'
alias gl='git log --graph'
alias gl1='git log --graph -1'
alias gl2='git log --graph -2'
alias gs='git status'
alias gb='git branch -av --sort=-committerdate'
alias gbh='gb | head -20'
alias gh='git help'
alias gf='git fetch'
alias gfb='gf;gb'
alias gc='git checkout'
alias gcb='git checkout -b'
alias gcm='git commit -m'
alias grs='git remote -v show'
alias gbl='git blame'
alias greb='git rebase'
if [ -f $(brew --prefix)/etc/bash_completion ]; then
      . $(brew --prefix)/etc/bash_completion
fi
# ^^^^^ end Micah's git aliases ^^^^^^

# vvvvvvvvvvvvvvvvvv Java vvvvvvvvvvvvvvv
alias j='java'
alias jc='javac'
# ^^^^^^^^^^^^^^^^^^ end Java ^^^^^^^^^^^

# # vvvvvvvvvvvvvvvvvv HACCS vvvvvvvvvvvvvvv
# # let direnv integrate with the shell for Rhamnousia / Lavos
# export LAVOWEB_CONFIG=~/.config/lavoweb/config
# eval "$(direnv hook bash)"
# eval "$(pyenv init -)"
# alias prfr="flask run" #"poetry run flask run"
# alias prpt="poetry run pytest"
# alias lup="lavo_util populate 2019-05-22"
# alias get-token="~/.get-token"
# alias dcu="docker-compose up"
# alias dcd="docker-compose down --volumes"
# alias dbtdp="docker build -t docker-postgres ."
# export PGPASSWORD="lavolib_testing"
# alias lavoweb-cli="~/stash/lavoweb-cli/target/release/lavoweb-cli"
# # ^^^^^^^^^^^^^^^^^^ HACCS ^^^^^^^^^^^

# vvvvvvvvvvvvvvvvvv Rust vvvvvvvvvvvvvvv
alias cr="cargo run"
alias ct="cargo test"
alias cb="cargo build"
# ^^^^^^^^^^^^^^^^^^ Rust ^^^^^^^^^^^

# vim bindings on command line:
set -o vi
# bind '"fj":"\e"'
bindkey -s fj '\e'
bindkey "^?" backward-delete-char
bindkey '^[[3~' delete-char
