###### Log for MacOS
* install homebrew
* install iterm2
* install sxiv
* install lesspipe.sh
* install anaconda
* install qt creator
* install neovim 
* install macvim
* install onivim
* install visual studio code
* install pycharm
* install firefox w/ vimium, ublock origin, onetab, forest
* install texstudio
* install anki 
* install Piezo
* Renoise, Logic Pro, Sunvox, Rack, 
* install nnn, set export NNN_TMPFILE="/tmp/nnn" in .zshrc and create that folder if it doesn't exist
* install ranger
* install ripgrep, fzf, fd, atool
* install pyxdg
* install TexLive and latex
* install latex2html
* install reveal-md with npm (`npm install -g reveal-md`)
* install cheat, tldr (and see their githubs too)
* install GNU Stow
* install ansible
* 'brew install twpayne/taps/chezmoi'
* install yadm (brew)


also installed, maybe not needed
(python) gtk-mac-integration
cairo
pyxdg

#### mac app store apps
* evernote
* lastpass
* bettersnaptool
* bettertouchtool
* install 2Do

#### Managing dotfiles with github/git
https://www.atlassian.com/git/tutorials/dotfiles

create directory for dotfiles and set it up:

```
git init --bare $HOME/.cfg
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
config config --local status.showUntrackedFiles no
echo "alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'" >> $HOME/.zshrc
```

```
config status
config add .vimrc
config commit -m "Add vimrc"
config add .bashrc
config commit -m "Add zshrc"
config push
```

Create remote repo on github (or whatever), then track it:

```
$ git remote add origin <remote repo (on github)>
```

you can replicate your home directory on a new machine using the following command:

```
   git clone --separate-git-dir=~/.cfg /path/to/repo ~
```
For posterity, note that this will fail if your home directory isn't empty. To get around that, clone the repo's working directory into a temporary directory first and then delete that directory,
``` 
git clone --separate-git-dir=$HOME/.cfg /path/to/repo $HOME/cfg-tmp
cp ~/myconf-tmp/.gitmodules ~  # If you use Git submodules
rm -r ~/cfg-tmp/
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
```

