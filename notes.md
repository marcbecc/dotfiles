#### Nvidia stuff

## To monitor GPU usage in realtime:
`$ nvidia-smi dmon`
specifically the 'sm' column

see help page for options: `nvidia-smi dmon -h`

If `nvidia-smi` throws a 'driver/library mismatch' error, try rebooting system
or re-install the drivers

or also:
`$ watch -n 5 nvidia-smi -a --display=utilization`

## driver installation

sudo add-apt-repository ppa:graphics-drivers
sudo apt-get purge nvidia*
sudo apt-get purge 'nvidia-*'
sudo ubuntu-drivers devices
sudo apt-get install nvidia-driver-430
sudo apt-get upgrade

## CUDA toolkit installation

using the .run file from NVIDIA. 
Output:

```
===========
= Summary =
===========

Driver:   Not Selected
Toolkit:  Installed in /usr/local/cuda-10.1/
Samples:  Installed in /home/marc/

Please make sure that
 -   PATH includes /usr/local/cuda-10.1/bin
 -   LD_LIBRARY_PATH includes /usr/local/cuda-10.1/lib64, or, add /usr/local/cuda-10.1/lib64 to /etc/ld.so.conf and run ldconfig as root

To uninstall the CUDA Toolkit, run cuda-uninstaller in /usr/local/cuda-10.1/bin

Please see CUDA_Installation_Guide_Linux.pdf in /usr/local/cuda-10.1/doc/pdf for detailed information on setting up CUDA.
***WARNING: Incomplete installation! This installation did not install the CUDA Driver. A driver of version at least 418.00 is required for CUDA 10.1 functionality to work.
To install the driver using this installer, run the following command, replacing <CudaInstaller> with the name of this run file:
    sudo <CudaInstaller>.run --silent --driver

Logfile is /var/log/cuda-installer.log
```

#### Conda, ML frameworks for python

Tensorflow allocates all of the GPU ram no matter what. Pytorch does not.

To run jupyter in background:
`jupyter notebook &> /dev/null &`
Then to exist jupyter completely, instead of ctrl-c, make an alias command:
`echo 'alias quitjupyter="kill $(pgrep jupyter)"' >> ~/.bashrc`
then, after restarting your terminal with this, just do
`quitjupyter`

#### Ubuntu stuff

To update a keysig if you get an error using apt-get:
`sudo apt-key adv --keyserver keys.gnupg.net --recv-keys KEYSIG`
where `KEYSIG` will be something like: `E3CA1A89941C42E6`

To open gnome/ubuntu settings, run this in command line:
`env XDG_CURRENT_DESKTOP=GNOME gnome-control-center`
(it will be blank if you just run gnome-control-center)

To enable exFat drives, do
`sudo apt-get install exfat-utils exfat-fuse`

Install custom binaries in `/usr/local/bin` for all users. 
Personal custom binaries should go into `~/bin`

--- borked conda installation fix
installed separate miniconda and ran it's conda 

./conda install -p /home/marc/anaconda3 python=/home/marc/anaconda3/bin/python

  CondaValueError: invalid package specification: python=/home/marc/anaconda3/bin/python3

used instead:
./conda install --prefix /home/marc/anaconda3/ /home/marc/anaconda3/pkgs/python-3.7.3-h0371630_0.tar.bz2

also did similar for setuptools. See here: https://github.com/conda/conda/issues/8172#issuecomment-459580119

Check default applications using: 
`xdg-mime query filetype photo.jpeg` to find MIME type of filetype (image/jpeg)
`xdg-mime query default image/jpeg` to find default application for a MIME type
`xdg-mime default feh.desktop image/jpeg` to change the default application for a MIME type
must use .desktop file here, to see those available look in `/usr/share/applications/*.desktop`

Fromm command line, to open current directory in Ubuntu file explorer (nautilus), use `nautilus .`
###### Log

* install zsh, make it the default shell 
* install prezto
* install firefox w/ uBlock origin, tab suspender, vimium, evernote, instapaper, send-to-kindle extensions
* install anaconda (see website)
* install paywall bypass extension from iamadamdev's github page
* deleted ~/keyring.deb
* install neovim, visual studio code, qt creator, pycharm
(To use neovim fully, install the neovim python package in your environments)
* install ranger, copy default config, set \$EDITOR variable to vim/nvim in zshrc
* set image preview in ranger with w3m
* installed sxiv
* installed awesomewm
* installed source-highlight and modified zshrc to make less have syntax highlighting
* installed qtile -- build from source in future
* installed nnn
* set up change directory on exit in nnn -- see the github page under misc/quitcd/zsh. make sure ~/.config/nnn/ exists (or whatever the appropriate location is)
* installed tizonia via snap -- it's a CLI for spotify and other services
* installed rofi
* added line in i3 configuration to replace dmenu with it.
* installed papirus icon themes 
* installed universal-ctags (a maintained version of exuberant ctags) from source, to use with vim-gutentags
* installed zathura pdf reader and the gruvbox zathurarc (curl it in ~/.config/zathura) 
* install tmux and dvtm (2 terminal multiplexers)
* install surf (to build from source, first `sudo apt install --no-install-recommends build-essential libgtk-3-dev libgcr-3-dev libwebkit2gtk-4.0-dev` then`sudo make install clean`)
* install lynx
* install Docker Engine - Community (follow the instructions on their website)
* install tree
* with conda make pelican1 environment, install pelican, markdown, ghp-import, etc... 
* sudo snap install icloud-notes-linux-client
* install tabnine plug-in in visual studio code and vim
* install wine (see instructions on their site)
* install latex and texstudio
* install unrar
* install transmission
* install gitk 
* install gpustat (for nvidia cards) - pip install gpustat (do for all conda environments)
* install tldr
* install pandoc, xelatex (package name texlive-xetex)
* install parallel
* install ffmpeg
* install maim
* install meson
* install yadm

#### URxvt

Terminal emulator to use instead of gnome-terminal (I guess it's better? I dunno)
Configuration file is ~/.Xresources (notes contained therein
The term name is set in there, and it must be in /usr/share/terminfo/....
Still working on getting a global hotkey working well w/ i3...

copy and paste default is ctrl+Alt+c/v 

enter float mode with alt+shift+space, then resize with mouse2+drag

#### kitty terminal 

https://github.com/dexpota/kitty-themes

to change theme:
`cd ~/.config/kitty`
`ln -s ./kitty-themes/themes/Floraverse.conf ~/.config/kitty/theme.conf`
and then in ~/.config/kitty/kitty.conf write the line `include ./theme.conf`

#### ranger

to create initial configuration file, ~/.config/ranger/rifle.conf, based on the defaults:
range --copy-config=rifle

in the `scope.sh` file, change the syntax highlight for text files so 
`pygmentize_format=terminal` instead of `pygmentize_format=terminal256`

#### rofi

enable in i3 as dmenu replacement:
`bindsym $mod+d exec --no-startup-id rofi -combi-modi window#drun#ssh -show combi`

A config file can be stored as ~/.config/rofi/config or it can use ~/.Xresources
To see current config use `rofi -dump-config` or `rofi -dump-xresources`
Theme can be set by running `rofi-theme-selector`

#### audio 

To send line-in audio to output (w/ pulse audio):
`pactl load-module module-loopback`
to set this as default:
`sudo sh -c ' echo "load-module module-loopback" >> /etc/pulse/default.pa '`

#### Unresolved issues that I've given up on for the meantime
* Zathura not loading zathurc, so I aliased it to point to the directory 


#### Scratch notes



