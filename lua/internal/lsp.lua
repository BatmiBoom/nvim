vim.lsp.enable({
    "clangd",
    "cssls",
    "gopls",
    "html",
    "jsonls",
    "lua_ls",
    "markdown_oxide",
    "ols",
    "ruff",
    "pyrefly",
    "rust_analyzer",
    "sqlls",
    "taplo",
    "ts_ls",
    "tailwindcss",
    "yamlls",
    "zls",
})

vim.lsp.config("lua_ls", {
    settings = {
        Lua = {
            runtime = {
                version = "LuaJIT",
            },
            diagnostics = {
                globals = { "vim" },
            },
            workspace = {
                library = vim.api.nvim_get_runtime_file("", true),
                checkThirdParty = false,
            },
            telemetry = {
                enable = false,
            },
        },
    },
})


vim.api.nvim_create_autocmd('LspAttach', {
    group = vim.api.nvim_create_augroup('LSP', { clear = true }),
    desc = "Attach some keybidings when a lsp is attached",
    callback = function()
        vim.keymap.set('n', 'gd', function()
            vim.lsp.buf.definition()
        end, { desc = "Go To Definition" })
    end
})

-- Create a floating terminal
local function open_floating_terminal()
    local buf = vim.api.nvim_create_buf(false, true)
    local width = math.floor(vim.o.columns * 0.8)
    local height = math.floor(vim.o.lines * 0.8)

    local win = vim.api.nvim_open_win(buf, true, {
        relative = "editor",
        width = width,
        height = height,
        col = math.floor((vim.o.columns - width) / 2),
        row = math.floor((vim.o.lines - height) / 2),
        style = "minimal",
        border = "rounded",
    })

    vim.fn.jobstart("{term: v:true}")
    vim.cmd("startinsert")
end

vim.keymap.set("n", "<leader>t", function()
    open_floating_terminal()
end, {})
