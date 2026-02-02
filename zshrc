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
  eza
  z
)
# These plugins are installed by homebrew
export SHARE_FOLDER="/usr/local/share"
if [[ "$(uname)" == "Linux" ]]; then
  SHARE_FOLDER="/usr/share"
fi
source "$SHARE_FOLDER/zsh-autosuggestions/zsh-autosuggestions.zsh"
source "$SHARE_FOLDER/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
source "$SHARE_FOLDER/powerlevel10k/powerlevel10k.zsh-theme"
# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

source $ZSH/oh-my-zsh.sh

# nvim alias
alias vim="nvim"
alias vi="nvim"
# g++
alias g++="g++ -std=c++17 -DLOCAL"
# pyenv init
# export PYENV_ROOT="$HOME/.pyenv"
# export PATH="$PYENV_ROOT/bin:$PATH"
#
# # Load pyenv automatically
# eval "$(pyenv init --path)"
# eval "$(pyenv init -)"


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

# Function to enable proxy settings
enable_proxy() {
    export http_proxy="http://127.0.0.1:7890"
    export https_proxy="http://127.0.0.1:7890"
    export no_proxy="localhost,127.0.0.1,localaddress,.localdomain.com"
    echo "Proxy enabled."
}

# Function to disable proxy settings
disable_proxy() {
    unset http_proxy
    unset https_proxy
    unset no_proxy
    echo "Proxy disabled."
}

export SPARK_HOME=$(brew --prefix apache-spark)/libexec
export PATH=$SPARK_HOME/bin:$PATH
export GOOGLE_APPLICATION_CREDENTIALS="/Users/malin/Desktop/GoogleAuth/cs777-448806-b38b27f9aabf.json"
export PYTORCH_MPS_HIGH_WATERMARK_RATIO=0.0

# Created by `pipx` on 2025-06-28 04:24:49
export PATH="$PATH:/Users/malin/.local/bin"

# Load secrets from ~/.env (not tracked in git)
[[ -f ~/.env ]] && source ~/.env

# Claude Code
export ANTHROPIC_BASE_URL=https://anyrouter.top

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/usr/local/Caskroom/miniconda/base/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/usr/local/Caskroom/miniconda/base/etc/profile.d/conda.sh" ]; then
        . "/usr/local/Caskroom/miniconda/base/etc/profile.d/conda.sh"
    else
        export PATH="/usr/local/Caskroom/miniconda/base/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

