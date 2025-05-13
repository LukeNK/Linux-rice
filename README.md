# Linux rice

## Instalation
**Arch Linux:** use `archinstall` script. Remember:
- Select profile: `desktop > i3`
- Change the greeter and the graphic drivers to your liking

## Initialization
Install packages
```bash
apt install sudo xorg xinit xinput i3 rofi feh dunst pulseaudio pavucontrol fonts-recommended fonts-noto-cjk breeze-icon-theme fcitx5 fcitx5-unikey fcitx5-configtool brightnessctl netselect-apt hwinfo htop git alacritty fish ranger chromium python3 python3-pip nodejs npm 7zip yt-dlp sqlite3 kate vlc inkscape audacity obs-studio flameshot

pacman -Syu xorg-xinput rofi feh dunst pavucontrol noto-fonts breeze-icons fcitx5 fcitx5-unikey brightnessctl hwinfo man-db htop git alacritty fish ranger chromium python python-pip nodejs npm 7zip yt-dlp sqlite3 kate vlc inkscape audacity obs-studio flameshot
```

This set up will use symlink so you can make the config constantly up-to-date. **Caution: this means I may push some config that isn't available in another system**
```bash
cd ~; mkdir .config; cd .config
git clone https://github.com/LukeNK/Linux-rice
cd Linux-rice
```

Create config directories
```bash
mkdir ~/.config/fish
mkdir ~/.config/i3
mkdir ~/.config/i3status
mkdir ~/.config/nano
mkdir ~/.config/ranger
```

Copy customization file (will be ignored by git)
```bash
cp template.env .env
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

openTabletDriver [set up dot net](https://learn.microsoft.com/en-us/dotnet/core/install/linux-debian?tabs=dotnet8)
```bash
wget https://packages.microsoft.com/config/debian/12/packages-microsoft-prod.deb -O packages-microsoft-prod.deb
sudo dpkg -i packages-microsoft-prod.deb
rm packages-microsoft-prod.deb
sudo apt-get install -y aspnetcore-runtime-8.0
```

## Customization
*Please make sure there is no space before and after the equal sign.*

Background (`__BG__`) and lock screen (`__LOCK__`). Use the following script to convert:
```bash
convert lock.jpg -resize 1366x768^ lock.png # convert to png for use with i3lock
```

Mouse device with (`__INPUT_NAME__`) and the arrangement of the buttons (`__INPUT_BTN__` usually is `1 2 3`)

Wireless device (`__WIRELESS__`) usually is `wlan0`, but I have seen worse.