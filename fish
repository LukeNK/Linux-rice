if status is-interactive
    # Commands to run in interactive sessions can go here
    set -gx GTK_IM_MODULE 'fcitx'
    set -gx QT_IM_MODULE 'fcitx'
    set -gx XMODIFIERS '@im=fcitx'
end
