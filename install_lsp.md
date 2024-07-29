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

`curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh`

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

```console
scoop install erlang
scoop install gleam
scoop install elixir
```

### Mac and Linux

```console
brew install erlang
brew install gleam
brew install elixir
```

## Ocaml - Opam

[Download](https://github.com/ocaml/opam/releases)

# FILE EXPLORER

## Yazi

`cargo install --locked --git https://github.com/sxyazi/yazi.git yazi-fm yazi-cli`

### Windows

- Add environment variable
  `YAZI_FILE_ONE = "C:\Program Files\Git\usr\bin\file.exe"`

### Mac and Linux

- `brew install font-symbols-only-nerd-font`
- `brew install ffmpegthumbnailer`

Optional Dependencies:

- [poppler](#poppler)
- [ripgrep](#ripgrep)
- [fzf](#fzf)
- [zoxide](#zoxide)
- [fd](#fd)
- [jq](#jq)
- [unar](#unar)

# TOOLS

## poppler

```
scoop install poppler
```

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

## zoxide

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

## jq

[link](https://jqlang.github.io/jq/)

## bottom

```
cargo install bottom --locked
```

## unar

[link](https://theunarchiver.com/command-line)

## cmake

[link](https://cmake.org/download/)

## make

```
choco install make
```

## LLVM + Clang

### Windows

[LLVM + CLANG](https://github.com/llvm/llvm-project/releases)

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
