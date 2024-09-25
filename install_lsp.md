- [LANGUAGES](#languages)
  - [Zig](#zig)
  - [Rust](#rust)
    - [Windows](#windows)
    - [Linux - Mac](#linux-mac)
  - [Python](#python)
  - [Node](#node)
  - [Go](#go)
  - [Lua](#lua)
  - [Gleam - Erlang - Elixir](#gleam-erlang-elixir)
    - [Windows](#windows)
    - [Mac and Linux](#mac-and-linux)
  - [Ocaml - Opam](#ocaml-opam)
- [FILE EXPLORER](#file-explorer)
  - [Yazi](#yazi)
    - [Windows](#windows)
    - [Mac and Linux](#mac-and-linux)
- [TOOLS](#tools)
  - [poppler](#poppler)
  - [ripgrep](#ripgrep)
  - [fzf](#fzf)
    - [Mac - Linux](#mac-linux)
    - [Windows](#windows)
  - [zoxide ( A smarter cd )](#zoxide)
  - [bat - cat replacement](#bat-cat-replacement)
    - [Mac](#mac)
    - [Windows](#windows)
    - [Linux](#linux)
  - [fd](#fd)
    - [Linux](#linux)
    - [Mac](#mac)
    - [Windows](#windows)
  - [lsd](#lsd)
    - [Linux - Mac](#linux-mac)
    - [Windows](#windows)
  - [jq (json previewer)](#jq)
  - [bottom (replace htop)](#bottom)
  - [unar (archive preview)](#unar)
  - [cmake](#cmake)
  - [make](#make)
  - [LLVM + Clang](#llvm-clang)
    - [Windows](#windows)
- [NEOVIM](#neovim)
  - [Mac - Linux](#mac-linux)
  - [Windows](#windows)
  - [NEOVIM DEPENDENCIES](#neovim-dependencies)

# LANGUAGES

## Zig

[Download](https://github.com/ziglang/zig/releases)

## Rust

### Windows

[Download](https://static.rust-lang.org/rustup/dist/x86_64-pc-windows-msvc/rustup-init.exe)

### Linux - Mac

```bash
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
```

## Python

[Download](https://www.python.org/downloads/)

## Node

[Download](https://nodejs.org/dist/v20.16.0/node-v20.16.0-x64.msi)

## Go

[Download](https://go.dev/dl/)

## Lua

[Download](https://sourceforge.net/projects/luabinaries/files/5.4.2/)

## Gleam - Erlang - Elixir

### Windows

```bash
scoop install erlang
scoop install gleam
scoop install elixir
```

### Mac and Linux

```bash
brew install erlang
brew install gleam
brew install elixir
```

## Ocaml - Opam

[Download](https://github.com/ocaml/opam/releases)

# FILE EXPLORER

## Yazi

```bash
cargo install --locked --git https://github.com/sxyazi/yazi.git yazi-fm yazi-cli
```

### Windows

- Add environment variable
  `YAZI_FILE_ONE = "C:\Program Files\Git\usr\bin\file.exe"`

### Mac and Linux

```bash
brew install font-symbols-only-nerd-font
brew install ffmpegthumbnailer
```

Optional Dependencies:

- [poppler](#poppler)
- [ripgrep](#ripgrep)
- [fzf](#fzf)
- [zoxide](#zoxide)
- [fd](#fd)
- [jq](#jq)
- [unar](#unar)
- [delta](#delta)
- [sad](#sad)

# TOOLS

## Lazygit

```bash
go install github.com/jesseduffield/lazygit@latest
```

## poppler

```bash
scoop install poppler
```

## ripgrep

```bash
cargo install ripgrep
```

## fzf

### Mac - Linux

```bash
brew install fzf
```

### Windows

```bash
scoop install fzf
```

## zoxide

[ZOXIDE](https://github.com/ajeetdsouza/zoxide)

## bat - cat replacement

### Mac

```bash
brew install bat
```

### Windows

```bash
scoop install bat
```

### Linux

```bash
sudo apt install bat
```

## fd

### Linux

```bash
sudo apt install fd-find
ln -s $(which fdfind) ~/.local/bin/fd
```

### Mac

```bash
brew install fd
```

### Windows

```bash
scoop install fd
```

## lsd

### Linux - Mac

```bash
brew install lsd
```

### Windows

```bash
cargo install lsd
```

## jq

[link](https://jqlang.github.io/jq/)

## bottom

```bash
cargo install bottom --locked
```

## unar

[UNAR](https://theunarchiver.com/command-line)

## cmake

[CMAKE](https://cmake.org/download/)

## make

```bash
choco install make
```

## LLVM + Clang

### Windows

[LLVM + CLANG](https://github.com/llvm/llvm-project/releases)

## Delta

```bash
cargo install git-delta
```

## Sad

```bash
cargo install --locked --all-features --root="/usr/bin/" \
  --git https://github.com/ms-jpq/sad --branch senpai
```

# NEOVIM

### Mac - Linux

```bash
brew install --HEAD neovim
brew upgrade neovim --fetch-HEAD
```

### Windows

```bash
choco install neovim --pre
```

## NEOVIM DEPENDENCIES

```bash
pip install neovim
npm install -g neovim
```
