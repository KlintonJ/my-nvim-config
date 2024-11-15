# my-nvim-config
![image](https://github.com/user-attachments/assets/8efb9285-4b19-4bc7-96e5-8901486606df)

This is my current nvim configuration. Note that this README may not fully reflect the configuration at all times. 
For a better understanding, take a look at the commit history of main.

The configuration currently successfully enables the following features:
- lazy loading with the lazy.nvim plugin manager
- startup time profiling with vim-startup
- autocmds related to LSP server attach (TODO: make this more clear later)
- custom key bindings using the builtin Vim keymap method
- plugin-specific custom key bindings using the lazy.nvim keys method
- a git wrapper using the legendary fugitive.vim 
- line and block easy commenting using Comment 
- TODO (and more) comment highlighting using folke's todo-comments
- split/join functionality for code blocks with Wansmer's treesj
- undo history
- LSP server configuration using Mason and Mason-lspconfig
   - basedpyright, clangd, zls, and lua_ls
- autocompletion using cmp
- consolidated error and diagnostic tracking using folke's trouble
- non-invasive in-editor LSP server updates/messages using fidget.nvim (`not satisfied`)
- devicon support through nvim-web-devicons 
- support for plenary, treesitter, ripgrep, fd, and fzy-native 
- the nightfox family of color schemes (carbonfox currently) 


`NOTE: Main branch is the latest stable version, and the working branch is used by me when adding or changing the configuration.`


### Links:
- TODO: add plugin links here
