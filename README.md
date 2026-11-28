# Dotfiles
> *Features that I plan to add:*
> - installation script

These are my dotfiles, feel free to use them however you want.
> [!NOTE]
> These are very personalized, I highly recommend to read through everything and fork this repo to make your own changes

# Usage
To use the dotfiles in this repo, I symlink a directory/file to the correct path

Example:
```shell
# For nvim
ln -s ~/dotfiles/nvim ~/.config/nvim

# For zsh
ln -s ~/dotfiles/zsh/zshrc ~/.zshrc
```

You can also just copy it directly, I do it like this so its easier to update.

# Requirements
### zsh
- [ohmyzsh](https://github.com/ohmyzsh/ohmyzsh/)
- [oh-my-posh](https://github.com/jandedobbeleer/oh-my-posh)
### Neovim
- Version 0.12+
- **(Optional)**
    + [ripgrep](https://github.com/burntsushi/ripgrep)
