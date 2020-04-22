# dotfiles

## Install zsh about
### Install Iterm2 
[Download Url](https://www.iterm2.com/downloads.html)
: https://www.iterm2.com/downloads.html

### Install on-my-zsh 
```
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
```

### Install zplug
```
curl -sL --proto-redir -all,https https://raw.githubusercontent.com/zplug/installer/master/installer.zsh | zsh
```

## Install vim about

### Install vim 
```shell
brew install vim
```

### Install neovim 
```shell
brew install neovim
```

### Install vim-plgin
```shell
# vim
curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
		
# neovim 
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```

### Clone config to local 
```
git clone https://github.com/jivi20029/dotfiles.git
```

### Excute config
```
cd dotfiles
sh store_zsh.sh
source ~/.zshrc 

sh store_vim.sh
vim ~/.vimrc 
:PlugInstall

ln -s ~/.vimrc ~/.config/nvim/init.vim
```
