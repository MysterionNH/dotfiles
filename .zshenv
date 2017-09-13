export XDG_CONFIG_HOME=~/.config
export XDG_DATA_HOME=~/.config
export LANG=en_US.UTF-8

export EDITOR=nano
export BROWSER=chromium

# add scripts to path
if [[ $UID -ge 1000 && -d $HOME/.bin && -z $(echo $PATH | grep -o $HOME/.bin) ]]
then
    export PATH="${PATH}:$HOME/.bin"
fi
