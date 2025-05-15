echo "Installing ZSH..."

sudo pacman -S --noconfirm zsh

if [ -d "$HOME/.oh-my-zsh" ]; then
  rm -rf "$HOME/.oh-my-zsh"
fi

INSTALL_SCRIPT="$(mktemp)"
curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh -o "$INSTALL_SCRIPT"

# Remove the 'exec zsh' line so our script can continue
sed -i '/exec zsh -l/d' "$INSTALL_SCRIPT"

# Now run the modified installer
bash "$INSTALL_SCRIPT"
rm "$INSTALL_SCRIPT"

rm -f "$HOME/.zshrc"
ln -s "$(pwd)/zsh/.zshrc" "$HOME/.zshrc"

git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

echo "Done installing ZSH."
