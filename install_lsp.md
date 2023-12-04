# LSP SERVERS INSTALL INSTRUCTIONS

## Astro
~~~
npm install -g @astrojs/language-server
~~~

## TailwindCSS
~~~
npm install -g @tailwindcss/language-server
~~~

## Clangd + llbd debugger

### Windows
[clangd + llbd](https://github.com/llvm/llvm-project/releases/tag/llvmorg-15.0.2) -> LLVM-15.0.2-win64.exe

### Linux
~~~
sudo apt install clangd
~~~

### MacOs
~~~
brew install llvm
~~~

## TypeScript
~~~
npm install -g typescript typescript-language-server
~~~

## Css - Html - JavaScript - Jsonls
~~~
npm i -g vscode-langservers-extracted
~~~

## Deno
[link](https://deno.land/#installation)


## Go
~~~
go install golang.org/x/tools/gopls@latest
~~~

## Sqlls
~~~
npm i -g sql-language-server
~~~

## Haskell
[link](https://github.com/haskell/haskell-language-server)

## Markdown

### Linux and Mac
~~~
brew install marksman
~~~

### Windows
[link](https://github.com/artempyanykh/marksman/releases)

## Python

### Pyright
~~~
pip install pyright
pip install ruff-lsp
pip install black
pip install flake8
~~~

## Rust
~~~
rustup component add rust-src
rustup component add rust-analyzer
~~~

## Toml
~~~
cargo install taplo-cli --locked --features lsp
~~~

## Sumneko [Lua]

### Windows
[link](https://github.com/sumneko/lua-language-server/releases)
~~~
scoop install lua-language-server
~~~

### Linux
[link](https://github.com/sumneko/lua-language-server/releases)

### MacOs
~~~
brew install lua-language-server
~~~

## Ocamllsp
~~~
opam install ocaml-lsp-server
~~~

## Camke
~~~
pip install cmake-language-server
~~~

## Dockerls
~~~
npm install -g dockerfile-language-server-nodejs
~~~

## Elixirls

~~~
curl -fLO https://github.com/elixir-lsp/elixir-ls/releases/latest/download/elixir-ls.zip
unzip elixir-ls.zip -d /path/to/elixir-ls
chmod +x /path/to/elixir-ls/language_server.
~~~

## Neocmake
~~~
cargo install neocmakelsp
~~~

## NimLsp
~~~
nimble install nimlangserver
~~~


# TOOLS

## cmake
[link](https://cmake.org/download/)

## make
~~~
choco install make
~~~

## ripgrep
~~~
cargo install ripgrep
~~~

## lazygit
~~~
go install github.com/jesseduffield/lazygit@latest
~~~

## fzf

### Mac - Linux
~~~
brew install fzf
~~~

### Windows
~~~
choco install fzf
~~~

## bat - cat replacement

### Mac
~~~
brew install bat
~~~

### Windows
~~~
choco install bat
~~~

### Linux
~~~
sudo apt install bat
~~~

## fd

### Linux
~~~
sudo apt install fd-find
ln -s $(which fdfind) ~/.local/bin/fd
~~~

### Mac
~~~
brew install fd
~~~

### Windows
~~~
choco install fd
~~~

## bottom

### Linux - Mac - Windows
~~~
cargo install bottom --locked
~~~

## gdu

### Linux - Mac - Windows
~~~
go install github.com/dundee/gdu/v5/cmd/gdu@latest
~~~

## Ueberzugpp

### Linux - Mac
~~~
brew install jstkdng/programs/ueberzugpp
~~~

## Rranger

### Linux - Mac - Windows
pip install ranger-fm

# NEOVIM

### Mac - Linux
~~~
-- Install
brew install --HEAD neovim
-- Update
brew upgrade neovim --fetch-HEAD
~~~
### Windows
~~~
choco install neovim --pre
~~~

## NEOVIM DEPENDENCIES
~~~
pip install neovim
npm install -g neovim
~~~
