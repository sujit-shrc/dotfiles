# Configuration files for i3 window manager

### Install required packages

```bash
  sudo pacman -S i3 i3blocks i3lock i3status rofi picom feh brightnessctl
```

where:

- `i3` is the window manager itself
- `i3blocks` is a status bar
- `i3lock` is a screen locker
- `i3status` is a status bar generator.
- `rofi` is a window switcher, application launcher, and dmenu replacement
- `picom` is a compositor. Used for transparency and etc.
- `feh` is an image viewer. Used to set the wallpaper.
- `brightnessctl` is a brightness controller.

### Configuration files

```bash
  git clone https://github.com/sujit-shrc/dotfiles.git
  cp -r dotfiles/i3 ~/.config/
  cp -r dotfiles/picom ~/.config/
  cp -r dotfiles/rofi ~/.config/
  cp -rf dotfiles/i3status ~/.config/
```

> [!NOTE]
> The above commands will clone the repository and copy the configuration files to the respective directories.

Restart the i3 window manager to see the changes.
by pressing `Mod+Shift+R`
