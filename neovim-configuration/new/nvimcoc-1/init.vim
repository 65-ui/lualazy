" __  ____   __  _   ___     _____ __  __ ____   ____
"|  \/  \ \ / / | \ | \ \   / /_ _|  \/  |  _ \ / ___|
"| |\/| |\ V /  |  \| |\ \ / / | || |\/| | |_) | |
"| |  | | | |   | |\  | \ V /  | || |  | |  _ <| |___
"|_|  |_| |_|   |_| \_|  \_/  |___|_|  |_|_| \_\\____|

" Author: @theniceboy

" Checkout-list
" vim-esearch
" fmoralesc/worldslice
" SidOfc/mkdx


" ==================== Auto load for first time uses ====================
if empty(glob($HOME.'/.config/nvim/autoload/plug.vim'))
	silent !curl -fLo $HOME/.config/nvim/autoload/plug.vim --create-dirs
				\ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

let g:nvim_plugins_installation_completed=1
if empty(glob($HOME.'/.config/nvim/plugged/wildfire.vim/autoload/wildfire.vim'))
	let g:nvim_plugins_installation_completed=0
	autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Create a _machine_specific.vim file to adjust machine specific stuff, like python interpreter location 
let has_machine_specific_file = 1
if empty(glob('~/.config/nvim/_machine_specific.vim'))
	let has_machine_specific_file = 0
	silent! exec "!cp ~/.config/nvim/default_configs/_machine_specific_default.vim ~/.config/nvim/_machine_specific.vim"
endif
source $HOME/.config/nvim/_machine_specific.vim

" ==================== Editor behavior ====================
"set clipboard=unnamedplus
let &t_ut=''
set autochdir
set exrc
set secure
set number
set relativenumber
set cursorline
set noexpandtab
set tabstop=2
set shiftwidth=2
set softtabstop=2
set autoindent
set list
set listchars=tab:\|\ ,trail:▫
set scrolloff=4
set ttimeoutlen=0
set notimeout
set viewoptions=cursor,folds,slash,unix
set nowrap
set tw=0
set indentexpr=
set foldmethod=indent
set foldlevel=99
set foldenable
set formatoptions-=tc
set splitright
set splitbelow
set noshowmode
set ignorecase
set smartcase
set shortmess+=c
set inccommand=split
set completeopt=longest,noinsert,menuone,noselect,preview
set lazyredraw
set visualbell
silent !mkdir -p $HOME/.config/nvim/tmp/backup
silent !mkdir -p $HOME/.config/nvim/tmp/undo
"silent !mkdir -p $HOME/.config/nvim/tmp/sessions
set backupdir=$HOME/.config/nvim/tmp/backup,.
set directory=$HOME/.config/nvim/tmp/backup,.
if has('persistent_undo')
	set undofile
	set undodir=$HOME/.config/nvim/tmp/undo,.
endif
set colorcolumn=100
set updatetime=100
set virtualedit=block

au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif


" ==================== Terminal Behaviors ====================
let g:neoterm_autoscroll = 1
autocmd TermOpen term://* startinsert
tnoremap <C-N> <C-\><C-N>
tnoremap <C-O> <C-\><C-N><C-O>


" ==================== Basic Mappings ====================
let mapleader=" "
noremap ; :
nnoremap Q :q<CR>
nnoremap S :w<CR>
" Open the vimrc file anytime
nnoremap <LEADER>rc :e $HOME/.config/nvim/init.vim<CR>
nnoremap <LEADER>rv :e .nvimrc<CR>
augroup NVIMRC
    autocmd!
    autocmd BufWritePost *.nvimrc exec ":so %"
augroup END
" Undo operations
noremap l u
" Copy to system clipboard
vnoremap Y "+y
" Find pair
noremap ,. %
" Search
noremap <LEADER><CR> :nohlsearch<CR>
" Adjacent duplicate words
noremap <LEADER>dw /\(\<\w\+\>\)\_s*\1
" Space to Tab
nnoremap <LEADER>tt :%s/    /\t/g
vnoremap <LEADER>tt :s/    /\t/g
" Folding
noremap <silent> <LEADER>o za



" ==================== Insert Mode Cursor Movement ====================
inoremap <C-a> <ESC>A



" ==================== Window management ====================
" Use <space> + new arrow keys for moving the cursor around windows
noremap <LEADER>w <C-w>w
noremap <LEADER>u <C-w>k
noremap <LEADER>e <C-w>j
noremap <LEADER>n <C-w>h
noremap <LEADER>i <C-w>l
noremap qf <C-w>o
" Disable the default s key
noremap s <nop>
" split the screens to up (horizontal), down (horizontal), left (vertical), right (vertical)
noremap su :set nosplitbelow<CR>:split<CR>:set splitbelow<CR>
noremap se :set splitbelow<CR>:split<CR>
noremap sn :set nosplitright<CR>:vsplit<CR>:set splitright<CR>
noremap si :set splitright<CR>:vsplit<CR>
" Resize splits with arrow keys
" noremap <up> :res +5<CR>
" noremap <down> :res -5<CR>
" noremap <left> :vertical resize-5<CR>
" noremap <right> :vertical resize+5<CR>
" Place the two screens up and down
noremap sh <C-w>t<C-w>K
" Place the two screens side by side
noremap sv <C-w>t<C-w>H
" Rotate screens
noremap srh <C-w>b<C-w>K
noremap srv <C-w>b<C-w>H
" Press <SPACE> + q to close the window below the current window
noremap <LEADER>q <C-w>j:q<CR>


" ==================== Tab management ====================
" Create a new tab with tu
noremap tu :tabe<CR>
noremap tU :tab split<CR>
" Move around tabs with tn and ti
noremap tn :-tabnext<CR>
noremap ti :+tabnext<CR>
" Move the tabs with tmn and tmi
noremap tmn :-tabmove<CR>
noremap tmi :+tabmove<CR>


" ==================== Markdown Settings ====================
" Snippets
" source $HOME/.config/nvim/md-snippets.vim
" auto spell
" autocmd BufRead,BufNewFile *.md setlocal spell


" ==================== Other useful stuff ====================
" Open a new instance of st with the cwd
nnoremap \t :tabe<CR>:-tabmove<CR>:term sh -c 'st'<CR><C-\><C-N>:q<CR>
" Opening a terminal window
noremap <LEADER>/ :set splitbelow<CR>:split<CR>:res +10<CR>:term<CR>
" Press space twice to jump to the next '<++>' and edit it
noremap <LEADER><LEADER> <Esc>/<++><CR>:nohlsearch<CR>c4l
" Spelling Check with <space>sc
noremap <LEADER>sc :set spell!<CR>
" Press ` to change case (instead of ~)
noremap ` ~
noremap <C-c> zz
" Auto change directory to current dir
autocmd BufEnter * silent! lcd %:p:h
" Call figlet
noremap tx :r !figlet 
" find and replace
noremap \s :%s//g<left><left>
" set wrap
noremap <LEADER>sw :set wrap<CR>
" press f10 to show hlgroup
function! SynGroup()
	let l:s = synID(line('.'), col('.'), 1)
	echo synIDattr(l:s, 'name') . ' -> ' . synIDattr(synIDtrans(l:s), 'name')
endfun
map <F10> :call SynGroup()<CR>

" Compile function
noremap r :call CompileRunGcc()<CR>
func! CompileRunGcc()
	exec "w"
	if &filetype == 'c'
		set splitbelow
		:sp
		:res -5
		term gcc % -o %< && time ./%<
	elseif &filetype == 'cpp'
		set splitbelow
		exec "!g++ -std=c++11 % -Wall -o %<"
		:sp
		:res -15
		:term ./%<
	elseif &filetype == 'cs'
		set splitbelow
		silent! exec "!mcs %"
		:sp
		:res -5
		:term mono %<.exe
	elseif &filetype == 'java'
		set splitbelow
		:sp
		:res -5
		term javac % && time java %<
	elseif &filetype == 'sh'
		:!time bash %
	elseif &filetype == 'python'
		set splitbelow
		:sp
		:term python3 %
	elseif &filetype == 'html'
		silent! exec "!".g:mkdp_browser." % &"
	elseif &filetype == 'markdown'
		exec "InstantMarkdownPreview"
	elseif &filetype == 'tex'
		silent! exec "VimtexStop"
		silent! exec "VimtexCompile"
	elseif &filetype == 'dart'
		exec "CocCommand flutter.run -d ".g:flutter_default_device." ".g:flutter_run_args
		silent! exec "CocCommand flutter.dev.openDevLog"
	elseif &filetype == 'javascript'
		set splitbelow
		:sp
	  ":term export DEBUG="INFO,ERROR,WARNING"; node --trace-warnings .
	  :term node %
	elseif &filetype == 'racket'
		set splitbelow
		:sp
		:res -5
		term racket %
	elseif &filetype == 'go'
		set splitbelow
		:sp
		:term go run .
	endif
endfunc


" ==================== Install Plugins with Vim-Plug ====================
call plug#begin('$HOME/.config/nvim/plugged')

" Github Copilot
" Plug 'github/copilot.vim'

" Treesitter
Plug 'nvim-treesitter/nvim-treesitter'
Plug 'nvim-treesitter/playground'
Plug 'nvim-treesitter/nvim-treesitter-textobjects'
Plug 'p00f/nvim-ts-rainbow'
Plug 'JoosepAlviste/nvim-ts-context-commentstring'
Plug 'mfussenegger/nvim-ts-hint-textobject'
Plug 'windwp/nvim-ts-autotag'
Plug 'andymass/vim-matchup'
" Plug 'norcalli/nvim-colorizer.lua'
" Plug 'Chiel92/vim-autoformat'

" Pretty Dress
"Plug 'theniceboy/nvim-deus'
"Plug 'arzg/vim-colors-xcode'
Plug 'EdenEast/nightfox.nvim'
Plug 'catppuccin/nvim', {'as': 'catppuccin'}
Plug 'projekt0n/github-nvim-theme'
Plug 'folke/tokyonight.nvim', { 'branch': 'main'  }
Plug 'navarasu/onedark.nvim'
Plug 'sainnhe/sonokai'
Plug 'christianchiarulli/nvcode-color-schemes.vim'
Plug 'tanvirtin/monokai.nvim'
" Status line
Plug 'theniceboy/eleline.vim', { 'branch': 'no-scrollbar' }

" General Highlighter
Plug 'RRethy/vim-hexokinase', { 'do': 'make hexokinase' }
Plug 'RRethy/vim-illuminate'

" File navigation
Plug 'ibhagwan/fzf-lua'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'kevinhwang91/rnvimr'
Plug 'airblade/vim-rooter'
" Plug 'pechorin/any-jump.vim'

" Debugger
" Plug 'puremourning/vimspector', {'do': './install_gadget.py --enable-c --enable-python --enable-go'}

" Auto Complete
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" Plug 'neoclide/coc.nvim', {'branch': 'release', 'tag': 'v0.0.79'}
Plug 'wellle/tmux-complete.vim'

" Snippets
" Plug 'SirVer/ultisnips'
Plug 'theniceboy/vim-snippets'

" Undo Tree
Plug 'mbbill/undotree'

" Git
Plug 'theniceboy/vim-gitignore', { 'for': ['gitignore', 'vim-plug'] }
Plug 'theniceboy/fzf-gitignore', { 'do': ':UpdateRemotePlugins' }
"Plug 'mhinz/vim-signify'
Plug 'airblade/vim-gitgutter'
Plug 'cohama/agit.vim'
Plug 'kdheepak/lazygit.nvim'

" Tex
" Plug 'lervag/vimtex'


" HTML, CSS, JavaScript, Typescript, PHP, JSON, etc.
Plug 'elzr/vim-json'
Plug 'neoclide/jsonc.vim'
Plug 'othree/html5.vim'
Plug 'alvan/vim-closetag'
" Plug 'hail2u/vim-css3-syntax' " , { 'for': ['vim-plug', 'php', 'html', 'javascript', 'css', 'less'] }
" Plug 'spf13/PIV', { 'for' :['php', 'vim-plug'] }
" Plug 'pangloss/vim-javascript', { 'for': ['vim-plug', 'php', 'html', 'javascript', 'css', 'less'] }
Plug 'yuezk/vim-js', { 'for': ['vim-plug', 'php', 'html', 'javascript', 'css', 'less'] }
" Plug 'MaxMEllon/vim-jsx-pretty', { 'for': ['vim-plug', 'php', 'html', 'javascript', 'css', 'less'] }
" Plug 'jelera/vim-javascript-syntax', { 'for': ['vim-plug', 'php', 'html', 'javascript', 'css', 'less'] }
"Plug 'jaxbot/browserlink.vim'
Plug 'HerringtonDarkholme/yats.vim'
" Plug 'posva/vim-vue'
" Plug 'evanleck/vim-svelte', {'branch': 'main'}
" Plug 'leafOfTree/vim-svelte-plugin'
" Plug 'leafgarland/typescript-vim'
Plug 'MaxMEllon/vim-jsx-pretty'
Plug 'pangloss/vim-javascript'
Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript'
Plug 'styled-components/vim-styled-components', { 'branch': 'main' }
Plug 'pantharshit00/vim-prisma'


" Python
Plug 'Vimjas/vim-python-pep8-indent', { 'for' :['python', 'vim-plug'] }
Plug 'numirias/semshi', { 'do': ':UpdateRemotePlugins', 'for' :['python', 'vim-plug'] }
Plug 'tweekmonster/braceless.vim', { 'for' :['python', 'vim-plug'] }
"Plug 'vim-scripts/indentpython.vim', { 'for' :['python', 'vim-plug'] }
"Plug 'plytophogy/vim-virtualenv', { 'for' :['python', 'vim-plug'] }
"Plug 'tmhedberg/SimpylFold', { 'for' :['python', 'vim-plug'] }


" Markdown
Plug 'suan/vim-instant-markdown', {'for': 'markdown'}
Plug 'dhruvasagar/vim-table-mode', { 'on': 'TableModeToggle', 'for': ['text', 'markdown', 'vim-plug'] }
Plug 'mzlogin/vim-markdown-toc', { 'for': ['gitignore', 'markdown', 'vim-plug'] }
Plug 'dkarter/bullets.vim'

" Other filetypes
Plug 'wlangstroth/vim-racket'
" Plug 'jceb/vim-orgmode', {'for': ['vim-plug', 'org']}

" Editor Enhancement
Plug 'petertriho/nvim-scrollbar'
Plug 'kevinhwang91/nvim-hlslens'
Plug 'ggandor/lightspeed.nvim'
"Plug 'Raimondi/delimitMate'
Plug 'jiangmiao/auto-pairs'
Plug 'mg979/vim-visual-multi'
Plug 'theniceboy/antovim' " gs to switch
Plug 'tpope/vim-surround' " type yskw' to wrap the word with '' or type cs'` to change 'word' to `word`
Plug 'gcmt/wildfire.vim' " in Visual mode, type k' to select all text in '', or type k) k] k} kp
Plug 'junegunn/vim-after-object' " da= to delete what's after =
Plug 'godlygeek/tabular' " ga, or :Tabularize <regex> to align
Plug 'tpope/vim-capslock'	" Ctrl+L (insert) to toggle capslock
" Plug 'Konfekt/FastFold'
"Plug 'junegunn/vim-peekaboo'
"Plug 'wellle/context.vim'
Plug 'svermeulen/vim-subversive'
Plug 'theniceboy/argtextobj.vim'
Plug 'rhysd/clever-f.vim'
Plug 'AndrewRadev/splitjoin.vim'
Plug 'theniceboy/pair-maker.vim'
Plug 'theniceboy/vim-move'
" Plug 'jeffkreeftmeijer/vim-numbertoggle'

" For general writing
Plug 'junegunn/goyo.vim'
Plug 'reedes/vim-wordy'
"Plug 'ron89/thesaurus_query.vim'

" Bookmarks
" Plug 'MattesGroeger/vim-bookmarks'

" Find & Replace
Plug 'nvim-lua/plenary.nvim' " nvim-spectre dep
Plug 'nvim-pack/nvim-spectre'

" Documentation
" Plug 'KabbAmine/zeavim.vim' " <LEADER>z to find doc

" Mini Vim-APP
"Plug 'jceb/vim-orgmode'
Plug 'mhinz/vim-startify'

" Vim Applications
Plug 'itchyny/calendar.vim'

"其他视觉增强
" Plug 'ryanoasis/vim-devicons'
"Plug 'wincent/terminus'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'Pocco81/AutoSave.nvim'
Plug 'folke/todo-comments.nvim'
Plug 'numToStr/Comment.nvim'
Plug 'lukas-reineke/indent-blankline.nvim'
Plug 'akinsho/bufferline.nvim'
Plug 'rafamadriz/friendly-snippets'



" Other useful utilities
" Plug 'makerj/vim-pdf'

call plug#end()

set re=0


" ==================== Dress up my vim ====================
set termguicolors " enable true colors support
let $NVIM_TUI_ENABLE_TRUE_COLOR=1
" silent! color deus

hi NonText ctermfg=gray guifg=grey10
"hi SpecialKey ctermfg=blue guifg=grey70


" HACK: 主题  Plug 'EdenEast/nightfox.nvim'
lua << EOF
-- Default options
require('nightfox').setup({
  options = {
    -- Compiled file's destination location
    compile_path = vim.fn.stdpath("cache") .. "/nightfox",
    compile_file_suffix = "_compiled", -- Compiled file suffix
    transparent = false,    -- Disable setting background
    terminal_colors = true, -- Set terminal colors (vim.g.terminal_color_*) used in `:terminal`
    dim_inactive = false,   -- Non focused panes set to alternative background
    styles = {              -- Style to be applied to different syntax groups
      comments = "NONE",    -- Value is any valid attr-list value `:help attr-list`
      conditionals = "NONE",
      constants = "NONE",
      functions = "NONE",
      keywords = "NONE",
      numbers = "NONE",
      operators = "NONE",
      strings = "NONE",
      types = "NONE",
      variables = "NONE",
    },
    inverse = {             -- Inverse highlight for different types
      match_paren = false,
      visual = false,
      search = false,
    },
    modules = {             -- List of various plugins and additional options
      -- ...
    },
  }
})

-- setup must be called before loading
-- NOTE: nightfox dayfox dawnfox duskfox nordfox terafox
-- vim.cmd("colorscheme nightfox")
EOF


" HACK: 主题  Plug 'catppuccin/nvim', {'as': 'catppuccin'}
lua << EOF
local catppuccin = require("catppuccin")
catppuccin.setup(
{
transparent_background = false,
term_colors = false,
styles = {
	comments = "italic",
	conditionals = "italic",
	loops = "NONE",
	functions = "NONE",
	keywords = "NONE",
	strings = "NONE",
	variables = "NONE",
	numbers = "NONE",
	booleans = "NONE",
	properties = "NONE",
	types = "NONE",
	operators = "NONE",
},
integrations = {
	 treesitter = true,
	native_lsp = {
		enabled = true,
		virtual_text = {
			errors = "italic",
			hints = "italic",
			warnings = "italic",
			information = "italic",
		},
		underlines = {
			errors = "underline",
			hints = "underline",
			warnings = "underline",
			information = "underline",
		},
	},
	lsp_trouble = false,
	cmp = true,
	lsp_saga = false,
	gitgutter = false,
	gitsigns = true,
	telescope = true,
	nvimtree = {
		enabled = true,
		show_root = false,
		transparent_panel = false,
	},
	neotree = {
		enabled = false,
		show_root = false,
		transparent_panel = false,
	},
	which_key = false,
	indent_blankline = {
		enabled = true,
		colored_indent_levels = false,
	},
	dashboard = true,
	neogit = false,
	vim_sneak = false,
	fern = false,
	barbar = false,
	bufferline = true,
	markdown = true,
	lightspeed = false,
	ts_rainbow = false,
	hop = false,
	notify = true,
	telekasten = true,
	symbols_outline = true,
}
}
)
-- Lua
-- 如果您想“即时”切换 Catpuccin 风味，您可以使用该:Catppuccin <flavour>命令。
-- vim.g.catppuccin_flavour = "frappe" -- latte, frappe, macchiato, mocha
-- vim.cmd[[colorscheme catppuccin]]
EOF

" HACK: 主题  Plug 'projekt0n/github-nvim-theme'
" lua << EOF
" -- Example config in Lua
" require("github-theme").setup({
"   function_style = "italic",
"   sidebars = {"qf", "vista_kind", "terminal", "packer"},
"
"   -- Change the "hint" color to the "orange" color, and make the "error" color bright red
"   colors = {hint = "orange", error = "#ff0000"},
"
"   -- Overwrite the highlight groups
"   overrides = function(c)
"     return {
"       htmlTag = {fg = c.red, bg = "#282c34", sp = c.hint, style = "underline"},
"       DiagnosticHint = {link = "LspDiagnosticsDefaultHint"},
"       -- this will remove the highlight groups
"       TSField = {},
"     }
"   end
" })
" -- Lua
" require("github-theme").setup({
" comment_style = "NONE",
" keyword_style = "NONE",
" function_style = "NONE",
" variable_style = "NONE"
" -- other config
" })
" -- Lua
" require("github-theme").setup({
" -- HACK: dimmed dark_default dark_colorblind light light_default light_colorblind
" --  theme_style = "dark",
" 	  -- other config
" 		})
" EOF

" HACK: 主题  Plug 'folke/tokyonight.nvim', { 'branch': 'main' }
lua << EOF
-- Example config in Lua  
--NOTE: night storm day
vim.g.tokyonight_style = "storm"
vim.g.tokyonight_italic_functions = false
vim.g.tokyonight_italic_comments=false
vim.g.tokyonight_italic_keywords=false
vim.g.tokyonight_day_brightness=0.3
vim.g.tokyonight_sidebars = { "qf", "vista_kind", "terminal", "packer" }

-- Change the "hint" color to the "orange" color, and make the "error" color bright red
vim.g.tokyonight_colors = { hint = "orange", error = "#ff0000" }

-- Load the colorscheme
vim.cmd[[colorscheme tokyonight]]
EOF
" Vim Script
let g:lightline = {'colorscheme': 'tokyonight'}
" HACK: 主题  Plug 'navarasu/onedark.nvim'
lua << EOF
-- Lua
require('onedark').setup  {
	-- Main options --
--dark, darker, cool, deep, warm, warmer, light
	style = 'dark', -- Default theme style. Choose between 'dark', 'darker', 'cool', 'deep', 'warm', 'warmer' and 'light'
	transparent = false,  -- Show/hide background
	term_colors = true, -- Change terminal color as per the selected theme style
	ending_tildes = false, -- Show the end-of-buffer tildes. By default they are hidden
	cmp_itemkind_reverse = false, -- reverse item kind highlights in cmp menu
	-- toggle theme style ---
	toggle_style_key = '<leader>ts', -- Default keybinding to toggle
	toggle_style_list = {'dark', 'darker', 'cool', 'deep', 'warm', 'warmer', 'light'}, -- List of styles to toggle between

	-- Change code style ---
	-- Options are italic, bold, underline, none
	-- You can configure multiple style with comma seperated, For e.g., keywords = 'italic,bold'
	code_style = {
		comments = 'none',
		keywords = 'none',
		functions = 'none',
		strings = 'none',
		variables = 'none'
		},

	-- Custom Highlights --
	colors = {}, -- Override default colors
	highlights = {}, -- Override highlight groups

	-- Plugins Config --
	diagnostics = {
		darker = true, -- darker colors for diagnostic
		undercurl = true,   -- use undercurl instead of underline for diagnostics
		background = true,    -- use background color for virtual text
		},
	}
-- require('onedark').load()
EOF
" HACK: 主题  Plug 'sonokai'
" let g:airline_theme = 'sonokai'
" let g:sonokai_style =  'default'
" let g:sonokai_better_performance = 1
" " let g:lightline.colorscheme = 'sonokai'
" let g:sonokai_diagnostic_text_highlight=1
" colorscheme sonokai
"
" HACK: Plug 'christianchiarulli/nvcode-color-schemes.vim'
" configure nvcode-color-schemes
" let g:nvcode_termcolors=256
"
" syntax on
" colorscheme nvcode " Or whatever colorscheme you make
"
"
" " checks if your terminal has 24-bit color support
" if (has("termguicolors"))
"     set termguicolors
"     hi LineNr ctermbg=NONE guibg=NONE
" endif
"
" HACK: Plug 'tanvirtin/monokai.nvim' 
lua <<EOF
-- require('monokai').setup {}
-- require('monokai').setup { palette = require('monokai').pro  }
-- require('monokai').setup { palette = require('monokai').soda  }
-- require('monokai').setup { palette = require('monokai').ristretto  }
EOF
" ==================== eleline.vim ====================
let g:airline_powerline_fonts = 0


" ==================== GitGutter ====================
" let g:gitgutter_signs = 0
let g:gitgutter_sign_allow_clobber = 0
let g:gitgutter_map_keys = 0
let g:gitgutter_override_sign_column_highlight = 0
let g:gitgutter_preview_win_floating = 1
let g:gitgutter_sign_added = '▎'
let g:gitgutter_sign_modified = '░'
let g:gitgutter_sign_removed = '▏'
let g:gitgutter_sign_removed_first_line = '▔'
let g:gitgutter_sign_modified_removed = '▒'
nnoremap <LEADER>gf :GitGutterFold<CR>
nnoremap H :GitGutterPreviewHunk<CR>
nnoremap <LEADER>g- :GitGutterPrevHunk<CR>
nnoremap <LEADER>g= :GitGutterNextHunk<CR>


" ==================== coc.nvim ====================
let g:coc_global_extensions = [
	\ 'coc-css',
	\ 'coc-eslint',
	\ 'coc-explorer',
	\ 'coc-gitignore',
	\ 'coc-html',
	\ 'coc-import-cost',
	\ 'coc-json',
	\ 'coc-lists',
	\ 'coc-prettier',
	\ 'coc-pyright',
	\ 'coc-snippets',
	\ 'coc-stylelint',
	\ 'coc-syntax',
	\ 'coc-sumneko-lua',
	\ 'coc-translator',
	\ 'coc-tsserver',
	\ 'coc-vetur',
	\ 'coc-vimlsp',
	\ 'coc-yank']
inoremap <silent><expr> <TAB>
	\ pumvisible() ? "\<C-n>" :
	\ <SID>check_back_space() ? "\<TAB>" :
	\ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
function! s:check_back_space() abort
	let col = col('.') - 1
	return !col || getline('.')[col - 1]  =~# '\s'
endfunction
inoremap <silent><expr> <c-space> coc#refresh()
inoremap <silent><expr> <c-o> coc#refresh()
function! Show_documentation()
	call CocActionAsync('highlight')
	if (index(['vim','help'], &filetype) >= 0)
		execute 'h '.expand('<cword>')
	else
		call CocAction('doHover')
	endif
endfunction
nnoremap <LEADER>h :call Show_documentation()<CR>
" set runtimepath^=~/.config/nvim/coc-extensions/coc-flutter-tools/
" let g:coc_node_args = ['--nolazy', '--inspect-brk=6045']
" let $NVIM_COC_LOG_LEVEL = 'debug'
" let $NVIM_COC_LOG_FILE = '/Users/david/Desktop/log.txt'

nnoremap <silent><nowait> <LEADER>d :CocList diagnostics<cr>
nmap <silent> <LEADER>- <Plug>(coc-diagnostic-prev)
nmap <silent> <LEADER>= <Plug>(coc-diagnostic-next)
nnoremap <c-c> :CocCommand<CR>
" Text Objects
xmap kf <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap kf <Plug>(coc-funcobj-i)
omap af <Plug>(coc-funcobj-a)
xmap kc <Plug>(coc-classobj-i)
omap kc <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)
" Useful commands
nnoremap <silent> <space>y :<C-u>CocList -A --normal yank<cr>
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gD :tab sp<CR><Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
" nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nmap <leader>rn <Plug>(coc-rename)
nmap ee :CocCommand explorer<CR>
" coc-translator
nmap ts <Plug>(coc-translator-p)
" Remap for do codeAction of selected region
function! s:cocActionsOpenFromSelected(type) abort
  execute 'CocCommand actions.open ' . a:type
endfunction
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>aw  <Plug>(coc-codeaction-selected)w
" coctodolist
" nnoremap <leader>tn :CocCommand todolist.create<CR>
" nnoremap <leader>tl :CocList todolist<CR>
" nnoremap <leader>tu :CocCommand todolist.download<CR>:CocCommand todolist.upload<CR>
" coc-tasks
noremap <silent> <leader>ts :CocList tasks<CR>
" coc-snippets
imap <C-l> <Plug>(coc-snippets-expand)
vmap <C-e> <Plug>(coc-snippets-select)
let g:coc_snippet_next = '<c-e>'
let g:coc_snippet_prev = '<c-n>'
imap <C-e> <Plug>(coc-snippets-expand-jump)
autocmd BufRead,BufNewFile tsconfig.json set filetype=jsonc


" ==================== vim-instant-markdown ====================
let g:instant_markdown_slow = 0
let g:instant_markdown_autostart = 0
" let g:instant_markdown_open_to_the_world = 1
" let g:instant_markdown_allow_unsafe_content = 1
" let g:instant_markdown_allow_external_content = 0
" let g:instant_markdown_mathjax = 1
let g:instant_markdown_autoscroll = 1


" ==================== vim-table-mode ====================
noremap <LEADER>tm :TableModeToggle<CR>
"let g:table_mode_disable_mappings = 1
let g:table_mode_cell_text_object_i_map = 'k<Bar>'


" ==================== FZF ====================
let g:fzf_preview_window = 'right:40%'
let g:fzf_commits_log_options = '--graph --color=always --format="%C(auto)%h%d %s %C(black)%C(bold)%cr"'

function! s:list_buffers()
  redir => list
  silent ls
  redir END
  return split(list, "\n")
endfunction

function! s:delete_buffers(lines)
  execute 'bwipeout' join(map(a:lines, {_, line -> split(line)[0]}))
endfunction

command! BD call fzf#run(fzf#wrap({
  \ 'source': s:list_buffers(),
  \ 'sink*': { lines -> s:delete_buffers(lines) },
  \ 'options': '--multi --reverse --bind ctrl-a:select-all+accept'
\ }))

noremap <c-d> :BD<CR>

let g:fzf_layout = { 'window': { 'width': 0.95, 'height': 0.95 } }



" ==================== wildfire ====================
map <c-b> <Plug>(wildfire-quick-select)
let g:wildfire_objects = {
    \ "*" : ["i'", 'i"', "i)", "i]", "i}", "it"],
    \ "html,xml" : ["at", "it"],
\ }


" ==================== Undotree ====================
noremap L :UndotreeToggle<CR>
let g:undotree_DiffAutoOpen = 1
let g:undotree_SetFocusWhenToggle = 1
let g:undotree_ShortIndicators = 1
let g:undotree_WindowLayout = 2
let g:undotree_DiffpanelHeight = 8
let g:undotree_SplitWidth = 24
function g:Undotree_CustomMap()
	nmap <buffer> u <plug>UndotreeNextState
	nmap <buffer> e <plug>UndotreePreviousState
	nmap <buffer> U 5<plug>UndotreeNextState
	nmap <buffer> E 5<plug>UndotreePreviousState
endfunc


" ==================== vim-visual-multi ====================
"let g:VM_theme             = 'iceblue'
"let g:VM_default_mappings = 0
let g:VM_leader                     = {'default': ',', 'visual': ',', 'buffer': ','}
let g:VM_maps                       = {}
let g:VM_custom_motions             = {'n': 'h', 'i': 'l', 'u': 'k', 'e': 'j', 'N': '0', 'I': '$', 'h': 'e'}
let g:VM_maps['i']                  = 'k'
let g:VM_maps['I']                  = 'K'
let g:VM_maps['Find Under']         = '<C-k>'
let g:VM_maps['Find Subword Under'] = '<C-k>'
let g:VM_maps['Find Next']          = ''
let g:VM_maps['Find Prev']          = ''
let g:VM_maps['Remove Region']      = 'q'
let g:VM_maps['Skip Region']        = '<c-n>'
let g:VM_maps["Undo"]               = 'l'
let g:VM_maps["Redo"]               = '<C-r>'


" ==================== nvim-spectre ====================
nnoremap <LEADER>f <cmd>lua require('spectre').open()<CR>
vnoremap <LEADER>f <cmd>lua require('spectre').open_visual()<CR>


" ==================== Bullets.vim ====================
" let g:bullets_set_mappings = 0
let g:bullets_enabled_file_types = [
			\ 'gitcommit',
			\ 'scratch'
			\]


" ==================== fzf-gitignore ====================
noremap <LEADER>gi :FzfGitignore<CR>


" ==================== Ultisnips ====================
" let g:tex_flavor = "latex"
" inoremap <c-n> <nop>
" let g:UltiSnipsExpandTrigger="<c-e>"
" let g:UltiSnipsJumpForwardTrigger="<c-e>"
" let g:UltiSnipsJumpBackwardTrigger="<c-n>"
" let g:UltiSnipsSnippetDirectories = [$HOME.'/.config/nvim/Ultisnips/', $HOME.'/.config/nvim/plugged/vim-snippets/UltiSnips/']
" silent! au BufEnter,BufRead,BufNewFile * silent! unmap <c-r>
" " Solve extreme insert-mode lag on macOS (by disabling autotrigger)
" augroup ultisnips_no_auto_expansion
"     au!
"     au VimEnter * au! UltiSnips_AutoTrigger
" augroup END


" ==================== vim-calendar ====================
"noremap \c :Calendar -position=here<CR>
noremap \\ :Calendar -view=clock -position=here<CR>
let g:calendar_google_calendar = 1
let g:calendar_google_task = 1
augroup calendar-mappings
	autocmd!
	" diamond cursor
	autocmd FileType calendar nmap <buffer> u <Plug>(calendar_up)
	autocmd FileType calendar nmap <buffer> n <Plug>(calendar_left)
	autocmd FileType calendar nmap <buffer> e <Plug>(calendar_down)
	autocmd FileType calendar nmap <buffer> i <Plug>(calendar_right)
	autocmd FileType calendar nmap <buffer> <c-u> <Plug>(calendar_move_up)
	autocmd FileType calendar nmap <buffer> <c-n> <Plug>(calendar_move_left)
	autocmd FileType calendar nmap <buffer> <c-e> <Plug>(calendar_move_down)
	autocmd FileType calendar nmap <buffer> <c-i> <Plug>(calendar_move_right)
	autocmd FileType calendar nmap <buffer> k <Plug>(calendar_start_insert)
	autocmd FileType calendar nmap <buffer> K <Plug>(calendar_start_insert_head)
	" unmap <C-n>, <C-p> for other plugins
	autocmd FileType calendar nunmap <buffer> <C-n>
	autocmd FileType calendar nunmap <buffer> <C-p>
augroup END




" ==================== goyo ====================
map <LEADER>gy :Goyo<CR>


" ==================== jsx ====================
let g:vim_jsx_pretty_colorful_config = 1


" ==================== tabular ====================
vmap ga :Tabularize /


" ==================== vim-after-object ====================
autocmd VimEnter * call after_object#enable('=', ':', '-', '#', ' ')

" ==================== context.vim ====================
"let g:context_add_mappings = 0
"noremap <leader>ct :ContextToggle<CR>


" ==================== suda.vim ====================
cnoreabbrev sudowrite w suda://%
cnoreabbrev sw w suda://%


" ==================== vimspector ====================
let g:vimspector_enable_mappings = 'HUMAN'
function! s:read_template_into_buffer(template)
	" has to be a function to avoid the extra space fzf#run insers otherwise
	execute '0r ~/.config/nvim/sample_vimspector_json/'.a:template
endfunction
command! -bang -nargs=* LoadVimSpectorJsonTemplate call fzf#run({
			\   'source': 'ls -1 ~/.config/nvim/sample_vimspector_json',
			\   'down': 20,
			\   'sink': function('<sid>read_template_into_buffer')
			\ })
" noremap <leader>vs :tabe .vimspector.json<CR>:LoadVimSpectorJsonTemplate<CR>
sign define vimspectorBP text=☛ texthl=Normal
sign define vimspectorBPDisabled text=☞ texthl=Normal
sign define vimspectorPC text=🔶 texthl=SpellBad


" ==================== vim-markdown-toc ====================
"let g:vmt_auto_update_on_save = 0
"let g:vmt_dont_insert_fence = 1
let g:vmt_cycle_list_item_markers = 1
let g:vmt_fence_text = 'TOC'
let g:vmt_fence_closing_text = '/TOC'


" ==================== rnvimr ====================
let g:rnvimr_ex_enable = 1
let g:rnvimr_pick_enable = 1
let g:rnvimr_draw_border = 0
" let g:rnvimr_bw_enable = 1
highlight link RnvimrNormal CursorLine
nnoremap <silent> R :RnvimrToggle<CR><C-\><C-n>:RnvimrResize 0<CR>
let g:rnvimr_action = {
            \ '<C-t>': 'NvimEdit tabedit',
            \ '<C-x>': 'NvimEdit split',
            \ '<C-v>': 'NvimEdit vsplit',
            \ 'gw': 'JumpNvimCwd',
            \ 'yw': 'EmitRangerCwd'
            \ }
let g:rnvimr_layout = { 'relative': 'editor',
            \ 'width': &columns,
            \ 'height': &lines,
            \ 'col': 0,
            \ 'row': 0,
            \ 'style': 'minimal' }
let g:rnvimr_presets = [{'width': 1.0, 'height': 1.0}]


" ==================== vim-subversive ====================
nmap s <plug>(SubversiveSubstitute)
nmap ss <plug>(SubversiveSubstituteLine)


" ==================== vim-illuminate ====================
let g:Illuminate_delay = 750
hi illuminatedWord cterm=undercurl gui=undercurl


" ==================== vim-rooter ====================
let g:rooter_patterns = ['__vim_project_root', '.git/']
let g:rooter_silent_chdir = 1


" ==================== AsyncRun ====================
noremap gp :AsyncRun git push<CR>


" ==================== AsyncTasks ====================
let g:asyncrun_open = 6



" ==================== vim-move ====================
let g:move_key_modifier = 'C'


" ==================== typescript-vim ====================
let g:typescript_ignore_browserwords = 1


" ==================== Agit ====================
nnoremap <LEADER>gl :Agit<CR>
let g:agit_no_default_mappings = 1


" ==================== nvim-treesitter ====================
if g:nvim_plugins_installation_completed == 1
lua <<EOF
require'nvim-treesitter.configs'.setup {
	-- one of "all", "language", or a list of languages
	ensure_installed = {
		"typescript", 
		"javascript", 
		"java",
		"html",
		"lua",
		"css",
		"json",
		"python",
		"vue",
	},
  highlight = { enable = true, disable = { "vim" } },
	textobjects = {
			select = {
				enable = true,
				keymaps = {
					["af"] = "@function.outer",
					["if"] = "@function.inner",
					["ac"] = "@class.outer",
					["ic"] = "@class.inner",
				},
			},
			move = {
				enable = true,
				set_jumps = true, -- whether to set jumps in the jumplist
				goto_next_start = {
					["]["] = "@function.outer",
					["]m"] = "@class.outer",
				},
				goto_next_end = {
					["]]"] = "@function.outer",
					["]M"] = "@class.outer",
				},
				goto_previous_start = {
					["[["] = "@function.outer",
					["[m"] = "@class.outer",
				},
				goto_previous_end = {
					["[]"] = "@function.outer",
					["[M"] = "@class.outer",
				},
			},
		},
		rainbow = {
			enable = true,
			extended_mode = true, -- Highlight also non-parentheses delimiters, boolean or table: lang -> boolean
			max_file_lines = 1000, -- Do not enable for files with more than 1000 lines, int
		},
		context_commentstring = { enable = true, enable_autocmd = false },
		matchup = { enable = true },
}
require("nvim-ts-autotag").setup({
		filetypes = {
			"html",
			"xml",
			"javascript",
			"typescriptreact",
			"javascriptreact",
			"vue",
		},
	})
EOF
" au BufWrite *.html :Autoformat
" au BufWrite *.css :Autoformat
" au BufWrite *.js :Autoformat
endif


" ==================== nvim-scrollbar ====================
if g:nvim_plugins_installation_completed == 1
lua <<EOF
require("scrollbar").setup()
require("scrollbar.handlers.search").setup()
require("scrollbar").setup({
	show = true,
	handle = {
		text = " ",
		color = "#ae5aab",
		hide_if_all_visible = true,
	},
	marks = {
		Search = { color = "#76EEC6" },
		Misc = { color = "purple" },
	},
	handlers = {
		diagnostic = true,
		search = true,
	},
})
EOF
endif


" ==================== nvim-hlslens ====================
noremap <silent> = <Cmd>execute('normal! ' . v:count1 . 'n')<CR>
            \<Cmd>lua require('hlslens').start()<CR>
noremap <silent> - <Cmd>execute('normal! ' . v:count1 . 'N')<CR>
            \<Cmd>lua require('hlslens').start()<CR>
noremap * *<Cmd>lua require('hlslens').start()<CR>
noremap # #<Cmd>lua require('hlslens').start()<CR>
noremap g* g*<Cmd>lua require('hlslens').start()<CR>
noremap g# g#<Cmd>lua require('hlslens').start()<CR>


" ==================== fzf-lua ====================
noremap <silent> <C-p> :FzfLua files<CR>
noremap <silent> <C-f> :Rg<CR>
noremap <silent> <C-h> :FzfLua oldfiles cwd=~<CR>
noremap <silent> <C-q> :FzfLua builtin<CR>
noremap <silent> <C-t> :FzfLua lines<CR>
" noremap <silent> <C-x> :FzfLua resume<CR>
noremap <silent> z= :FzfLua spell_suggest<CR>
noremap <silent> <C-w> :FzfLua buffers<CR>
noremap <leader>; :History:<CR>
augroup fzf_commands
  autocmd!
  autocmd FileType fzf tnoremap <silent> <buffer> <c-j> <down>
  autocmd FileType fzf tnoremap <silent> <buffer> <c-k> <up>
augroup end
if g:nvim_plugins_installation_completed == 1
lua <<EOF
require'fzf-lua'.setup {
	global_resume = true,
	global_resume_query = true,
	winopts = {
		height = 0.95,
		width = 0.95,
		preview = {
			scrollbar = 'float',
		},
		fullscreen = false,
		vertical       = 'down:45%',      -- up|down:size
		horizontal     = 'right:60%',     -- right|left:size
		hidden         = 'nohidden',
		title = true,
	},
	keymap = {
		-- These override the default tables completely
		-- no need to set to `false` to disable a bind
		-- delete or modify is sufficient
		builtin = {
			["<c-f>"]      = "toggle-fullscreen",
			["<c-r>"]      = "toggle-preview-wrap",
			["<c-p>"]      = "toggle-preview",
			["<c-y>"]      = "preview-page-down",
			["<c-l>"]      = "preview-page-up",
			["<S-left>"]   = "preview-page-reset",
		},
		fzf = {
			["esc"]        = "abort",
			["ctrl-h"]     = "unix-line-discard",
			["ctrl-k"]     = "half-page-down",
			["ctrl-b"]     = "half-page-up",
			["ctrl-n"]     = "beginning-of-line",
			["ctrl-a"]     = "end-of-line",
			["alt-a"]      = "toggle-all",
			["f3"]         = "toggle-preview-wrap",
			["f4"]         = "toggle-preview",
			["shift-down"] = "preview-page-down",
			["shift-up"]   = "preview-page-up",
			["ctrl-e"]     = "down",
			["ctrl-u"]     = "up",
		},
	},
  previewers = {
    cat = {
      cmd             = "cat",
      args            = "--number",
    },
    bat = {
      cmd             = "bat",
      args            = "--style=numbers,changes --color always",
      theme           = 'Coldark-Dark', -- bat preview theme (bat --list-themes)
      config          = nil,            -- nil uses $BAT_CONFIG_PATH
    },
    head = {
      cmd             = "head",
      args            = nil,
    },
    git_diff = {
      cmd_deleted     = "git diff --color HEAD --",
      cmd_modified    = "git diff --color HEAD",
      cmd_untracked   = "git diff --color --no-index /dev/null",
      -- pager        = "delta",      -- if you have `delta` installed
    },
    man = {
      cmd             = "man -c %s | col -bx",
    },
    builtin = {
      syntax          = true,         -- preview syntax highlight?
      syntax_limit_l  = 0,            -- syntax limit (lines), 0=nolimit
      syntax_limit_b  = 1024*1024,    -- syntax limit (bytes), 0=nolimit
    },
  },
  files = {
    -- previewer      = "bat",          -- uncomment to override previewer
                                        -- (name from 'previewers' table)
                                        -- set to 'false' to disable
    prompt            = 'Files❯ ',
    multiprocess      = true,           -- run command in a separate process
    git_icons         = true,           -- show git icons?
    file_icons        = true,           -- show file icons?
    color_icons       = true,           -- colorize file|git icons
    -- executed command priority is 'cmd' (if exists)
    -- otherwise auto-detect prioritizes `fd`:`rg`:`find`
    -- default options are controlled by 'fd|rg|find|_opts'
    -- NOTE: 'find -printf' requires GNU find
    -- cmd            = "find . -type f -printf '%P\n'",
    find_opts         = [[-type f -not -path '*/\.git/*' -printf '%P\n']],
    rg_opts           = "--color=never --files --hidden --follow -g '!.git'",
    fd_opts           = "--color=never --type f --hidden --follow --exclude .git",
  },
  buffers = {
    prompt            = 'Buffers❯ ',
    file_icons        = true,         -- show file icons?
    color_icons       = true,         -- colorize file|git icons
    sort_lastused     = true,         -- sort buffers() by last used
  },
}
EOF
endif


" ==================== lazygit.nvim ====================
noremap <c-g> :LazyGit<CR>
let g:lazygit_floating_window_winblend = 0 " transparency of floating window
let g:lazygit_floating_window_scaling_factor = 1.0 " scaling factor for floating window
let g:lazygit_floating_window_corner_chars = ['╭', '╮', '╰', '╯'] " customize lazygit popup window corner characters
let g:lazygit_use_neovim_remote = 1 " for neovim-remote support


" ==================== lightspeed ====================
nmap <expr> f reg_recording() . reg_executing() == "" ? "<Plug>Lightspeed_f" : "f"
nmap <expr> F reg_recording() . reg_executing() == "" ? "<Plug>Lightspeed_F" : "F"
nmap <expr> t reg_recording() . reg_executing() == "" ? "<Plug>Lightspeed_t" : "t"
nmap <expr> T reg_recording() . reg_executing() == "" ? "<Plug>Lightspeed_T" : "T"
" autocmd BufEnter * map <buffer> <nowait> { <Plug>Lightspeed_S
map <nowait> " <Plug>Lightspeed_omni_s
if g:nvim_plugins_installation_completed == 1
lua <<EOF
require'lightspeed'.setup {
  ignore_case = true,
  -- exit_after_idle_msecs = { unlabeled = 1000, labeled = nil },
  -- --- s/x ---
  -- jump_to_unique_chars = { safety_timeout = 400 },
  -- match_only_the_start_of_same_char_seqs = true,
  force_beacons_into_match_width = true,
  -- -- Display characters in a custom way in the highlighted matches.
  -- substitute_chars = { ['\r'] = '¬', },
  -- -- Leaving the appropriate list empty effectively disables "smart" mode,
  -- -- and forces auto-jump to be on or off.
  safe_labels= {"a", "r", "s", "t", "n", "e", "i", "o", "w", "f", "u", "y", "x", 'c', "v", "k", "m"},
  -- labels = {},
  special_keys = {
    next_match_group = '<space>',
    prev_match_group = '<tab>',
  },
}
EOF
endif

" ==================== nvim-web-devicons ====================
lua << EOF
require'nvim-web-devicons'.setup {}
require("nvim-web-devicons").set_default_icon('', '#6d8086')
require("nvim-web-devicons").set_icon {
	zsh = {
		icon = "",
		color = "#428850",
		cterm_color = "65",
		name = "Zsh"
		},
	c = {
		icon = '',
		name = 'c',
		},
	css = {
		icon = '',
		name = 'css',
		},
	deb = {
		icon = '',
		name = 'deb',
		},
	Dockerfile = {
		icon = '',
		name = 'Dockerfile',
		},
	html = {
		icon = '',
		name = 'html',
		},
	jpeg = {
		icon = '',
		name = 'jpeg',
		},
	jpg = {
		icon = '',
		name = 'jpg',
		},
	js = {
		icon = '',
		name = 'js',
		},
	kt = {
		icon = '󱈙',
		name = 'kt',
		},
	less = {
		icon="",
		name="less"
		},
	lock = {
		icon = '',
		name = 'lock',
		},
	lua = {
		icon = '',
		name = 'lua',
		},
	md = {
		icon = "",
		name = "markdown"
		},
	mp3 = {
		icon = '',
		name = 'mp3',
		},
	mp4 = {
		icon = '',
		name = 'mp4',
		},
	out = {
		icon = '',
		name = 'out',
		},
	png = {
		icon = '',
		name = 'png',
		},
	py = {
		icon = '',
		name = 'py',
		},
	['robots.txt'] = {
		icon = 'ﮧ',
		name = 'robots',
		},
	toml = {
		icon = '',
		name = 'toml',
		},
	ts = {
		icon = 'ﯤ',
		name = 'ts',
		},
	ttf = {
		icon = '',
		name = 'TrueTypeFont',
		},
	rb = {
		icon = '',
		name = 'rb',
		},
	rpm = {
		icon = '',
		name = 'rpm',
		},
	vue = {
		icon = '﵂',
		name = 'vue',
		},
	vim = {
		icon = '',
		name='vim',
		},
	woff = {
		icon = '',
		name = 'WebOpenFontFormat',
		},
	woff2 = {
		icon = '',
		name = 'WebOpenFontFormat2',
		},
	xz = {
		icon = '',
		name = 'xz',
		},
	zip = {
		icon = '',
		name = 'zip',
		},
}
EOF

" ==================== AutoSave.nvim ====================
lua << EOF
-- https://github.com/Pocco81/AutoSave.nvim
require("autosave").setup(
{
	enabled = true,
	-- 触发自动保存的事件（退出插入模式或者普通模式下文本内容发生改变）
	events = {"InsertLeave", "TextChanged"},
	-- 自动保存时的提示信息
	execution_message = "",
	conditions = {
		exists = true,
		-- 忽略自动保存的文件名字或文件类型
		filename_is_not = {},
		filetype_is_not = {},
		modifiable = true

		},
	-- 保存时写入全部的 Buffer
	write_all_buffers = true,
	on_off_commands = false,
	clean_command_line_interval = 0,
	debounce_delay = 135
})
EOF

" ==================== todo-comments ====================
lua << EOF
  -- https://github.com/folke/todo-comments.nvim
require("todo-comments").setup(
{
	keywords = {
		-- alt ： 别名
		FIX = {
			icon = " ",
			color = "#DC2626",
			alt = {"FIXME", "BUG", "FIXIT", "ISSUE", "!"}
			},
		TODO = {icon = " ", color = "#54FF9F"},
		HACK = {icon = " ", color = "#FF00FF"},
		WARN = {icon = " ", color = "#FBBF24", alt = {"WARNING", "XXX"}},
		PERF = {icon = " ", color = "#FF8247", alt = {"OPTIM", "PERFORMANCE", "OPTIMIZE"}},
		NOTE = {icon = "", color = "#C0FF3E", alt = {"INFO"}}
	}
})
EOF

" ==================== Terminal Colors ====================
lua << EOF
require('Comment').setup(
{
	toggler = {
		-- 切换行注释
		line = "gcc",
		-- 切换块注释
		block = "gCC"
		},
	opleader = {
		-- 可视模式下的行注释
		line = "gc",
		-- 可视模式下的块注释
		block = "gC"
		},
	extra = {
		-- 在当前行上方新增行注释
		above = "gcO",
		-- 在当前行下方新增行注释
		below = "gco",
		-- 在当前行行尾新增行注释
		eol = "gcA"
		}
})
EOF

" ==================== indent-blankline.nvim ====================
lua << EOF
-- vim.opt.list = true
-- vim.opt.listchars:append("space:⋅")
-- vim.opt.listchars:append("eol:↴")
require("indent_blankline").setup {
	space_char_blankline = " ",
	show_current_context = true,
	show_current_context_start = true,
	}
EOF

" ==================== blankline.nvim ====================
lua << EOF
require('bufferline').setup {}
EOF

" ==================== Terminal Colors ====================
let g:terminal_color_0  = '#000000'
let g:terminal_color_1  = '#FF5555'
let g:terminal_color_2  = '#50FA7B'
let g:terminal_color_3  = '#F1FA8C'
let g:terminal_color_4  = '#BD93F9'
let g:terminal_color_5  = '#FF79C6'
let g:terminal_color_6  = '#8BE9FD'
let g:terminal_color_7  = '#BFBFBF'
let g:terminal_color_8  = '#4D4D4D'
let g:terminal_color_9  = '#FF6E67'
let g:terminal_color_10 = '#5AF78E'
let g:terminal_color_11 = '#F4F99D'
let g:terminal_color_12 = '#CAA9FA'
let g:terminal_color_13 = '#FF92D0'
let g:terminal_color_14 = '#9AEDFE'


" ==================== Necessary Commands to Execute ====================
exec "nohlsearch"


" Open the _machine_specific.vim file if it has just been created
if has_machine_specific_file == 0
	exec "e ~/.config/nvim/_machine_specific.vim"
endif

