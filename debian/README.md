# Debian rice

## Initialization
Install packages
```bash
apt install sudo xorg xinit xinput i3 rofi feh dunst pulseaudio pavucontrol fonts-recommended fonts-noto-cjk breeze-icon-theme fcitx5 fcitx5-unikey brightnessctl netselect-apt hwinfo htop git alacritty fish ranger chromium python3 python3-pip nodejs npm yt-dlp sqlite3 kate vlc inkscape audacity obs-studio flameshot
```

Move the config files
```bash
mv i3 ~/.config/i3/config
mv i3status ~/.config/i3/config
mv fish ~/.config/fish/config.fish
mv ranger ~/.config/ranger/rc.conf
mv nano ~/.config/nano/nanorc
```

## Customization

Background and lock screen 
```bash
convert lock.jpg -resize 1366x768^ lock.png # convert to png for use with i3lock
```
Check these two lines in `i3/config`:
```bash
convert lock.jpg -resize 1366x768^ lock.png # convert to png for use with i3lock

exec --no-startup-id "feh --bg-max ~/Pictures/bg.jpg" # check bg file location
i3lock -i ~/Pictures/lock.png # check lock bg file location
```

Mouse button. Edit this line in `i3/config`
```
xinput set-button-map $(xinput list --id-only 'SynPS/2 Synaptics TouchPad') 3 2 1 4 5 6 7 # set correct map
```

Check `i3status/config` for this line. Set it to appropriate device and change the part with the customization down bellow.
```bash
order += "wireless wlp6s0"
```

## App settings
Handle user
```bash
usermod -a -G sudo lukenk
```

Change shell
```bash
chsh -s /usr/bin/fish
fish_config
```

Chrome extentions
- uOrigin addblock
- languagetool

`Fcitx5-configtool`
- unikey setup (addon > x input method front end > check)
- turn of share input stage
- environment variable for GTK + Qt

`flameshot config` adjust available tools

Change OS language

Set up git authentication