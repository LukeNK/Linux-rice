if status is-interactive
    # Commands to run in interactive sessions can go here
    if test -z "$DISPLAY" -a "$XDG_VTNR" = 1
        # run on first tty
        set -gx GTK_IM_MODULE 'fcitx'
        set -gx QT_IM_MODULE 'fcitx'
        set -gx XMODIFIERS '@im=fcitx'

        # set up config
        cd ~/.config/Linux-rice; git fetch; git pull;
        cp ~/.config/Linux-rice/fish ~/.config/fish/config.fish
        cp ~/.config/Linux-rice/i3 ~/.config/i3/config
        cp ~/.config/Linux-rice/i3status ~/.config/i3status/config
        cp ~/.config/Linux-rice/nano ~/.config/nano/nanorc
        cp ~/.config/Linux-rice/ranger ~/.config/ranger/rc.conf
    end
end
