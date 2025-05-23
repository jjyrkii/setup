echo "Installing ghostty..."

CONFIG_PATH="$HOME/.config/ghostty"

if [ -d "${CONFIG_PATH}" ]; then
  rm -rf "${CONFIG_PATH}"
  mkdir -p "${CONFIG_PATH}"
fi

ln -s "$(pwd)/ghostty/config" "${CONFIG_PATH}/config"

echo "Finished installing ghostty..."

echo "$0 $1 $2"
