# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# don't put duplicate lines in the history. See bash(1) for more options
# ... or force ignoredups and ignorespace
HISTCONTROL=ignoredups:ignorespace

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "$debian_chroot" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
#    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

#    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
# alias l='ls -CF'



# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
    . /etc/bash_completion
fi
#

# vvvvvv Micah's aliases vvvvv
alias df='df -h'
alias l='ls -lahtrG'
alias ld='l | grep ^d'
alias ldnod='ld | grep -Ev "\.\S*$"'
alias lnod='l | grep -Ev "\.\S*$"'
cdl() { cd $1; l;}
alias cp='cp -p'
if  [ `uname` = 'Darwin' ]; then
    alias d='du -h -d 1'
else
    alias d='du -h --max-depth=1'
fi
alias dg='d | grep G'
# alias grep='grep -n --color=auto'
alias g='grep -n --color=auto'
alias p='python'
alias pmc='python -m cProfile -s time'
export PYTHONPATH=/Library/Python/2.7/site-packages:/System/Library/Frameworks/Python.framework/Versions/2.7:/usr/local/lib/python2.7/site-packages/:/usr/local/lib/python2.7/site-packages/gtk-2.0
alias bc='bc -q'
alias pe='perl'
alias pw='perl -w'
alias godb='cd ~/Dropbox'
alias cut='cut --delimiter=" "'
alias vib='vi ~/.bashrc'
alias sob='source ~/.bashrc'
alias viv='sudo vi /usr/share/vim/vimrc'
alias goback='cd $OLDPWD'
alias vi='vim'
alias h='head'
alias h1='head -1'
alias h2='head -2'
alias h3='head -3'
alias h4='head -4'
alias h5='head -5'
alias t='tail'
alias t1='tail -1'
alias t2='tail -2'
alias t3='tail -3'
alias t4='tail -4'
alias t5='tail -5'
alias hist='history'
alias hi='history'
alias ht='history | tail'
go() { cd ~/$1; }
bb() { echo $1 | bc -l; }
export rhip=10.15.50.108
alias sshrhip='ssh mcoleman@10.15.50.108'
alias fii='find . -iname '
alias fwc='find . | wc'
alias lwc='l . | wc'
alias wcl='wc -l'
alias r='fc -s'
alias r2='r -2'
alias r3='r -3'
alias fcl='fc -l'
alias sdix='ssh -N -L 12343:localhost:80 gitolite@dixie.elsys.private &'
alias eject='diskutil unmount'
alias colget='python ~/colget.py'
# ^^^^^^ end Micah's aliases ^^^^



# vvvvv Micah's git aliases vvvvvvvvvv
alias ga='git add'
alias gd='git diff'
alias gdt='git difftool'
alias gl='git log --graph'
alias gs='git status'
alias gb='git branch -av'
alias gh='git help'
alias gf='git fetch'
alias gfb='gf;gb'
alias gc='git checkout'
alias gcb='git checkout -b'
alias gcm='git commit -m'
alias grs='git remote -v show'
# ^^^^^ end Micah's git aliases ^^^^^^




# # vvvvvvvvvvvvvvvvvv borrowed from Michael Noll's Ubuntu tutorial -msc 20jul11 vvvvvvvvvvvv
# # Set Hadoop-related environment variables
# export HADOOP_HOME=/usr/local/hadoop
# 
# # Set JAVA_HOME
# export JAVA_HOME=/usr/lib/jvm/java-6-openjdk
# 
# # some convenient aliases and functions for running Hadoop-related commands
# unalias fs &> /dev/null
# alias fs="hadoop fs"
# unalias hls &> /dev/null
# alias hls="fs -ls"
# 
# # Add Hadoop bin/ directory to PATH
# export PATH=$PATH:$HADOOP_HOME/bin
# 
# # ^^^^^^^^^^^^^^^^^^ end Michael Noll additions -msc 20jul11 ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

# vvvvvvvvvvvvvvvvvv Java vvvvvvvvvvvvvvv
alias j='java'
alias jc='javac'

# ^^^^^^^^^^^^^^^^^^ end Java ^^^^^^^^^^^



