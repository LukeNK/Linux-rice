if status is-interactive
    # Commands to run in interactive sessions can go here
    if test -z "$DISPLAY" -a "$XDG_VTNR" = 1
        # run on first tty
        set -gx GTK_IM_MODULE 'fcitx'
        set -gx QT_IM_MODULE 'fcitx'
        set -gx XMODIFIERS '@im=fcitx'

        # load config variables
        for line in (cat ~/.config/Linux-rice/.env | string trim)
            if string match -r '^[^#]*=' $line
                set key (echo $line | cut -d '=' -f 1)
                set value (echo $line | cut -d '=' -f 2-)
                set -g $key $value
            end
        end

        # set up config
        cd ~/.config/Linux-rice; git fetch; git pull;
        cp ~/.config/Linux-rice/fish ~/.config/fish/config.fish
        cp ~/.config/Linux-rice/i3 ~/.config/i3/config
        cp ~/.config/Linux-rice/i3status ~/.config/i3status/config
        cp ~/.config/Linux-rice/nano ~/.config/nano/nanorc
        cp ~/.config/Linux-rice/ranger ~/.config/ranger/rc.conf

        sed -i "s/__BG__/$__BG__/g" ~/.config/i3/config
        sed -i "s/__LOCK__/$__LOCK__/g" ~/.config/i3/config
        sed -i "s/__INPUT_NAME__/$__INPUT_NAME__/g" ~/.config/i3/config
        sed -i "s/__INPUT_BTN__/$__INPUT_BTN__/g" ~/.config/i3/config
        sed -i "s/__WIRELESS__/$__WIRELESS__/g" ~/.config/i3/config

    end
end
