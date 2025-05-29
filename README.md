# my-nvim-config

This is my current nvim configuration. It is maintained solely for me, however, 
feel free to make requests.

### Requirements:
- The following are needed for various plugins to work:
    - Deno 

### Features
- the configuration currently successfully enables the following features
- Basic:
    - a color-scheme (currently moonfly)
    - status line with lualine
    - lazy loading and plugin management with lazy.nvim 

- General/Utility:
    - a git wrapper using fugitive.vim 
    - startup time profiling with vim-startup
    - easy line and block commenting using Comment 
    - comment highlighting using folke's todo-comments
    - split/join functionality for code blocks with treesj 
    - undo history with undotree
    - consolidated error and diagnostic tracking using trouble 
    - devicon support through nvim-web-devicons 
    - Markdown file previewing with peek.nvim
    - syntax highlighting with nvim-treesitter
    - plenary includes as many plugins depend on it

- Keybinds:
    - custom key bindings using the builtin Vim keymap API
    - plugin-specific custom key bindings using the lazy.nvim keys API
    - keybind helper/list with which-key.nvim

- LSP: 
    - configuration and management using mason and mason-lspconfig 
        - currently: basedpyright, clangd, zls, and lua_ls

- Autocomplete/Snippets:
    - autocompletion using cmp
    - common snippets with LuaSnip and friendly-snippets

- Fuzzy finder:
    - fuzzy finding with telescope.nvim 
        - uses ripgrep for some features 
        - telescope-fzy-native.nvim for sorting performance boost
        - treesitter as a finder

### NOTES:
- main branch is the latest stable version 
- working branch is used by me when adding or changing the configuration.
- if issues occur with the peek.nvim plugin when running `:PeekOpen` 
  (especially regarding a js or deno lib), run the following commands in your terminal:
  `cd ~/.local/share/nvim/lazy/peek.nvim`
  `deno task --quiet build:fast`

### Plugin Credits:
- Comment.nvim: https://github.com/numToStr/Comment.nvim
- LuaSnip: https://github.com/L3MON4D3/LuaSnip
- nvim-cmp: https://github.com/hrsh7th/nvim-cmp
- friendly_snippets: https://github.com/rafamadriz/friendly-snippets
- lazy.nvim: https://github.com/folke/lazy.nvim
- lualine.nvim: https://github.com/nvim-lualine/lualine.nvim
- mason-lspconfig.nvim: https://github.com/mason-org/mason-lspconfig.nvim
- mason.nvim: https://github.com/mason-org/mason.nvim
- vim-moonfly-colors (moonfly): https://github.com/bluz71/vim-moonfly-colors
- nvim-lspconfig: https://github.com/neovim/nvim-lspconfig
- nvim-treesitter: https://github.com/nvim-treesitter/nvim-treesitter
- nvim-web-devicons: https://github.com/nvim-tree/nvim-web-devicons
- peek.nvim: https://github.com/toppair/peek.nvim
- plenary.nvim: https://github.com/nvim-lua/plenary.nvim
- ripgrep: https://github.com/BurntSushi/ripgrep
- telescope-fzy-native: https://github.com/nvim-telescope/telescope-fzy-native.nvim
- telescope: https://github.com/nvim-telescope/telescope.nvim
- todo-comments.nvim: https://github.com/folke/todo-comments.nvim
- treesj: https://github.com/Wansmer/treesj
- trouble.nvim: https://github.com/folke/trouble.nvim
- undotree: https://github.com/mbbill/undotree
- vim-fugitive: https://github.com/tpope/vim-fugitive
- vim-startuptime: https://github.com/dstein64/vim-startuptime
- which-key.nvim: https://github.com/folke/which-key.nvim
