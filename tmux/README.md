# Tmux Configuration

1. Install tmux:

```bash
  sudo pacman -S tmux
```

> [!NOTE]
> You need to install `fzf` if you want to work with tmux sessions.

```bash
  sudo pacman -S fzf
```

2. Install TPM (Tmux Plugin Manager):

```bash
  git clone https://github.com/tmux-plugins/tpm ~/.config/tmux/plugins/tpm
```

3. copy the `tmux.conf` file from this repository to `~/.config/tmux/tmux.conf`

```bash
  git clone https://github.com/sujit-shrc/dotfiles.git
  cp -r dotfiles/tmux ~/.config/
```

4. Or if you want to do manually:

```bash
  mkdir -p ~/.config/tmux/tmux.conf
  # then copy all the code from tmux.conf in this repo and paste it into ~/.config/tmux/tmux.conf file
```

5. Configure `tmux` in your shell which is you are using:
   Add to `~/.bashrc` or `~/.zshrc`:

```bash
  alias tmux='tmux -f ~/.config/tmux/tmux.conf'
```

6. Reload shell config:

```bash
  source ~/.bashrc  # or ~/.zshrc
```

7. Start tmux:

```bash
  tmux
```

8. Install plugins:
   Press `prefix` + `I` (usually Ctrl-b then Shift-i)

> [!TIP]
> To customize further, add settings to tmux.conf and plugins with `set -g @plugin` lines.

## Additional key bindings and configs with i3 wm

> [!IMPORTANT]
> If you want to auto start tmux then configure it with i3wm like this

1. Auto start tmux with i3:

```bash
  nano ~/.config/i3/config
  [[ $TERM == "screen" ]] && exec tmux
```

2. Sync System Clipboard with tmux clipboard:

```bash
  sudo pacman -S xclip
```

Then add to your tmux.conf:

```bash
  set -g set-clipboard on
  bind -T copy-mode-vi Enter send-keys -X copy-pipe-and-cancel "xclip -in -selection clipboard"
  bind -T copy-mode-vi MouseDragEnd1Pane send-keys -X copy-pipe-and-cancel "xclip -in -selection clipboard"
```
