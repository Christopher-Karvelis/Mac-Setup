# Mac-Setup

## Steps to back up current Mac

1. Create a folder .dotfiles in the home directory

2. Sym link the files you want to back up to the .dotfiles folder

```zsh
# There are better and less manual ways to do this;
# investigate install scripts and bootstrapping tools.

ln -s ~/.dotfiles/.zshrc ~/.zshrc
ln -s ~/.dotfiles/.gitconfig ~/.gitconfig
```
3. Create a Brewfile in the .dotfiles folder to back up the software you have installed

```zsh
brew bundle dump --describe
```
if you already have a Brewfile you could overwrite running the following command

```zsh
brew bundle dump --force --describe
```

# Backup Pycharm settings


2. Configured datasources

Select the datasources from the database window and ritght click on the datasource and select copy datasource.
Then paste the contents in the DatasourcesSettings.xml file.

## Steps to bootstrap a new Mac

1. Install Apple's Command Line Tools, which are prerequisites for Git and Homebrew.

```zsh
xcode-select --install
```


2. Clone repo into new hidden directory.

```zsh
# Use SSH (if set up)...
git clone git@github.com:Christopher-Karvelis/Mac-Setup.git ~/.dotfiles

# ...or use HTTPS and switch remotes later.
git clone https://github.com/Christopher-Karvelis/Mac-Setup.git ~/.dotfiles
```


3. Create symlinks in the Home directory to the real files in the repo.

```zsh
# There are better and less manual ways to do this;
# investigate install scripts and bootstrapping tools.

ln -s ~/.dotfiles/.zshrc ~/.zshrc
ln -s ~/.dotfiles/.gitconfig ~/.gitconfig
```


4. Install Homebrew, followed by the software listed in the Brewfile.

```zsh
# These could also be in an install script.

# Install Homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Then pass in the Brewfile location...
brew bundle --file ~/.dotfiles/Brewfile

# ...or move to the directory first.
cd ~/.dotfiles && brew bundle
```


## TODO List

- Learn how to use [`defaults`](https://macos-defaults.com/#%F0%9F%99%8B-what-s-a-defaults-command) to record and restore System Preferences and other macOS configurations.
- Organize these growing steps into multiple script files.
- Automate symlinking and run script files with a bootstrapping tool like [Dotbot](https://github.com/anishathalye/dotbot).
- Revisit the list in [`.zshrc`](.zshrc) to customize the shell.
- Make a checklist of steps to decommission your computer before wiping your hard drive.
- Create a [bootable USB installer for macOS](https://support.apple.com/en-us/HT201372).
- Integrate other cloud services into your Dotfiles process (Dropbox, Google Drive, etc.).
- Find inspiration and examples in other Dotfiles repositories at [dotfiles.github.io](https://dotfiles.github.io/).
)!

## Thank You!

I offer the most massive of thanks to [Patric McDonald](https://github.com/eieioxyz/Beyond-Dotfiles-in-100-Seconds/blob/master/README.md) 
