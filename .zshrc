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

# edit bspwm window gap
function gap() {
    bspc config -d focused window_gap $((`bspc config -d focused window_gap` $1))
}

# blockify cli control
function bb() {
    local signal
    case "$1" in
        '')  blockify-dbus get 2>/dev/null && return 0;;
        ex|exit)
            signal='TERM';;       # Exit
        b|block)
            signal='USR1';;       # Block
        u|unblock)
            signal='USR2';;       # Unblock
        p|previous)
            signal='RTMIN';;      # Previous song
        n|next)
            signal='RTMIN+1';;    # Next song
        t|toggle)
            signal='RTMIN+2';;    # Toggle play song
        tb|toggleblock)
            signal='RTMIN+3';;    # Toggle block song
        ip|iprevious)
            signal='RTMIN+10';;   # Previous interlude song
        in|inext)
            signal='RTMIN+11';;   # Next interlude song
        it|itoggle)
            signal='RTMIN+12';;   # Toggle play interlude song
        itr|itoggleresume)
            signal='RTMIN+13';;   # Toggle interlude resume
        *) echo "Usage: bb ( b[lock] | u[nblock] | p[revious] | n[ext] | t[oggle] | t[oggle]b[lock] |...)" && return 0;;
    esac
    pkill --signal "$signal" -f 'python.*blockify'
}


# ls
export COLUMNS  # Remember columns for subprocesses.
eval "$(dircolors)"
function ls {
	command ls -F -h --color=always -v --author --time-style=long-iso -C "$@" | less -R -X -F
}
alias ll='ls -l'
alias l='ls -l -A'

# basic utils
alias rm='rm -iv'
alias cp='cp -iv'
alias mv='mv -iv'
alias nano='nano -xc'
alias cal='khal interactive'

# copy/paste X
alias setclip="xclip -selection c"
alias getclip="xclip -selection c -o"

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
prompt walters2
source /home/niklas/.git_prompt/zshrc.sh

# nvm
#source /usr/share/nvm/init-nvm.sh
