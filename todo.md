#### To Do list

- [ ] Unify keyboard shortcuts between OS's as much as possible (and for i3wm)

- [ ] write cheatsheet with main shortcuts listed (e.g. for terminal, launcher, desktop switching, windows management, etc..)

- [ ] Make (or find) a gruvbox-dark theme for Typora

- [ ] vim shortcuts for Typora (or another markdown editor? maybe just use VSCode..) 

- [x] find way to remove black line at bottom of terminals in i3

  - [x] remove black line as above but for kitty terminal (fixed all for i3)

- [x] Fix Firefox issue going black after suspending -- I guess it's a problem with firefox hardware acceleration and Nvidia drivers

- [x] Add ability to jump back/forward words in URXvt (or maybe in Zsh?) WITH CONTROL+ARROW 

  - [x] works with alt+arrows but not control ...

    :negative_squared_cross_mark:	~~The configuration I found doesn't work for either .Xresources or in Zsh. Kitty works fine though~~ 
    
    I don't remember how I fixed this.. 

- [x] Vim issue with highlighting -- shitty background color

  :white_check_mark:	broken again.. fixed again

- [x] disable Vim auto wrapping w/ newline

- [x] change Vim cursor in insert mode

- [ ] add numbers to tabline in Vim (see `:h tabline`)

- [ ] do something about .zshrc.local

- [ ] migrate away from prezto

- [x] Fix issue when changing desktop in i3 that only works on upstroke (w/ Firefox only?)

- [ ] i3 -- make focused terminal border color more obvious

- [ ] i3ipc python package

- [x] Ranger - make neovim or vim the default editor

- [x] Ranger - open images inline?

- [x] install/setup polybar

  :ballot_box_with_check:	~~Throwing unknown character warnings when ran from command line~~ 

  ​	:arrow_right: Had to install Font Awesome icons

- [x] install/setup rofi

- [ ] vim/neovim is highlighting underscores? (for markdown files at least)

- [ ] Annoying cursor display behavior in vim/neovim -- ~~possibly related to blinking cursor~~

- [ ] Switch to Qtile

  - [ ] Use similar hotkeys as i3 for basic navigation
  - [ ] How to Suspend/Lock/Reboot/Shutdown?
  - [ ] Scratchpad / global hotkey terminal

- [x] Switch to Kitty

  - [ ] Add key binding to make Control+backspace delete back one word -- maybe can do this for zsh in general? 
  - [x] Make it the default terminal (get it working well first)
  - [x] Tabs? (not that important for i3)
  
- [x] Get copy/paste working well in Vim and terminals 

  - [x] urxvt -- extra characters when copying text via ctrl+c in Firefox and pasting via ctrl+v+c in urxvt
  - [x] vim -- get working with system clipboard

- [x] Switch to Neovim 

  :ballot_box_with_check:	~~Colors are broken when using `nvim` with URXvt?~~

- [ ] Have menus use Ctrl+j/k for up and down in neovim, vim, and VSCode

  - [ ] neovim/vim
  - [ ] VSCode
  - [ ] Pycharm
  - [ ] qt creator
  - [ ] qutebrowser
  - [ ] typora

- [x] Best auto complete for neovim and vim? mucomplete? --> coc.nvim

- [ ] fix annoying lag in Firefox when scrolling (initially.. then temporarily goes away?)

  - [ ] record screencast of it w/ input displayed (using ctrl+alt+shift+r and xev, showkey, or screenkey)
  
- [ ] Get various bin folders in order (~/.local/bin , /usr/local/bin, /bin, ~/bin, etc...) -- check XDG / freedesktop.org standards

- [ ] Set up remote server on desktop to run ML software and Jupyter stuff from Macbook

- [ ] Zathura isn't loading zathurarc file??? -- just made alias to load it explicitly

- [ ] Change color of links in Zathura to make them more visible

  doesn't seem possible currently?

- [x] Manage Dotfiles on github ** 

  - [ ] and/or iCloud (can keep backup there I guess)

- [x] Add space in rofi (eg after "combi" and "window" and "run")

- [ ] How to get man page if there are 2 entries with the same name? -- `man history` gives the man entry for the "GNU history library" but not the history command, which should also have a man entry

- [ ] add custom local html newtab hack to Firefox

- [x] Get temperature working on polybar

- [x] Get shutdown menu working on polybar

- [ ] Use gruvbox colors in qutebrowser

- [ ] How to search tabs in qutebrowser (like omnibar with vimium extension)?

- [x] How to save session in qutebrowser? -- use `:w <session name>` to save, and `:session-load <session name>` to load

- [ ] Fix wlan module in polybar

- [ ] add custom commands to rofi

- [ ] hacking rofi in general..

- [ ] how to make .desktop files (to use with drun in rofi)?

- [x] change current tab color in i3

- [ ] Add GPU usage script in polybar

- [ ] map forward/backward mouse buttons in zathura?

- [ ] How to open url links in pdfs in zathura?

- [ ] 



#### Directory layout for media files to sync/backup on all platforms

-   :file_folder: MyDocuments
  - :file_folder: TextBooks
  - :file_folder: Manuals
  - :file_folder: cheatsheets
  - :file_folder: ebooks
  - :file_folder: Mendeley Library
- :file_folder: MySamples
  - :file_folder: Piezo
  - :file_folder: Percussion
    - :file_folder: Drum Machines
    - :file_folder: Drum Kits
    - :file_folder: Misc​
  - :file_folder: ​breaks
  - :file_folder: Synths
  - :file_folder: Real Instruments​
  - :file_folder: ​SoundFX
- :file_folder: MyPictures
  - :file_folder: Wallpapers
  - :file_folder: Random
  - :file_folder: Personal