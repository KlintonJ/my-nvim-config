# my-nvim-config

This is my current nvim configuration. It is maintained solely for me, however, 
feel free to make requests.

### Requirements:
- Neovim 0.11+; currently developed/tested on Neovim 0.12
- Deno, for building/using peek.nvim
- ripgrep, for Telescope live_grep
- tree-sitter CLI, for building/updating Tree-sitter parsers when needed

### Features
This configuration currently successfully enables the following features

- Basic:
    - a Flexoki-based colorscheme with custom dark/inky highlight overrides
    - status line with lualine
    - lazy loading and plugin management with lazy.nvim 

- General/Utility:
    - a git wrapper using fugitive.vim 
    - startup time profiling with vim-startuptime    
    - easy line and block commenting using Comment 
    - comment highlighting using folke's todo-comments
    - split/join functionality for code blocks with treesj 
    - undo history with undotree
    - diagnostics, references, and symbol navigation using trouble.nvim 
    - devicon support through nvim-web-devicons 
    - Markdown file previewing with peek.nvim
    - syntax highlighting with nvim-treesitter (Neovim's built-in Tree-sitter APIs)

- Keybinds:
    - custom key bindings using the builtin Vim keymap API
    - plugin-specific custom key bindings using the lazy.nvim keys API
    - keybind helper/list with which-key.nvim

- LSP: 
    - LSP server installation with mason.nvim and mason-lspconfig.nvim
    - LSP configuration using Neovim's built-in `vim.lsp.config` API
        - currently: clangd, zls, and lua_ls
        - ZLS semantic tokens are disabled so Tree-sitter/custom highlights control Zig syntax colors

- Autocomplete:
    - autocompletion using nvim-cmp
    - LSP completion integration using cmp-nvim-lsp
    - LuaSnip kept as a snippet expansion engine for LSP/snippet compatibility
    - LSP snippet completion items are filtered out to keep completion suggestions less noisy

- Fuzzy finder:
    - fuzzy finding with telescope.nvim 
        - uses ripgrep for some features 
        - telescope-fzy-native.nvim for sorting performance boost

### NOTES:
- `main` is my daily-use branch
- `working` is where I test changes before merging them into `main`
- if issues occur with the peek.nvim plugin when running `:PeekOpen` 
  (especially regarding a js or deno lib), run the following commands in your terminal:
  ```bash
  cd ~/.local/share/nvim/lazy/peek.nvim
  deno task --quiet build:fast
  ```

### Plugin Credits:
- Comment.nvim: https://github.com/numToStr/Comment.nvim
- LuaSnip: https://github.com/L3MON4D3/LuaSnip
- lazy.nvim: https://github.com/folke/lazy.nvim
- lualine.nvim: https://github.com/nvim-lualine/lualine.nvim
- mason-lspconfig.nvim: https://github.com/mason-org/mason-lspconfig.nvim
- mason.nvim: https://github.com/mason-org/mason.nvim
- flexoki-neovim: https://github.com/kepano/flexoki-neovim
- nvim-lspconfig: https://github.com/neovim/nvim-lspconfig
- nvim-treesitter: https://github.com/nvim-treesitter/nvim-treesitter
- nvim-web-devicons: https://github.com/nvim-tree/nvim-web-devicons
- peek.nvim: https://github.com/toppair/peek.nvim
- plenary.nvim: https://github.com/nvim-lua/plenary.nvim
- telescope-fzy-native: https://github.com/nvim-telescope/telescope-fzy-native.nvim
- telescope: https://github.com/nvim-telescope/telescope.nvim
- todo-comments.nvim: https://github.com/folke/todo-comments.nvim
- treesj: https://github.com/Wansmer/treesj
- trouble.nvim: https://github.com/folke/trouble.nvim
- undotree: https://github.com/mbbill/undotree
- vim-fugitive: https://github.com/tpope/vim-fugitive
- vim-startuptime: https://github.com/dstein64/vim-startuptime
- which-key.nvim: https://github.com/folke/which-key.nvim
- nvim-cmp: https://github.com/hrsh7th/nvim-cmp
- cmp-nvim-lsp: https://github.com/hrsh7th/cmp-nvim-lsp
- cmp-buffer: https://github.com/hrsh7th/cmp-buffer
- cmp-path: https://github.com/hrsh7th/cmp-path
