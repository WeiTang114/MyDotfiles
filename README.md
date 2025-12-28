MyDotfiles
==========

## Installation

### 1. Clone the repository
```bash
git clone https://github.com/WeiTang114/MyDotfiles.git ~/MyDotfiles
cd ~/MyDotfiles
```

### 2. Run the setup script
This script works on **macOS** and **Ubuntu/Debian**.
```bash
./install.sh
```

It will automatically:
- Install dependencies (Zsh, Starship, Zoxide, Eza, Bat, Fzf).
- Install Oh My Zsh and plugins.
- Link configuration files.

### 3. Restart Terminal
Open a new terminal session to enjoy your new setup!

## 🔄 Reset / Update
If you want to update your tools or reset your configuration:

### Update Everything
Run the install script again. It is safe to run multiple times.
```bash
./install.sh
```

### Reset Vim Plugins
If Vim is acting up, you can reinstall all plugins:
```bash
# Reinstall Plugins
vim +PlugInstall +qall

# Reinstall Coc Extensions
vim +"CocInstall -sync coc-pyright coc-json coc-html coc-css coc-sh coc-clangd" +qall
```
