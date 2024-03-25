HISTFILE=~/.histfile
SAVEHIST=999
HISTSIZE=1000
setopt HIST_EXPIRE_DUPS_FIRST

# setopt autocd
bindkey -v
zstyle :compinstall filename "$HOME/.zshrc"
autoload -Uz compinit
compinit

# p10k setup
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-$USER.zsh" ]]; then
	source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-$USER.zsh"
fi

# go
export GOPATH="$HOME/go"
export PATH="$GOPATH/bin:$PATH"

# Editor settings
export VISUAL=nvim
export EDITOR="$VISUAL"
export MANPAGER='nvim +Man!'

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.dotfiles/home/.oh-my-zsh"

# bob exec/bob zsh completions
export PATH="$HOME/.local/share/bob/nvim-bin:$PATH"
fpath+=$HOME/.dotfiles/home/.zfunc/

# NVM stuff
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"                   # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion" # This loads nvm bash_completion
. "$HOME/.cargo/env"

# User configuration
export MANPATH="/usr/local/man:$MANPATH"
# export NVM_DIR='~/.nvm/'
export NODE_PATH="which node"
# kitty
export PATH="$PATH:$HOME/.local/bin"
# Julia
export PATH="$PATH:$HOME/Opt/julia-1.9.4/bin"
# nvim script
export PATH="$HOME/.bin/nvim.sh:$PATH"
# ytui_music dir
export YTUI_MUSIC_DIR="~/opt/music/"

ZSH_THEME="powerlevel10k/powerlevel10k"
POWERLEVEL10k_MODE="nerdfont-complete"

DISABLE_AUTO_TITLE="true"
ZLE_RPROMPT_INDENT=0
DISABLE_UNTRACKED_FILES_DIRTY="true"
# ZVM_VI_INSERT_ESCAPE_BINDKEY=jk

plugins=(
	# zsh-vi-mode
	git
	zsh-autosuggestions
	zsh-syntax-highlighting
)

source "$ZSH"/oh-my-zsh.sh
alias nvim="$HOME/.dotfiles/home/.bin/nvim.sh"
alias vim="$HOME/.dotfiles/home/.bin/nvim.sh"

go_to_nvim_config() {
	c "$HOME/.dotfiles/nvim/.config/nvim/"
}

go_to_home_config() {
	c "$HOME/.dotfiles/home"
}

go_to_kitty_config() {
	c "$HOME/.dotfiles/kitty/.config/kitty"
}

go_to_neodev_config() {
	c "$HOME/.dotfiles/nvim/.config/nvim/dev"
}

go_to_wt_config() {
	c "$HOME/../../mnt/c/Users/Roy/AppData/Local/Packages/Microsoft.WindowsTerminal_8wekyb3d8bbwe/LocalState/"
}

alias cb="cd .."
alias cl="clear"
alias dot='cd && cd .dotfiles'
alias fz="fzf --preview 'bat --color=always --style=header,grid --line-range :500 {}' --multi --bind 'enter:become(nvim {+})'"
alias fp="fzf -q .png --preview='kitten icat --clear --transfer-mode=memory --stdin=no --place=256x256@20x1 {} > /dev/tty'"
alias hacker="cmatrix -c"
alias hconf=go_to_home_config
alias kconf=go_to_kitty_config
alias l='ls -l'
alias la='ls -a'
alias lg='lazygit'
alias lla='ls -la'
alias lp='echo "${PATH//:/\n}"'
alias ls='lsd'
alias lt='ls --tree'
alias nconf=go_to_nvim_config
alias ndev=go_to_neodev_config
alias so="$HOME/.dotfiles/home/.bin/source.zsh"
alias sync="$HOME/.dotfiles/home/.bin/sync.sh"
alias wconf=go_to_wt_config

# source "$HOME/.bin/load-nvmrc.sh"
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
[ -s "$HOME/.bun/_bun" ] && source "$HOME/.bun/_bun"
[ -f "$HOME/.ghcup/env" ] && source "$HOME/.ghcup/env"
# eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
eval "$(zoxide init zsh --cmd c)"
