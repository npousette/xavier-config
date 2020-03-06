# Xavier Environment

This is an OSX development environment configuration. This README documents the complete process for setting up the development environment, and quickly getting up and running on any OSX machine.

As a general overview, this configuration will replace usage of the default terminal with ITerm2 and Zsh. It will utilize Oh-My-Zsh as the plugin manager for the terminal. This configuration will also configure a minimal, effective NeoVim environment with Tmux.

This entire development environment has theme synchronicity based on the OneDark theme. The Style guide will walk through adjusting the ITerm2 profile settings and using the PowerLevel9K Terminal theme. The font of choice for this configuration is Fira Code.

![Color Reference](https://raw.githubusercontent.com/Rheisen/xavier-config/master/images/color_reference.png)

Colors: `#282C34`, `#E06C75`, `#98C379`, `#E5C07B`, `#61AFEF`, `#C678DD`, `#56B6C2`, `#ABB2BF`

### Step One: Downloads

- ITerm2 ([web link](https://iterm2.com/downloads.html))
- Fira Code w/ NerdFont Patch (Install ttf files, retina or regular recommended) ([web link](https://github.com/ryanoasis/nerd-fonts/tree/master/patched-fonts/FiraCode))
- Homebrew ([web link](https://brew.sh/))
- Oh-My-Zsh ([web link](https://github.com/ohmyzsh/ohmyzsh))
- VimPlug (install for Vim & NeoVim) ([web link](https://github.com/junegunn/vim-plug))
- Done

### Step Two: Brew Installations

Install or update the following with Homebrew:

- `brew install node`
- `brew install neovim`
- `brew install git`
- `brew install tmux`
- Done

### Step Three: Clone this Repository

- Git clone this repository inside the root directory.
- Hide the repository (optional, recommended): `mv xavier-config .xavier-config`
- Open the repository with finder: `cd ~/.xavier-config; open .`
- Done

### Step Four: ITerm2 Setup

- Open ITerm2 (if you didn't use it in the previous step)
- Copy the iterm files somewhere easily findable: `cp ~/.xavier-config/iterm ~/documents/iterm`
- Open the ITerm2 Preferences Menu (ITerm2 > Preferences)
- Select Profiles, Select Colors, Select "Import" from Color Presets in bottom right corner
- Import `colors.itermcolors` from within Documents
- Recommended: No cursor guide, 0 Minimal Contrast, 0 Cursor Boost
- Select Text (still under Profiles), and change Font to FiraCode Nerd Font (Retina or Regular recommended)
- Done

### Step Four: Environment Configuration

- Symlink the Zsh configuration: `ln -s ~/.xavier-config/.zshrc ~/.zshrc`
- Symlink the Vim configuration: `ln -s ~/.xavier-config/.vimrc ~/.vimrc`
- Symlink the NeoVim configuration: `ln -s ~/.xavier-config/init.vim ~/.config/nvim/init.vim`
- Symlink the Tmux configuration: `ln -s ~/.xavier-config/.tmux.conf ~/.tmux.conf`
- Open the vimrc `vim ~/.xavier-config/.vimrc` and run `:PlugInstall`
- Open the nvim init file `nvim ~/.xavier-config/init.vim` and run `:PlugInstall` 
- Done