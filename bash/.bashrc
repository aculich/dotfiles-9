# Please save this file
# View .inputrc .bashrc
TERM=linux

PATH=/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/X11/bin
export PATH

#editor
export EDITOR=emacs

#env
#export LANG="ja_JP.UTF-8"
export HISTTIMEFORMAT="%d/%m/%y %T "

#color
export CLICOLOR=1
export TERM=xterm-color
export LSCOLORS=Gxfxcxdxhxegedahagacgx
#export PATH=/opt/local/bin:$PATH
export PATH=/usr/local/bin:$PATH
export PATH=/usr/local/sbin:$PATH
export PATH=$HOME/bin:$PATH

export MANPATH=/opt/local/man:$MANPATH

export PATH=/opt/subversion/bin:$PATH

# HomeBrew
export NODE_PATH=/usr/local/lib/node


# Android
export PATH=$PATH:/Applications/android-sdk-mac_x86/tools
export PATH=$PATH:/Applications/android-sdk-mac_x86/platform-tools

# MySQL
export MYSQL_HOME=/usr/local/mysql
export PATH=$PATH:$MYSQL_HOME/bin
# hadoop
export PATH=/usr/local/hadoop/bin:$PATH

#grep $today /usr/share/calendar/calendar.music
#grep $today /usr/share/calendar/calendar.history
#grep $today /usr/share/calendar/calendar.computer
#grep $today /usr/share/calendar/calendar.birthday


#base
alias ls="ls -1G"
alias ll="ls -la"
alias vi="/usr/bin/vim"
alias grep="grep -i --color"
alias screen='screen -U -D -RR'

alias ql='qlmanage -p "$@" >& /dev/null'
alias imgsize="mdls -name kMDItemPixelWidth -name kMDItemPixelHeight"
alias delmacfile="find . -name \".DS_Store\" -exec rm -f {} \;"
alias rsync="rsync -avz --exclude=\".svn\" --exclude=\".DS_Store\""

#
#alias emacs="open -a Emacs"
alias firefox="open -a Firefox"
alias safari="open -a Safari"
alias prev="open -a Preview"
alias qlook="qlmanage -p"

alias fcd='source ~/bin/fcd.sh'
alias sc='screen -U -D -RR'
alias xattr_w='xattr -w com.apple.metadata:kMDItemFinderComment'

alias E='emacsclient -t'
alias start-emacs="emacs --daemon"
alias kill-emacs="emacsclient -e '(kill-emacs)'"


#if [ -z "$STY" ]; then
#    exec screen -U -D -RR
#fi
case "${TERM}" in
dumb | emacs)
    PROMPT="%n@%~%(!.#.$)"
    RPROMPT=""
    unsetopt zle
    ;;
esac

export PS1="$ "
# function pgrep() {
#     if [ $# != 0 ]; then
#         ps auxw | head -n 1
#         ps auxw | grep $* | grep -v grep | grep -v "ps auxw"
#     else
#         echo "Usage: psgrep PATTERN"
#     fi
# }

#eval $(perl -I$HOME/perl5/lib/perl5 -Mlocal::lib)
source $HOME/perl5/perlbrew/etc/bashrc

# tmux
#test -f ~/.tmuxrc && . ~/.tmuxrc

if [ -f /usr/local/etc/bash_completion ]; then
  . /usr/local/etc/bash_completion
fi
ENV=$HOME/.bashenv

# Hadoop
export PATH="${PATH}:/usr/local/hadoop/bin"

# EC2
export EC2_HOME="/Users/seiji/local/ec2-api-tools"
export EC2_PRIVATE_KEY="/Users/seiji/Dropbox/Document/AWS/pk-F5TNG7ECOHRJFVER6PFRNJN5G23N6CC2.pem"
export EC2_CERT="/Users/seiji/Dropbox/Document/AWS/cert-F5TNG7ECOHRJFVER6PFRNJN5G23N6CC2.pem"
export PATH="${PATH}:${EC2_HOME}/bin"

# Android
PATH=$PATH:/Applications/android-sdk-macosx/tools
PATH=$PATH:/Applications/android-sdk-macosx/platform-tools
export PATH=$HOME/.nodebrew/current/bin:$PATH
#export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"
source ~/.rbenv/completions/rbenv.bash

#rbenv
function gem() {
    $HOME/.rbenv/shims/gem $*
    if [ "$1" = "install" ] || [ "$1" = "i" ] || [ "$1" = "uninstall" ] || [ "$1" = "uni" ]
    then
        rbenv rehash
    fi
}
# Bash completion support for Rake, Ruby Make.

export COMP_WORDBREAKS=${COMP_WORDBREAKS/\:/}

_rakecomplete() {
    if [ -f Rakefile ]; then
        recent=`ls -t .rake_tasks~ Rakefile **/*.rake 2> /dev/null | head -n 1`
        if [[ $recent != '.rake_tasks~' ]]; then
            rake --silent --tasks | cut -d " " -f 2 > .rake_tasks~
        fi
        COMPREPLY=($(compgen -W "`cat .rake_tasks~`" -- ${COMP_WORDS[COMP_CWORD]}))
        return 0
    fi
}

complete -o default -o nospace -F _rakecomplete rake

# RubyMotion
export RUBYLIB="$HOME/Library/Ruby/lib:$RUBYLIB"

#nvm
. ~/.nvm/nvm.sh
