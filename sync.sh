#!/bin/bash

# Define the destination directory
DEST_DIR="./mi_config_nvim"

# Create the destination directory if it doesn't exist
mkdir -p $DEST_DIR

# Función para copiar configuraciones a DEST_DIR
backup_configs() {
    echo "Backing up Neovim configurations to $DEST_DIR..."

    cp -r ~/.config/nvim $DEST_DIR/nvim_config
    cp -r ~/.local/share/nvim $DEST_DIR/nvim_share
    cp -r ~/.local/state/nvim $DEST_DIR/nvim_state
    cp -r ~/.cache/nvim $DEST_DIR/nvim_cache

    echo "Backup completed."
}

# Función para restaurar configuraciones desde DEST_DIR
restore_configs() {
    echo "Restoring Neovim configurations from $DEST_DIR..."

    cp -r $DEST_DIR/nvim_config ~/.config/nvim
    cp -r $DEST_DIR/nvim_share ~/.local/share/nvim
    cp -r $DEST_DIR/nvim_state ~/.local/state/nvim
    cp -r $DEST_DIR/nvim_cache ~/.cache/nvim

    echo "Restoration completed."
}

# Verificar argumento pasado al script
if [ "$1" == "backup" ]; then
    backup_configs
elif [ "$1" == "restore" ]; then
    restore_configs
else
    echo "Usage: $0 {backup|restore}"
    exit 1
fi
