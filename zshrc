# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Path to dotfiles
export DOTFILES="$HOME/.dotfiles"

# Path to your oh-my-zsh installation.
export ZSH="$DOTFILES/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="powerlevel10k/powerlevel10k"
ZSH_CUSTOM="$DOTFILES/.oh-my-zsh/custom"
ZSH_PLUGINS="$DOTFILES/.oh-my-zsh/plugins"

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  git
  vi-mode
  zsh-autosuggestions
  zsh-syntax-highlighting
  eza
  z
)

source $ZSH/oh-my-zsh.sh

# nvim alias
alias vim="nvim"
alias vi="nvim"
# g++
alias g++="g++ -std=c++17 -DLOCAL"
alias python=python3
alias py=python3

# vim config home path
export VIM_HOME="$HOME/.vim"
export VIM_PLUGIN_HOME="$HOME/.vim/plugged"
export VIM_CONFIG_HOME="$HOME/.vim/config"
export PATH=$VIM_PLUGIN_HOME/fzf/bin:$PATH

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# source emcc
# If you want to enable the LLVM
# export EMCC_HOME="$HOME/code/web-pro/emsdk"
# export initEMCC() {
#   source $EMCC_HOME/emsdk_env.sh
#   echo "init finish"
# }

# fzf
if type rg &> /dev/null; then
  export FZF_DEFAULT_COMMAND='rg --files'
  export FZF_DEFAULT_OPTS="--height 40% --layout=reverse --preview '(highlight -O ansi {} || cat {}) 2> /dev/null | head -500'"
fi

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# vault
if ! type "$vault" > /dev/null; then
  export VAULT_ADDR=https://vault.reversible.dev
fi

# pnpm
export PNPM_HOME="$HOME/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end
export FPATH="$ZSH_PLUGINS/eza/completions/zsh:$FPATH"
