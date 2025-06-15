lua << EOF
require("telescope").setup({
		defaults = {
			prompt_prefix = " ",
			selection_caret = " ",
			selection_strategy = "reset",
			sorting_strategy = "descending",
			initial_mode = "insert",
			entry_prefix = " ",
			scroll_strategy = "limit",
			results_title = false,
			borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
			layout_strategy = "horizontal",
			path_display = { "absolute" },
			file_ignore_patterns = {},
			layout_config = {
				width = 0.75,
				preview_cutoff = 120,
			--	prompt_position = "bottom",
				horizontal = {
					preview_width = 0.5,
				},
			},
--			file_previewer = require("telescope.previewers").vim_buffer_cat.new,
--			grep_previewer = require("telescope.previewers").vim_buffer_vimgrep.new,
--			qflist_previewer = require("telescope.previewers").vim_buffer_qflist.new,
--			file_sorter = require("telescope.sorters").get_fuzzy_file,
--			generic_sorter = require("telescope.sorters").get_generic_fuzzy_sorter,
		},
		extensions = {
			fzf = {
				fuzzy = true,
				override_generic_sorter = true,
				override_file_sorter = true,
				case_mode = "smart_case",
			},
			frecency = {
				show_scores = true,
				show_unindexed = true,
				ignore_patterns = { "*.git/*", "*/tmp/*" },
			},
		},
		pickers = {
			buffers ={
			 theme="dropdown",
			},
		--	find_files = fixfolds,
			find_files={
			 theme="dropdown",
			},
		git_files ={
			 theme="dropdown",
		},
	grep_string = {
			 theme="dropdown",
		},
	live_grep ={
			 theme="dropdown",
	},
oldfiles ={
			 theme="dropdown",
},
		},
	})
	require("telescope").load_extension("fzf")
	require("telescope").load_extension("project")
	require("telescope").load_extension("zoxide")
--	require("telescope").load_extension("frecency")
EOF

" Find files using Telescope command-line sugar.
nnoremap <leader>tel <cmd>Telescope<cr>
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>
nnoremap <leader>reg <cmd>Telescope registers<cr> 

