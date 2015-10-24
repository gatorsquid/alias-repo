# /etc/cshrc
#
# csh configuration for all shell invocations.

# By default, we want this to get set.
# Even for non-interactive, non-login shells.
# Current threshold for system reserved uid/gids is 200
# You could check uidgid reservation validity in
# /usr/share/doc/setup-*/uidgid file
if ($uid > 199 && "`id -gn`" == "`id -un`") then
    umask 002
else
    umask 022
endif

if ($?prompt) then
  if ($?tcsh) then
    set promptchars='$#'
    set prompt='[%n@%m %c]%# '
    # make completion work better by default
    set autolist
  else
    set prompt=\[$user@`hostname -s`\]\$\ 
  endif
endif

if ( $?tcsh ) then
	bindkey "^[[3~" delete-char
endif

bindkey "^R" i-search-back
set echo_style = both
set histdup = erase
set savehist = (1024 merge)

if ($?prompt) then
  if ($?TERM) then
    switch($TERM)
      case xterm*:
        if ($?tcsh) then
	  set prompt='%{\033]0;%n@%m:%c\007%}[%n@%m %c]%# '
        endif
        breaksw
      case screen:
        if ($?tcsh) then
          set prompt='%{\033_%n@%m:%c\033\\%}[%n@%m %c]%# '
        endif
        breaksw
      default:
        breaksw
    endsw
  endif
endif

setenv MAIL "/var/spool/mail/$USER"

# Check if we aren't a loginshell and do stuff if we aren't
if (! $?loginsh) then
    if ( -d /etc/profile.d ) then
        set nonomatch
        foreach i ( /etc/profile.d/*.csh )
            if ( -r "$i" ) then
                if ($?prompt) then
                    source "$i"
                else
                    source "$i" >&/dev/null
                endif
            endif
        end
        unset i nonomatch
    endif
endif

setenv LD_LIBRARY_PATH /usr/local/lib

# vvvvvv micah's aliases vvvvv
alias l 'ls -lahtrG'
alias ldir 'l | grep ^d'
alias ldnod 'ld | grep -Ev "\.\S*$"'
alias cp 'cp -p'
alias du 'du -h'
# alias d 'du -h --max-depth=1'
alias d 'du -h -d 1'
alias df 'df -h'
alias dg 'd | grep G'
alias dgm 'd | grep -e G -e M'
alias dqr 'diff -qr'
alias grep 'grep -n --color=auto'
alias igrep 'grep -i'
alias g 'grep'
alias p 'python'
alias pe 'perl'
alias pw 'perl -w'
alias gost 'cd ~/adams/stinger'
alias godb 'cd ~/Dropbox'
alias cut 'cut --delimiter " "'
alias vib 'vi ~/.cshrc'
alias sob 'source ~/.cshrc'
alias goback 'cd $OLDPWD'
alias vi 'vim'
alias h 'head'
alias h1 'head -1'
alias h2 'head -2'
alias h50 'head -50'
alias t 'tail'
alias t1 'tail -1'
alias t2 'tail -2'
alias t50 'tail -50'
alias sshrhip 'ssh -Y mcoleman@10.15.50.108'
setenv rhip 10.15.50.108
setenv rhip mcoleman@$rhip
alias sshrh 'ssh -Y $rhme'
alias sshtmt 'sudo ssh -Y -L 80:localhost:5000 mcoleman9@tmt-ewab.eosl.gtri.org'
alias hist 'history'
alias hi 'history'
alias go 'cd ~/\!:1'
# go() { cd ~/$1; }   # the bash version
alias sdix 'ssh -N -L 12343:localhost:80 gitolite@dixie.elsys.private &'
# ^^^^^^ end Micah's aliases ^^^^

# vvvvv git aliases vvvvvvvvvv
alias ga 'git add'
alias gd 'git diff'
alias gvi 'git difftool'
alias gl 'git log --graph'
alias gs 'git status'
alias gb 'git branch -av'
alias gh 'git help'
alias gf 'git fetch'
alias gfb 'gf;gb'
alias gc 'git checkout'
alias gcb 'git checkout -b'
alias gcm 'git commit -m'
alias grs 'git remote -v show'
alias gbl 'git blame'
alias gat 'git clone ssh://git@atlassian.elsys.gtri.org:7999/ewab/\!:1.git' 
# ^^^^^ end git aliases ^^^^^^


# vvvvv sup70 aliases vvvvvvvvvv
alias grepab 'grep ABSTRACT'
# ^^^^^ end sup70 aliases ^^^^^^
