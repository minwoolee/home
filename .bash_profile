#=== start of automatically maintained lines (do not delete)===
# .bashrc, sourced by interactive non-login shells (also called by .bash_profile)
export PATH=/usr/local/bin:/sbin:/usr/sbin:/bin:/usr/bin:/home/y/bin:/home/y/bin64:/usr/X11R6/bin:~/bin
umask 022
if [ "$PS1" != "" ]
then
    PS1="\h \t \w \$ "
    setenv ()  { export $1="$2"; }
    unsetenv ()  { unset $*; }
fi

#===   end of automatically maintained lines (do not delete)===
# per-user custom comands go here...

export time=(10 "S: %S U: %U E: %E")
export PATH=/home/y/bin:${PATH}:~/scripts
export CVS_RSH=yssh
export SVN_ASKPASS=1
export SVN_SSH='/usr/local/bin/yssh -q'
export SVNROOT=svn+ssh://svn.corp.yahoo.com/
export LESS="eFRX"
export LEGO_SRC_ROOT=/homes/mwlee/lego
#export DISPLAY=`who -m|awk '{print $6}'|tr -d \(|tr -d \)`:0.0
#export GEM_PATH=/Library/Ruby/Gems/2.0.0

#alias ssh="yssh" 
#alias scp="yscp"
#alias yerr="tail -f /home/y/logs/yapache/error"
#alias ylog="tail -f /home/y/logs/yapache/access | /home/y/bin/readlog"
alias mv="mv -i"
alias l='less'
alias ls='ls -F'
alias ll='ls -lt'
alias emacs='/home/y/bin/emacs'
alias vi='vim'
alias mbdiff='diff -d --side-by-side --ignore-all-space --suppress-common-lines -W 158'
alias ctags="`brew --prefix`/bin/ctags"

complete -W "$(echo `cat ~/.ssh/known_hosts | cut -f 1 -d ' ' | sed -e s/,.*//g | uniq | grep -v "\["`;)" ssh

# alias startall='yinst start udbclient\*; sudo ads-start; sudo webctl start'
# alias stopall='sudo webctl stop; sudo ads-stop; yinst stop udbclient\*'
# alias startp='yinst start udbclient\*; sudo ads-start;'
# alias stopp='sudo ads-stop; yinst stop udbclient\*'

set -o noclobber

settitle() {
    printf "\033k$1\033\\"
}

ssh() {
    settitle "${*%.yahoo.com}"
    command ssh "$@"
    settitle "bash"
}
#eval "$(chef shell-init bash)"

# if [ -f "$(brew --prefix)/opt/bash-git-prompt/share/gitprompt.sh" ]; then
#     source "$(brew --prefix)/opt/bash-git-prompt/share/gitprompt.sh"
# fi

# test -e ${HOME}/.iterm2_shell_integration.bash && source ${HOME}/.iterm2_shell_integration.bash

#[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
#source /usr/local/opt/chruby/share/chruby/chruby.sh
#source /usr/local/opt/chruby/share/chruby/auto.sh

# When the shell exits, append to the history file instead of overwriting it
shopt -s histappend

# After each command, append to the history file and reread it
export PROMPT_COMMAND="${PROMPT_COMMAND:+$PROMPT_COMMAND$'\n'}history -a; history -c; history -r"

# Adding time stamps to command history
export HISTTIMEFORMAT="%d/%m/%y %T "

# disable flow control to enable ctrl-s in cmd-t in vim
stty -ixon -ixoff

# git completion
# source ~/git-completion.bash
