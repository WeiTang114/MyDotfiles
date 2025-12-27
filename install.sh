#!/bin/bash

# MyDotfiles Installation Script
# Supports macOS and Ubuntu/Debian

set -e

DOTFILES_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
ZSH_CUSTOM="${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}"

echo "🚀 Starting setup..."

# --- 1. OS Detection & Package Installation ---

if [[ "$OSTYPE" == "darwin"* ]]; then
    echo "🍎 macOS detected."
    
    if ! command -v brew &> /dev/null; then
        echo "Homebrew not found. Please install it first."
        exit 1
    fi

    echo "📦 Installing tools via Homebrew..."
    brew install zsh starship zoxide eza bat fzf

elif [[ "$OSTYPE" == "linux-gnu"* ]]; then
    echo "🐧 Linux detected."
    
    if [ -f /etc/debian_version ]; then
        echo "📦 Installing basics via apt..."
        sudo apt update
        sudo apt install -y zsh curl git build-essential
        
        # Install Eza (Official Repo)
        if ! command -v eza &> /dev/null; then
            echo "📦 Installing eza..."
            sudo mkdir -p /etc/apt/keyrings
            wget -qO- https://raw.githubusercontent.com/eza-community/eza/main/deb.asc | sudo gpg --dearmor -o /etc/apt/keyrings/gierens.gpg
            echo "deb [signed-by=/etc/apt/keyrings/gierens.gpg] http://deb.gierens.de stable main" | sudo tee /etc/apt/sources.list.d/gierens.list
            sudo chmod 644 /etc/apt/keyrings/gierens.gpg /etc/apt/sources.list.d/gierens.list
            sudo apt update
            sudo apt install -y eza
        fi

        # Install Bat
        if ! command -v bat &> /dev/null; then
            echo "📦 Installing bat..."
            sudo apt install -y bat
            # Link batcat to bat
            mkdir -p $HOME/.local/bin
            ln -sf /usr/bin/batcat $HOME/.local/bin/bat
        fi

        # Install Starship
        if ! command -v starship &> /dev/null; then
            echo "📦 Installing Starship..."
            curl -sS https://starship.rs/install.sh | sh -s -- -y
        fi

        # Install Zoxide
        if ! command -v zoxide &> /dev/null; then
            echo "📦 Installing Zoxide..."
            curl -sS https://raw.githubusercontent.com/ajeetdsouza/zoxide/main/install.sh | bash
        fi
        
        # Install Fzf
        if [ ! -d "$HOME/.fzf" ]; then
            echo "📦 Installing Fzf..."
            git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
            ~/.fzf/install --all
        fi

    else
        echo "⚠️  Unsupported Linux distribution. Please install zsh, starship, zoxide, eza, bat, fzf manually."
    fi
fi

# --- 2. Oh My Zsh Setup ---

if [ ! -d "$HOME/.oh-my-zsh" ]; then
    echo "🎨 Installing Oh My Zsh..."
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
else
    echo "✅ Oh My Zsh already installed."
fi

# --- 3. Plugins Installation ---

install_plugin() {
    local name=$1
    local repo=$2
    if [ ! -d "$ZSH_CUSTOM/plugins/$name" ]; then
        echo "🔌 Installing plugin: $name..."
        git clone "$repo" "$ZSH_CUSTOM/plugins/$name"
    else
        echo "✅ Plugin $name already installed."
    fi
}

install_plugin "zsh-autosuggestions" "https://github.com/zsh-users/zsh-autosuggestions"
install_plugin "zsh-syntax-highlighting" "https://github.com/zsh-users/zsh-syntax-highlighting.git"
install_plugin "fzf-tab" "https://github.com/Aloxaf/fzf-tab"
install_plugin "zsh-completions" "https://github.com/zsh-users/zsh-completions"

# --- 4. Dotfiles Linking ---

echo "🔗 Linking configuration files..."

# Backup existing zshrc
if [ -f "$HOME/.zshrc" ] && [ ! -L "$HOME/.zshrc" ]; then
    echo "Backing up ~/.zshrc to ~/.zshrc.bak"
    mv "$HOME/.zshrc" "$HOME/.zshrc.bak"
fi

# Link zshrc
ln -sf "$DOTFILES_DIR/zshrc.basic" "$HOME/.zshrc"

# Link Starship config
mkdir -p "$HOME/.config"
ln -sf "$DOTFILES_DIR/starship.toml" "$HOME/.config/starship.toml"

# Create custom config if not exists
if [ ! -f "$DOTFILES_DIR/zshrc.custom" ]; then
    echo "Creating empty zshrc.custom..."
    touch "$DOTFILES_DIR/zshrc.custom"
fi

# --- 5. Finalize ---

echo "🎉 Setup complete!"
echo "Please restart your terminal or run: source ~/.zshrc"
