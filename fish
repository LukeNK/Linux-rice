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
        cd ~/.config/Linux-rice
        git fetch
        set local (git rev-parse HEAD)
        set remote (git rev-parse origin/main)
        if test "$local" != "$remote"
            echo "Updating Linux-rice, remember to logout"
            git pull
        end

        # Copy config files
        cp fish ~/.config/fish/config.fish
        cp i3 ~/.config/i3/config
        cp i3status ~/.config/i3status/config
        cp nano ~/.config/nano/nanorc
        cp ranger ~/.config/ranger/rc.conf
        cp htop ~/.config/htop/htoprc
        cp gtk3 ~/.config/gtk-3.0/settings.ini

        # dynamic customization
        sed -i 's|__BG__|'$__BG__'|g' ~/.config/i3/config
        sed -i 's|__LOCK__|'$__LOCK__'|g' ~/.config/i3/config
        sed -i 's|__INPUT_NAME__|'$__INPUT_NAME__'|g' ~/.config/i3/config
        sed -i 's|__INPUT_BTN__|'$__INPUT_BTN__'|g' ~/.config/i3/config
        sed -i 's|__WIRELESS__|'$__WIRELESS__'|g' ~/.config/i3status/config

        # return to home
        cd ~
        neofetch
    end
end
