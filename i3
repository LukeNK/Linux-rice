set $mod Mod4

# Start up apps
exec --no-startup-id "xinput set-button-map $(xinput list --id-only '__INPUT_NAME__') __INPUT_BTN__"
exec --no-startup-id "feh --bg-fill --no-fehbg __BG__"
exec --no-startup-id "fcitx5"
exec --no-startup-id "dex --autostart --environment i3"
exec --no-startup-id "xss-lock --transfer-sleep-lock -- i3lock -i __LOCK__ --nofork"

# App launcher
bindsym $mod+d exec --no-startup-id "rofi -modi drun,run -show drun"
bindsym $mod+Shift+d exec --no-startup-id "chromium"
bindsym $mod+Return exec --no-startup-id "alacritty"
bindsym $mod+Shift+Return exec --no-startup-id "alacritty -e ranger"
bindsym Print exec --no-startup-id "flameshot gui -c"
bindsym $mod+n open
bindsym $mod+Shift+n exec --no-startup-id "alacritty -e tty-clock -s -B -c -C 6"

# State control
mode "[s]leep, [l]ogout, [p]oweroff, [esc]ape" {
    bindsym s exec "systemctl hybrid-sleep"; mode default
    bindsym l exec "i3-msg exit"
    bindsym p exec "systemctl poweroff -i"
    bindsym Escape mode default
}
bindsym $mod+shift+e mode "[s]leep, [l]ogout, [p]oweroff, [esc]ape"
bindsym $mod+l exec --no-startup-id "i3lock -i __LOCK__ --nofork"; mode default

# Visual
hide_edge_borders both
gaps inner 10px
smart_gaps on

# class                 border  bground text    indicator child_border
client.focused          #6272A4 #6272A4 #F8F8F2 #6272A4   #6272A4
client.focused_inactive #44475A #44475A #F8F8F2 #44475A   #44475A
client.unfocused        #282A36 #282A36 #BFBFBF #282A36   #282A36
client.urgent           #44475A #FF5555 #F8F8F2 #FF5555   #FF5555
client.placeholder      #282A36 #282A36 #F8F8F2 #282A36   #282A36

client.background       #F8F8F2

bar {
    colors {
        background #282A36
        statusline #F8F8F2
        separator  #44475A

        focused_workspace  #44475A #44475A #F8F8F2
        active_workspace   #282A36 #44475A #F8F8F2
        inactive_workspace #282A36 #282A36 #BFBFBF
        urgent_workspace   #FF5555 #FF5555 #F8F8F2
        binding_mode       #FF5555 #FF5555 #F8F8F2
    }
    status_command i3status
    mode hide

    font pango:monospace 10
}

# Font for window titles
font pango:monospace 8

# Use pactl to adjust volume in PulseAudio.
set $refresh_i3status killall -SIGUSR1 i3status
bindsym XF86AudioRaiseVolume exec --no-startup-id pactl set-sink-volume @DEFAULT_SINK@ +10% && $refresh_i3status
bindsym XF86AudioLowerVolume exec --no-startup-id pactl set-sink-volume @DEFAULT_SINK@ -10% && $refresh_i3status
bindsym XF86AudioMute exec --no-startup-id pactl set-sink-mute @DEFAULT_SINK@ toggle && $refresh_i3status
bindsym XF86AudioMicMute exec --no-startup-id pactl set-source-mute @DEFAULT_SOURCE@ toggle && $refresh_i3status

# Screen brightness control
bindsym XF86MonBrightnessUp exec --no-startup-id brightnessctl set +5%
bindsym XF86MonBrightnessDown exec --no-startup-id brightnessctl set 5%-

# Use Mouse+$mod to drag floating windows to their wanted position
floating_modifier $mod

# move tiling windows via drag & drop by left-clicking into the title bar,
# or left-clicking anywhere into the window while holding the floating modifier.
tiling_drag modifier titlebar

# kill focused window
bindsym $mod+Shift+q kill

# change focus
bindsym $mod+Left focus left
bindsym $mod+Down focus down
bindsym $mod+Up focus up
bindsym $mod+Right focus right

# move focused window
bindsym $mod+Shift+Left move left
bindsym $mod+Shift+Down move down
bindsym $mod+Shift+Up move up
bindsym $mod+Shift+Right move right

# split in horizontal orientation
bindsym $mod+h split h

# split in vertical orientation
bindsym $mod+v split v

# enter fullscreen mode for the focused container
bindsym $mod+f fullscreen toggle

# change container layout (stacked, tabbed, toggle split)
bindsym $mod+s layout stacking
bindsym $mod+w layout tabbed
bindsym $mod+e layout toggle split

# toggle tiling / floating
bindsym $mod+Shift+space floating toggle; [tiling] border pixel 2; [floating] border normal
default_border pixel 2
default_floating_border normal

# change focus between tiling / floating windows
bindsym $mod+space focus mode_toggle

# focus the parent container
bindsym $mod+a focus parent

# focus the child container
#bindsym $mod+d focus child

# Define names for default workspaces for which we configure key bindings later on.
# We use variables to avoid repeating the names in multiple places.
set $ws1 "1"
set $ws2 "2"
set $ws3 "3"
set $ws4 "4"
set $ws5 "5"
set $ws6 "6"
set $ws7 "7"
set $ws8 "8"
set $ws9 "9"
set $ws10 "10"

# switch to workspace
bindsym $mod+1 workspace number $ws1
bindsym $mod+2 workspace number $ws2
bindsym $mod+3 workspace number $ws3
bindsym $mod+4 workspace number $ws4
bindsym $mod+5 workspace number $ws5
bindsym $mod+6 workspace number $ws6
bindsym $mod+7 workspace number $ws7
bindsym $mod+8 workspace number $ws8
bindsym $mod+9 workspace number $ws9
bindsym $mod+0 workspace number $ws10

# move focused container to workspace
bindsym $mod+Shift+1 move container to workspace number $ws1
bindsym $mod+Shift+2 move container to workspace number $ws2
bindsym $mod+Shift+3 move container to workspace number $ws3
bindsym $mod+Shift+4 move container to workspace number $ws4
bindsym $mod+Shift+5 move container to workspace number $ws5
bindsym $mod+Shift+6 move container to workspace number $ws6
bindsym $mod+Shift+7 move container to workspace number $ws7
bindsym $mod+Shift+8 move container to workspace number $ws8
bindsym $mod+Shift+9 move container to workspace number $ws9
bindsym $mod+Shift+0 move container to workspace number $ws10

# reload the configuration file
bindsym $mod+Shift+c reload
# restart i3 inplace (preserves your layout/session, can be used to upgrade i3)
bindsym $mod+Shift+r restart

# resize window (you can also use the mouse for that)
bindsym $mod+r mode "resize"
mode "resize" {
    bindsym j resize shrink width 10 px or 10 ppt
    bindsym k resize grow height 10 px or 10 ppt
    bindsym l resize shrink height 10 px or 10 ppt
    bindsym semicolon resize grow width 10 px or 10 ppt

    bindsym Left resize shrink width 10 px or 10 ppt
    bindsym Down resize grow height 10 px or 10 ppt
    bindsym Up resize shrink height 10 px or 10 ppt
    bindsym Right resize grow width 10 px or 10 ppt

    # back to normal: Enter or Escape or $mod+r
    bindsym Return mode "default"
    bindsym Escape mode "default"
    bindsym $mod+r mode "default"
}