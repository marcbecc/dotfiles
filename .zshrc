# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt extendedglob
bindkey -e
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/Users/marcbecchetti/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

# load prezto configuration
source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"

# enable fzf keybindings
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# added by Anaconda3 5.1.0 installer
# export PATH="/anaconda3/bin:$PATH"  # commented out by conda initialize

# added by Anaconda3 5.2.0 installer
# export PATH="/Users/marcbecchetti/anaconda3/bin:$PATH"  # commented out by conda initialize

# enable iterm2 shell integration
source ~/.iterm2_shell_integration.zsh

# use mvim instead of default vim
alias vim='nvim -p'
alias vimdiff='nvim -d'
alias yd='youtube-dl'
alias configvim='nvim ~/.vimrc'
alias configranger='nvim ~/.config/ranger/rc.conf'
alias configrifle='nvim ~/.config/ranger/rifle.conf'
alias configzsh='nvim ~/.zshrc'
alias ra=ranger
alias config="/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME"

export EDITOR=nvim
export VISUAL=nvim

# # for compiling C++ on MacOS with clang (ended up using xcode-select /path/to/SDK/pkg or something like that)
# export CPATH="/Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX10.14.sdk/usr/include"
# export LDFLAGS="-L/usr/local/opt/llvm/lib -Wl,-rpath,/usr/local/opt/llvm/lib"
# export CPPFLAGS="-I/usr/local/opt/llvm/include"

# # function to cd to symlink folders (can just use cd -P instead)
# function cdl { local dir=$(readlink $1); [[ -n "$dir" ]] && cd $dir; }
# # or using gnu readlink (the original version)
# function cdl { local dir=$(greadlink -e $1); [[ -n "$dir" ]] && cd $dir; }

# for cd-on-quit for nnn -- using 'n' to call nnn and quitting with Ctrl + g
  # ensure that the file $HOME/.config/nnn/.lastd exists 
n()
{
  export NNN_TMPFILE=${XDG_CONFIG_HOME:-$HOME/.config}/nnn/.lastd

  nnn "$@"

  if [ -f $NNN_TMPFILE ]; then
    . $NNN_TMPFILE
    rm -f $NNN_TMPFILE
  fi
}

# for nnn to use lesspipe.sh, installed via homebrew
export PAGER=less
[ -r "/usr/local/bin/lesspipe.sh" ] && export LESSOPEN="| /usr/local/bin/lesspipe.sh %s"
export LESS='-Ri '

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/Users/marcbecchetti/anaconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/Users/marcbecchetti/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/Users/marcbecchetti/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="/Users/marcbecchetti/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<


############# Shell NOTES 
#
# use `man zshbuiltins` to see zsh built-in functions
# `r` is the same as `fc -e` -- it repeats the last command

