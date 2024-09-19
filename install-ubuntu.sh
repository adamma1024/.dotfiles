# Use Apt as a packge manager
# Configurate the apt
sudo apt update --allow-insecure-repositories
apt install curl
curl -fsSL https://apt.fury.io/wez/gpg.key | sudo gpg --yes --dearmor -o /usr/share/keyrings/wezterm-fury.gpg

# install from the backup file
sudo apt-get install --yes $(awk '{print $1}' ~/.dotfiles/linux_ubuntu/package_list.txt)

# install the oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# install the hack nerd font
wget -P ~/.local/share/fonts https://github.com/ryanoasis/nerd-fonts/releases/download/v3.2.1/Hack.zip \
&& cd ~/.local/share/fonts \
&& unzip Hack.zip \
&& rm Hack.zip \
&& fc-cache -fv

# Set the Zsh to a default Shell
chsh -s $(which zsh)

# Create the SymbolicLink for the configuration files
~/.dotfiles/install
# Clone the p10K, if it doesn't exist
if [ ! -d "/usr/share/powerlevel10k" ]; then
  git clone --depth=1 https://github.com/romkatv/powerlevel10k.git /usr/share/powerlevel10k
fi

source .zshrc
