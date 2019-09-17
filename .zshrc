#
# configuration for zsh 
# Using using prezto currently
#
# Authors:
#   Marc Becchetti
#

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# customize to your needs...
source "${ZDOTDIR:-${HOME}}/.zshrc.local"
source "/home/marc/.vim/plugged/gruvbox/gruvbox_256palette.sh"

export PATH=$PATH:/home/marc/Qt/Tools/QtCreator/bin
export PATH=$PATH:/home/marc/.local/bin
# for CUDA, as per NVIDIA's installation guide for Ubuntu
export PATH=/usr/local/cuda-10.1/bin:/usr/local/cuda-10.1/NsightCompute-2019.1${PATH:+:${PATH}}
export LD_LIBRARY_PATH=/usr/local/cuda-10.1/lib64${LD_LIBRARY_PATH:+:${LD_LIBRARY_PATH}}

# open ranger file browser, cd to current directory on quit
alias ra='ranger --choosedir=$HOME/.rangerdir; LASTDIR=`cat $HOME/.rangerdir`; cd "$LASTDIR"'

alias vscode='code'
alias vsc='code'

alias configi3="nvim $HOME/.config/i3/config"
alias confignvim="nvim $HOME/.vimrc"
alias configvim="nvim $HOME/.vimrc"
alias configcompton="nvim $HOME/.config/compton.conf"
alias configx="nvim $HOME/.Xresources"
alias configurxvt="nvim $HOME/.Xresources"
alias configzsh="nvim $HOME/.zshrc"
alias configranger="nvim $HOME/.config/ranger/rc.conf"

# dotfile management in $HOME using git
alias config="git --git-dir=$HOME/.cfg/ --work-tree=$HOME"
alias configls="config ls-tree -r ubuntu --name-only"

# open the bc calculator with floating point as the default
alias bc='bc -l' 
alias vim='nvim'
alias vimdiff='nvim -d'

# open 2 instances of nnn in dual-pane mode with dvtm 
alias n2="dvtm -m '^h' nnn nnn"

# open Ubuntu settings, fixed for i3
alias settings="env XDG_CURRENT_DESKTOP=GNOME gnome-control-center"

alias note="vim $HOME/notes.md"
# custom 'git log' commands 
alias gitview='git log --graph --oneline --all'
alias gitview2='git log --graph --pretty=oneline --abbrev-commit'
alias gitview3='git log --graph --full-history --all --color --pretty=format:"%x1b[31m%h%x09%x1b[32m%d%x1b[0m%x20%s"'
alias gitview3='git log --graph --abbrev-commit --decorate --format=format:"%C(bold blue)%h%C(reset) - %C(bold green)(%ar)%C(reset) %C(white)%s%C(reset) %C(dim white)- %an%C(reset)%C(auto)%d%C(reset)" '

# Ensure Zathura is opening configuration file (fixes my issue of Zathura not loading config file on Ubuntu)
alias zathura="zathura -c /home/marc/.config/zathura"

# weather report, location is retrieved from /etc/timezone
alias weather='curl wttr.in'

# disable autocorrect 
unsetopt correct
unsetopt correctall
DISABLE_CORRECTION="true"

export EDITOR=nvim
export VISUAL=nvim
export RANGER_LOAD_DEFAULT_RC="false"
export NNN_NOTE="$HOME/notes.md"

# Ubuntu specific
# enable syntax highlighting with less using GNU source-highlight 
export LESSOPEN="| /usr/share/source-highlight/src-hilite-lesspipe.sh %s"
export LESS=' -R '

# nnn - enable enter directory on quit for zsh - make sure .config/nnn/ exists (see command)
n()
{
    export NNN_TMPFILE=${XDG_CONFIG_HOME:-$HOME/.config}/nnn/.lastd

    nnn "$@"

    if [ -f $NNN_TMPFILE ]; then
            . $NNN_TMPFILE
            rm -f $NNN_TMPFILE
    fi
}

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ -f ~/.p10k.zsh ]] && source ~/.p10k.zsh

