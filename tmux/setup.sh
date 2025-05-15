echo "Installing tmux..."

CONFIG_PATH="$HOME/.config/tmux"

pacman -S --noconfirm tmux

if [ -d "${CONFIG_PATH}" ]; then
  rm -rf "${CONFIG_PATH}"
fi

mkdir -p "${CONFIG_PATH}"
ln -s "$(pwd)/tmux/tmux.conf" "${CONFIG_PATH}/tmux.conf"
git clone https://github.com/tmux-plugins/tpm "${CONFIG_PATH}/plugins/tpm"
tmux source "$CONFIG_PATH/tmux.conf"

echo "Finished installing tmux..."
