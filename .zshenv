export XDG_CONFIG_HOME=~/.config
export XDG_DATA_HOME=~/.config
export LANG=en_US.UTF-8

export EDITOR=vim
export BROWSER=chromium

# add scripts to path
if [[ $UID -ge 1000 && -d $HOME/bin && -z $(echo $PATH | grep -o $HOME/bin) ]]
then
    export PATH="${HOME}/bin:${PATH}"
fi

# if there is a display and dmenu_args is not set, set it
if [ -n "$DISPLAY" ] && [ -z "$dmenu_args" ]; then
    export dmenu_args="-i -w $(($(xrandr -q | grep Screen | awk '{print $8}') - 20)) -x 10 -y $(($(($(xrandr -q | grep Screen | awk '{print $10}' | sed s/,//) / 2)) - 250)) -fn "-*-terminus-*-*-*-*-*-*-*-*-*-*-*-*" -nb #282828 -nf #ebdbb2 -sb #8C9440 -sf #000 -dim 0.75"
fi

