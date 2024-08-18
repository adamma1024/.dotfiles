
# Check if Homebrew is installed
if command -v brew &> /dev/null
else
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

rm -rf ~/.dotfiles
git clone https://github.com/adamma1024/.dotfiles.git ~

cd .dotfiles

# restore brew packages
brew bundle --file=/mac/mac-backup-files/Brewfile

# Create Symbolic links
./install
