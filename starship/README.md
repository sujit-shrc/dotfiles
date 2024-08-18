# Starship prompt configuration

1. Install [starship](https://starship.rs/)

```bash
  sudo pacman -S starship
```

2. Add the following to your shell configuration file

```bash
  eval "$(starship init bash)"
```

> [!WARNING]
> If you are using different shell then read the docs for that shell.
> [read docs](https://starship.rs/guide/)

3. Restart your shell & done.

```bash
  ~/.bashrc
```

## Customizing starship

1. if you haven't clone the repo yet, clone it.

```bash
  git clone https://github.com/sujit-shrc/dotfiles.git
```

else simply copy the starship config's.

```bash
  cp dotfiles/starship/ ~/.config/
```

2. Update the shell configs to use the new starship config.

```bash
  sudo nano ~/.bashrc
  # add the following line
  export STARSHIP_CONFIG=~/.config/starship/starship.toml
```

3. Restart your shell & done.

```bash
  ~/.bashrc
```
