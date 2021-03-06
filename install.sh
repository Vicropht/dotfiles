# Inspired by Jieverson's WSL Dotfiles: https://github.com/jieverson/dotfiles-win

echo "apt update..."
sudo apt -qq update
echo "✔ update done!"

sudo apt -qq install zsh git
echo "✔ base packeges are installed"

git pull
echo "✔ dotfiles are up to date"

ln -sf $(pwd)/bashrc ~/.bashrc
echo "✔ zsh as default shell"

# install oh-my-zsh
[ -d ~/.oh-my-zsh ] || git clone https://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh
[ -d ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting ] || git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting

# synlink oh-my-zsh theme
#mkdir -p ~/.oh-my-zsh && mkdir -p ~/.oh-my-zsh/themes
#ln -sf $(pwd)/oh-my-zsh/themes/lambda_robbyrussell.zsh-theme ~/.oh-my-zsh/themes/lambda_robbyrussell.zsh-theme
#ln -sf $(pwd)/oh-my-zsh/themes/emoji_robbyrussell.zsh-theme ~/.oh-my-zsh/themes/emoji_robbyrussell.zsh-theme
#echo "✔ oh my zsh configured!"

ln -sf $(pwd)/zshrc ~/.zshrc
echo "✔ .zshrc symlinked"

ln -sf $(pwd)/gitconfig ~/.gitconfig
echo "✔ .gitconfig symlinked"

mkdir -p ~/.config
mkdir -p ~/.config/ranger
ln -sf $(pwd)/config/ranger/rc.conf ~/.config/ranger/rc.conf
echo "✔ other configs symlinked"

mkdir -p ~/.bin
ln -sf $(pwd)/bin/start ~/.bin/start
ln -sf /mnt/c/Program\ Files\ \(x86\)/BraveSoftware/Brave-Browser/Application/brave.exe ~/.bin/chrome
echo "✔ alias for windows programs"

rm -f ~/c
ln -sf /mnt/c ~/c
#rm -f ~/projects
#ln -sf /mnt/c/Projects ~/projects
rm -f ~/downloads
ln -sf /mnt/c/Users/victo/Downloads ~/downloads
rm -f ~/pictures
ln -sf /mnt/c/Users/victo/Pictures ~/pictures
echo "✔ alias for windows folders"

curl -sL https://deb.nodesource.com/setup_12.x | sudo -E bash -
sudo apt -qq install nodejs
sudo apt -qq install npm
echo "✔ apt dev tools installed"

sudo apt -qq install caca-utils ranger screenfetch figlet sl cmatrix
echo "✔ other cool stuff installed"

# https://github.com/denysdovhan/spaceship-prompt
if [ -d "$ZSH/custom/themes/spaceship-prompt" ]
then
    echo "spaceship-prompt is already installed, skipping..."
else
    git clone https://github.com/denysdovhan/spaceship-prompt.git "$ZSH/custom/themes/spaceship-prompt"
    sudo ln -s "$ZSH/custom/themes/spaceship-prompt/spaceship.zsh-theme" "$ZSH/custom/themes/spaceship.zsh-theme"
fi
echo "✔ spaceship theme installed"
