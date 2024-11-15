-- lsp config here
return {
	{
		"neovim/nvim-lspconfig",
		lazy = false,
		dependencies = {
			"williamboman/mason.nvim",
			"williamboman/mason-lspconfig.nvim",
			-- for cmp
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
			"hrsh7th/nvim-cmp",
			"L3MON4D3/LuaSnip",
			"saadparwaiz1/cmp_luasnip",
			-- for fidget
			"j-hui/fidget.nvim"
		},
		-- configured according to mason-lspconfig guidance
		-- order: fidget -> mason -> mason-lspconfig -> servers started w/ lspconfig -> nvim-cmp
		config = function()
			-- configure fidget here 
			require("fidget").setup({
				-- opts for LSP progress subsystem
				progress = {
					poll_rate = 0,	-- how/when to poll for progress messages
					suppress_on_insert = false,  -- suppress new messages in insert?
					ignore_done_already = false,  -- ignore new tasks that are already complete?
					ignore_empty_message = false,  -- ignore new tasks that don't contain a message
					clear_on_detach = function()  -- clear notification on LSP server detach
						local client = vim.lsp.get_client_by_id(client_id)
						return client and client.name or nil
					end,
					notification_group = function(msg) return msg.lsp_client.name end,  -- how to get a progress message's notification group key
					ignore = {},  -- list of LSP servers to ignore

					-- opts for how LSP progress messages are displayed
					display = {
						render_limit = 16,  -- how many LSP server messages can be shown at once?
						done_ttl = 3,  -- how long a message should persist after completion
						done_icon = "✔",  -- icon when all LSP progress tasks are complete
						done_style = "Constant", -- highlight group for completed tasks 
						progress_ttl = math.huge,  -- how long a message should persist when in progress
						progress_icon = { pattern = "dots", period = 1 },  -- icon shown when LSP tasks are in progress
						progress_style = "WarningMsg",  -- highlight group for in-progress LSP tasks
						group_style = "Title",  -- highlight group for group icons
						icon_style = "Question",  -- highlight group for group icons
						priority = 30,  -- ordering priority for LSP notif group
						skip_history = true,  -- whether progress notifs should be omitted from skip_history
						format_message = require("fidget.progress.display").default_format_message,  -- how to format a progress message
						format_annote = function(msg) return msg.title end,  -- how to format a progress annotation
						format_group_name = function(group) return tostring(group) end, -- how to format a progress notif group's name
						overrides = {
						},  -- ^ override options form the default notif config
					},
				},

				-- opts for neovim's LSP client
				lsp = {
					progress_ringbuf_size = 0,  -- config nvim's LSP progress ring buffer progress_ringbuf_size
					log_handler = false,  -- Log "$/progress" handler invocations (for debugging)
				},

				-- opts related notification subsystem
				notification = {
					poll_rate = 10,  -- how often to update and render notifs?
					filter = vim.log.levels.INFO,  -- minimuym notification levels
					history_size = 128,  -- num of removed msgs to retain in history 
					override_vim_notify = false,  -- auto override vim.notify() with Fidget 
					configs = { default = require("fidget.notification").default_config },  -- how to config notif groups when instantiated
					redirect = function(msg, level, opts)
						if opts and opts.on_open then
							return require("fidget.integration.nvim-notify").delegate(msg, level, opts)
						end
					end,

					-- opts related to how notifs are rendered as texts 
					view = {
						stack_upwards = true,  -- display notif items from bottoms to top
						icon_separator = " ",  -- separator btwn group name and icon
						group_separator = "---",  -- separator btwn notif groups
						group_separator_hl = "Comment",  -- highlight group used for groups separator
						render_message = function(msg, cnt)
							return cnt == 1 and msg or string.format("(%dx) %s", cnt, msg)
						end,
					},

					-- opts related to the notif window and buffer
					window = {
						normal_hl = "Comment",  -- base highlight group in the notif window
						winblend = 100,  -- background color opacity in the notif window
						border = "none",  -- border around the notif window
						zindex = 45,  -- stacking priority of the notif window
						max_width = 0,  -- max width of notif window
						max_height = 0,  -- max height of notif window
						x_padding = 1,  -- padding from right edge
						y_padding = 0,  -- padding from btmn edge
						align = "bottom",  -- how to align the notif window
						relative = "editor",  -- what the notif window position is relative to
					},
				},

				-- opts related to integrating with other plugins
				integration = {
					
				},
			})

			-- configure mason here
			require("mason").setup({
			ui = {
				icons = {
					package_installed = "✓",
            				package_pending = "➜",
            				package_uninstalled = "✗"
				}
			}})

			-- configure mason-lspconfig here
			require("mason-lspconfig").setup({
				-- servers in use, whether personally configured or not, go here.
				-- exceptions are servers that mason does not have, or if you want
				-- to use a builtin server (clangd).
				ensure_installed = { "zls", "basedpyright", "lua_ls", "clangd" },
				handlers = {
					-- default handler
					function(server_name)
						require("lspconfig")[server_name].setup{}
					end,

					-- servers that you wish to override default settings will go here.
					-- all other in ensure_installed will pass through the default handler.
					-- syntax: [server_name] = function()
						-- require("X_Y_Z").setup({})
					-- end,
					-- "X_Y_Z" here is determined by the lsp server's recommendations/docs
					["lua_ls"] = function()
						require("lspconfig").lua_ls.setup({
							settings = {
								Lua = {
									diagnostics = {
										globals = { "vim" }
									}
								}
							}
						})
					end,
				},
			})

			-- configure cmp here
			local cmp = require('cmp')
			cmp.setup({
			    snippet = {
				-- REQUIRED - you must specify a snippet engine
				expand = function(args)
					require("luasnip").lsp_expand(args.body)
			      end,
			    },
			    window = {
			      -- completion = cmp.config.window.bordered(),
			      -- documentation = cmp.config.window.bordered(),
			    },
			    mapping = cmp.mapping.preset.insert({
				    ["<C-b>"] = cmp.mapping.scroll_docs(-4),
				    ["<C-f>"] = cmp.mapping.scroll_docs(4),
				    ["<C-Space>"] = cmp.mapping.complete(),
				    ["<C-e>"] = cmp.mapping.abort(),
				    ["<CR>"] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item.
				    -- ^^Set `select` to `false` to only confirm explicitly selected items.
			    }),
			    sources = cmp.config.sources({
				    { name = "nvim_lsp" },
				    { name = 'luasnip' }, -- For luasnip users.
			    },
			    {
				    { name = "buffer" },
			    })
		    })

		    vim.diagnostic.config({
			    virtual_text = true,
			    update_in_insert = true,
			    float = {
				    focusable = false,
				    style = "minimal",
				    border = "rounded",
				    source = "always",
				    header = "",
				    prefix = "",
			    },
		    })
	    end,
    },

}
