- [TOOLS](#TOOLS)
  - [ripgrep](#ripgrep)
  - [fzf](#fzf)
    - [Mac - Linux](#Mac - Linux)
    - [Windows](#Windows)
  - [zoxide ( A smarter cd )](#zoxide " A smarter cd ")
  - [bat - cat replacement](#bat - cat replacement)
    - [Mac](#Mac)
    - [Windows](#Windows)
    - [Linux](#Linux)
  - [fd](#fd)
    - [Linux](#Linux)
    - [Mac](#Mac)
    - [Windows](#Windows)
  - [lsd](#lsd)
    - [Linux - Mac](#Linux - Mac)
    - [Windows](#Windows)
  - [jq (json previewer)](#jq "json previewer")
  - [bottom (replace htop)](#bottom "replace htop")
    - [Linux - Mac - Windows](#Linux - Mac - Windows)
  - [unar](#unar)
  - [cmake](#cmake)
  - [make](#make)
- [NEOVIM](#NEOVIM) - [Mac - Linux](#Mac - Linux) - [Windows](#Windows)
  - [NEOVIM DEPENDENCIES](#NEOVIM DEPENDENCIES)

### Mac - Linux

# TOOLS

## ripgrep

```
cargo install ripgrep
```

## fzf

### Mac - Linux

```
brew install fzf
```

### Windows

```
choco install fzf
```

## zoxide ( A smarter cd )

[link](https://github.com/ajeetdsouza/zoxide)

## bat - cat replacement

### Mac

```
brew install bat
```

### Windows

```
choco install bat
```

### Linux

```
sudo apt install bat
```

## fd

### Linux

```
sudo apt install fd-find
ln -s $(which fdfind) ~/.local/bin/fd
```

### Mac

```
brew install fd
```

### Windows

```
choco install fd
```

## lsd

### Linux - Mac

```
brew install lsd
```

### Windows

```
cargo install lsd
```

## jq (json previewer)

[link](https://jqlang.github.io/jq/)

## bottom (replace htop)

### Linux - Mac - Windows

```
cargo install bottom --locked
```

## unar (archive preview)

[link](https://theunarchiver.com/command-line)

## cmake

[link](https://cmake.org/download/)

## make

```
choco install make
```

# NEOVIM

### Mac - Linux

```
-- Install
brew install --HEAD neovim
-- Update
brew upgrade neovim --fetch-HEAD
```

### Windows

```
choco install neovim --pre
```

## NEOVIM DEPENDENCIES

```
pip install neovim
npm install -g neovim
```
