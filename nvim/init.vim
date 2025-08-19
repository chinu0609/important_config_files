" General Settings
set number
set relativenumber
set autoindent
set tabstop=4
set shiftwidth=4
set smarttab
set softtabstop=4
set mouse=a
set clipboard=unnamed
let mapleader=','

" Python Path for CoC
let g:coc_user_config = {
      \ 'python.pythonPath': substitute(system('which python3'), '\n', '', '')
      \ }

" Plugin Manager
call plug#begin()

" Core Plugins
Plug 'catppuccin/nvim', { 'as': 'catppuccin' }
Plug 'esensar/nvim-dev-container'
Plug 'tpope/vim-surround' " Surrounding ysw)
Plug 'preservim/nerdtree' " NerdTree
Plug 'tpope/vim-commentary' " Commenting gcc & gc
Plug 'vim-airline/vim-airline' " Status bar
Plug 'lifepillar/pgsql.vim' " PSQL Plugin
Plug 'ap/vim-css-color' " CSS Color Preview
Plug 'rafi/awesome-vim-colorschemes' " Retro Scheme
Plug 'neoclide/coc.nvim' " Auto Completion
Plug 'ryanoasis/vim-devicons' " Developer Icons
Plug 'tc50cal/vim-terminal' " Vim Terminal
Plug 'preservim/tagbar' " Tagbar for code navigation
Plug 'terryma/vim-multiple-cursors' " CTRL + N for multiple cursors
Plug 'rebelot/kanagawa.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'olivercederborg/poimandres.nvim'
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.8' }
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'EdenEast/nightfox.nvim'
Plug 'shaunsingh/nord.nvim'
Plug 'yuratomo/w3m.vim'
Plug 'jpmcb/nvim-llama'
Plug 'Exafunction/codeium.vim', { 'branch': 'main' }
Plug 'stevearc/dressing.nvim'
Plug 'MunifTanjim/nui.nvim'
Plug 'MeanderingProgrammer/render-markdown.nvim'

" Optional Dependencies
Plug 'hrsh7th/nvim-cmp'
Plug 'nvim-tree/nvim-web-devicons' " or Plug 'echasnovski/mini.icons'
Plug 'HakonHarnes/img-clip.nvim'
Plug 'zbirenbaum/copilot.lua'
Plug 'MunifTanjim/nui.nvim'
Plug 'VonHeikemen/fine-cmdline.nvim'
" Avante.nvim
Plug 'yetone/avante.nvim', { 'branch': 'main', 'do': 'make' }

call plug#end()

lua << EOF
require('avante').setup()
EOF

" UI Settings
set encoding=UTF-8
let g:NERDTreeDirArrowExpandable='+'
let g:NERDTreeDirArrowCollapsible='~'
" Key Mappings
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-l> :call CocActionAsync('jumpDefinition')<CR>
nnoremap <C-f> :Telescope find_files<CR>
nnoremap : <cmd>FineCmdline<CR>
noremap <C-a> :codeium#Accept()
tnoremap <Esc> <C-\><C-n>
map <Leader>c :terminal<CR>
nmap <F8> :TagbarToggle<CR>
vnoremap <Leader>y "+y<CR>
map <Leader>p "+p<CR>
map <Leader>t gt<CR>

lua require("devcontainer").setup{}
" Disable preview for completion
set completeopt-=preview

" Colorscheme
colorscheme gruvbox 

" Airline Configuration
let g:airline_powerline_fonts = 1
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''

" Inoremap for completion
inoremap <expr> <C-Tab> pumvisible() ? coc#_select_confirm() : "<C-Tab>"
" Notes & Commands
" :PlugClean :PlugInstall :UpdateRemotePlugins
" :CocInstall coc-python
" :CocInstall coc-clangd
" :CocInstall coc-snippets
" :CocCommand snippets.edit... FOR EACH FILE TYPE
