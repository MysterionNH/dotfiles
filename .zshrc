# make
export MAKEFLAGS="$MAKEFLAGS -j$(($(nproc)))"

HISTFILE=~/.histfile
HISTSIZE=1000000
SAVEHIST=100000

setopt HIST_EXPIRE_DUPS_FIRST
#setopt APPEND_HISTORY
setopt HIST_FCNTL_LOCK
setopt HIST_IGNORE_DUPS
setopt HIST_REDUCE_BLANKS

unsetopt beep
bindkey -e

zstyle :compinstall filename '/home/niklas/.zshrc'

# keybindings - refer to "zshwiki.org/home/zle/bindkeys"
bindkey "^[[1~" beginning-of-line
bindkey "^[[7~" beginning-of-line
bindkey "^[[4~" end-of-line
bindkey "^[[8~" end-of-line
bindkey "^[[2~" overwrite-mode
bindkey "^[[3~" delete-char

# extract archives
function extract() {
    if [ -f $1 ] ; then
        case $1 in
            *.tar.bz2)   tar xvjf $1     ;;
            *.tar.gz)    tar xvzf $1     ;;
            *.bz2)       bunzip2 $1      ;;
            *.rar)       unrar x $1      ;;
            *.gz)        gunzip $1       ;;
            *.tar)       tar xvf $1      ;;
            *.tbz2)      tar xvjf $1     ;;
            *.tgz)       tar xvzf $1     ;;
            *.zip)       unzip $1        ;;
            *.jar)       unzip $1        ;;
            *.Z)         uncompress $1   ;;
            *.7z)        7z x $1         ;;
            *)           echo "'$1' cannot be extracted via >extract<" ;;
        esac
    else
        echo "'$1' is not a valid file!"
    fi
}

# create transparent shell
function transparent() {
    if [ "$1" != "" ]
    then
        nohup urxvt -depth 32 -bg rgba:2800/2800/2800/"$1"00 </dev/null &>/dev/null </dev/null &;
    else
        nohup urxvt -depth 32 -bg rgba:2800/2800/2800/b500 </dev/null &>/dev/null </dev/null &;
    fi
}

# ls
export COLUMNS  # Remember columns for subprocesses.
eval "$(dircolors)"
function ls {
	command ls -F -h --color=always -v --author --time-style=long-iso -C "$@" | less -R -X -F
}
alias ll='ls -l'
alias l='ls -l -a'

# basic utils
alias rm='rm -iv'
alias cp='cp -iv'
alias mv='mv -iv'
alias nano='nano -xc'
alias cal='khal interactive'

# git
alias gc='git commit -am'
alias gl='git log --graph --oneline --decorate --all'
alias gs='git status -sb'

# prevents accidentally clobbering files
alias mkdir='mkdir -p'

# pretty-print of some PATH variables
alias path='echo -e ${PATH//:/\\n}'
alias libpath='echo -e ${LD_LIBRARY_PATH//:/\\n}'

# web services
qrcode() {
    echo $@ | curl -F-=\<- qrenco.de
}

# prompt
autoload -Uz promptinit
promptinit
prompt walters
