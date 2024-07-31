# .dotfiles

### about
What is this?

Repo contains config files for my smooth dev-experience for programming in the terminal.
A good shell, terminal emulator, multiplexer, and editor simplify tasks by improving cmd execution, managing multiple sessions, and offering ease-of-use customizations, forming a cohesive stack that is easy to work with as complexity grows.

Stack includes a shell environment is zsh themed by powerlevel10k, font is meslo nerd font & term emulator is alacritty & term editor is neovim with the base config being nvchad. This is all gibberish and you might need to go snoop around the old interwebz and learn about them. to understand my setup.

This repo allows me to use a command named `stow` to manage symlinks based on the pathstructures recreated under various dirnames containing my config files and recreate them precisely the same on the host system while allowing me to use version control to iteratively morph the setup with 1 repo.

#### Example
```
## i would like to have my neovim dotfile tracked by git+clone & apply the same dotfile config on my other kampootahs

## have a repo myrepo.git
## cd myrepo
##
## install neovim
## brew install neovim
##
## make a directory containing config files related to nvim inside dotfiles repo
## mkdir -p ~/myrepo/nvim/.config/nvim/lua      ## brother...euuuuhhh, hold ya horses you'll see
##
## setup your neovim config and whatever in there
## touch  ~/myrepo/nvim/.config/nvim/init.lua
## 
## Ensure on your host system the empy directories you want populated with config files exist
## if they dont, no file symlinks will be attached to the existing dir paths themselves !important
## mkdir -p ~/.config/nvim/lua
##
## Now commit changes to vcs & apply the config file symlinks
## cd myrepo
## ls -lar
##    ... .. .. .. nvim
## 
## Apply symlinks
## stow nvim
## 
## Why? i want the ability to only change the config file in my repo and nowhere else
## if my config file changes in my repo, i can commit that to git and have the changes automiatically applied on my host system
##
## if something goes wrong and heaven knows something eventually will go wrong
## i can immediately detach the symlinks using 
## 
## stow -D <name_of_config_dir> 
##
## this will eliminate all the symlinks on host system allowing me to use git to revert a couple commits back or patch fixes then reapply the changes
## stow <name_of_config_dir> 
##



```


```zsh
# navigate to home ~
cd 

# clone repo
git clone git@github.com:evanschaba/d0tfil3s.git ~/.dotfiles

# install packages
brew install neovim
brew install neofetch
brew install alacritty
brew install tmux
brew install font-meslo-lg-nerd-font 

# ... TODO ...


# finally create symlinks on host system from config files in repo
stow <dir_name> # e.g. stow tmux
# and to unlink
stow -D <dir_name> # e.g. stow -D tmux will destroy the symlinks 
# this will recreate symlinks of all files in repo based on their path structure inside the repo and recreate them similarly on your system

for example

```

```
cd
```


```
```



```
