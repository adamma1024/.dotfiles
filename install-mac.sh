/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
brew install git
brew install --cask git-credential-manager

rm -rf ~/.dotfiles
git clone https://github.com/adamma1024/.dotfiles.git ~

cd .dotfiles
./install
