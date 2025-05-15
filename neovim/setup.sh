echo "Installing neovim..."

CONFIG_PATH="$HOME/.config/nvim"

sudo pacman -S --noconfirm neovim

if [ -d "${CONFIG_PATH}" ]; then
  rm -rf "${CONFIG_PATH}" "${HOME}/.local/share/nvim" "${HOME}/.local/state/nvim" "${HOME}/.cache/nvim"
fi

ln -s "$(pwd)/neovim/nvim/" "${CONFIG_PATH}"

echo "Finished installing neovim..."
