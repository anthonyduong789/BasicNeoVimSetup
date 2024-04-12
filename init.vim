:set number
:set relativenumber
:set autoindent
:set tabstop=4
:set shiftwidth=4
:set smarttab
:set softtabstop=4
:set mouse=a



call plug#begin()

Plug 'http://github.com/tpope/vim-surround' " Surrounding ysw)
Plug 'https://github.com/preservim/nerdtree' " NerdTree
Plug 'https://github.com/tpope/vim-commentary' " For Commenting gcc & gc
Plug 'https://github.com/vim-airline/vim-airline' " Status bar
Plug 'https://github.com/lifepillar/pgsql.vim' " PSQL Pluging needs :SQLSetType pgsql.vim
Plug 'https://github.com/ap/vim-css-color' " CSS Color Preview
Plug 'https://github.com/rafi/awesome-vim-colorschemes' " Retro Scheme
Plug 'https://github.com/neoclide/coc.nvim'  " Auto Completion
Plug 'https://github.com/ryanoasis/vim-devicons' " Developer Icons
Plug 'https://github.com/tc50cal/vim-terminal' " Vim Terminal
Plug 'https://github.com/preservim/tagbar' " Tagbar for code navigation
Plug 'https://github.com/terryma/vim-multiple-cursors' " CTRL + N for multiple cursors
Plug 'easymotion/vim-easymotion' " Easy Motion for moving around the file
Plug 'aereal/vim-colors-japanesque' " Japanesque Theme
Plug 'rebelot/kanagawa.nvim' " Kanagawa Theme
Plug 'vim-airline/vim-airline-themes' " Airline Themes to change the bottom bar
" Plug 'github/copilot.vim' " Copilot for code suggestions
Plug 'nvim-lua/plenary.nvim' " Plenary for Telescope
Plug 'nvim-telescope/telescope.nvim' " Telescope for file search and navigation
Plug 'craftzdog/solarized-osaka.nvim' " Solarized Osaka Theme
Plug 'sbdchd/neoformat' " For formatting code
Plug 'Exafunction/codeium.vim', { 'branch': 'main' } " Codeium Theme
set encoding=UTF-8

autocmd BufWritePre *.js Neoformat
call plug#end()

" applies formatting to the current buffer on save
" Key binding for manual formatting
nnoremap <leader>p :CocCommand<CRSub>
nnoremap <C-f> :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-l> :call CocActionAsync('jumpDefinition')<CR>

nmap <C-z> :TagbarToggle<CR>

:set completeopt-=preview " For No Previews


let g:NERDTreeDirArrowExpandable="+"
let g:NERDTreeDirArrowCollapsible="~"

" --- Just Some Notes ---
 " :PlugClean :PlugInstall :UpdateRemotePlugins

 " :CocInstall coc-python
 " :CocInstall coc-clangd
 " :CocInstall coc-snippets
 " :CocCommand snippets.edit... FOR EACH FILE TYPE

" air-line
let g:airline_powerline_fonts = 1

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

" airline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''
let mapleader = " "


" Map 'J' to 'Easymotion-w' for moving to words after the cursor
map J <Plug>(easymotion-w)
" Map 'K' to 'Easymotion-b' for moving to words before the cursor
map K <Plug>(easymotion-b)
nmap s <Plug>(easymotion-s)
" Use Tab for accepting copilot suggestion
imap <silent><script><expr> <Tab> copilot#Accept("\<Tab>")
let g:copilot_no_tab_map = v:true



inoremap <expr> <Enter> pumvisible() ? coc#_select_confirm() : "<Enter>"
" colorscheme jellybeans
" colorscheme deus
" Set the color scheme
colorscheme solarized-osaka

" Enable transparent background
let g:solarized_osaka_transparent_background = 1

" Set terminal colors
let g:solarized_osaka_terminal_colors = 1

" Unfortunately, detailed styling (like making comments italic) and
" other specific configurations provided in your Lua example cannot
" be directly set in Vimscript if they require calling the setup function
" of a Lua plugin.



" hi Normal guibg=#010101
hi Normal ctermbg=none
:highlight LineNr ctermfg=white
" hi LineNr  guifg=#505050   guibg=Black
" Set leader key to space (optional)

" Map `leader key + E` to open Netrw in the current window
nmap <leader>e :Ex<CR>
nnoremap <leader>q :q<CR>
nnoremap <leader>w :w<CR>
noremap <leader>s :split<CR>
noremap <leader>vs :vsplit<CR>

" Map `leader key + F` to open Telescope find_files
nnoremap <leader>ls <cmd>Telescope find_files<cr>
" Open a new tab and then call Telescope live_grep
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
" Open a new tab and then call Telescope find_files
noremap <leader>nt :tabnew<CR>
nnoremap <leader>tn :tabnew<CR>:lua require('telescope.builtin').find_files()<CR>
nnoremap <leader>ff :lua require('telescope.builtin').find_files({ cwd = vim.fn.expand('~') })<CR>
nnoremap <leader>fh <cmd>lua require('telescope.builtin').help_tags()<cr>
nnoremap <leader>fb <cmd>lua require('telescope.builtin').buffers()<cr>
" Tab Navigation
" Open a new tab and find a file
" Go to the next tab
nnoremap L :tabnext<CR>
" Go to the previous tab
nnoremap H :tabprev<CR>
set clipboard+=unnamedplus

