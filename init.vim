set number
set relativenumber
set autoindent
set tabstop=4
set shiftwidth=4
set smarttab
set softtabstop=4
set mouse=a
set scrolloff=10
" set spell
" set spelllang=en_us
set confirm
" set guicursor=i:block
set cursorline
call plug#begin()
set splitbelow
" set showcmd
set splitright
set list
set listchars=tab:>-,trail:·

syntax on



" disable key bindings for arrow keys for movement
nnoremap <Up> <Nop>
nnoremap <Down> <Nop>
nnoremap <Left> <Nop>
nnoremap <Right> <Nop>


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
" Plug 'justinmk/vim-sneak'
Plug 'https://github.com/ggandor/leap.nvim.git'
call plug#end()

set encoding=UTF-8

lua require('leap').create_default_mappings()
" --- Just Some Notes ---
 " :PlugClean :PlugInstall :UpdateRemotePlugins

 " :CocInstall coc-python
 " :CocInstall coc-clangd
 " :CocInstall coc-snippets
 " :CocCommand snippets.edit... FOR EACH FILE TYPE
" air-line
let g:airline_powerline_fonts = 1
" let g:airline#extensions#tabline#enabled = 1
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
" let g:airline_statusline_ontop=1

" Map 'J' to 'Easymotion-w' for moving to words after the cursor
map J <Plug>(easymotion-w)
" Map 'K' to 'Easymotion-b' for moving to words before the cursor
map K <Plug>(easymotion-b)
" nmap s <Plug>(easymotion-s)
" Use Tab for accepting copilot suggestion
" imap <silent><script><expr> <Tab> copilot#Accept("\<Tab>")
" let g:copilot_no_tab_map = v:true

let g:codeium_disable_bindings = 1


inoremap <expr> <Enter> pumvisible() ? coc#_select_confirm() : "<Enter>"
imap <script><silent><nowait><expr> <Tab> codeium#Accept()
imap <S-Right>   <Cmd>call codeium#CycleCompletions(1)<CR>
imap <S-Left>   <Cmd>call codeium#CycleCompletions(-1)<CR>
imap <C-Left>   <Cmd>call codeium#Clear()<CR>
imap <C-Right>  <Cmd>call codeium#Complete()<CR> 

" codeium default settings
" Clear current suggestion	codeium#Clear()	<C-]>
" Next suggestion	codeium#CycleCompletions(1)	<M-]>
" Previous suggestion	codeium#CycleCompletions(-1)	<M-[>
" Insert suggestion	codeium#Accept()	<Tab>
" Manually trigger suggestion	codeium#Complete()	<M-Bslash>








" colorscheme jellybeans
colorscheme deus
" Set the color scheme
" colorscheme solarized-osaka
" colorscheme default
" Enable transparent background
" let g:solarized_osaka_transparent_background = 1

" Set terminal colors
" let g:solarized_osaka_terminal_colors = 1

" Unfortunately, detailed styling (like making comments italic) and
" other specific configurations provided in your Lua example cannot
" be directly set in Vimscript if they require calling the setup function
" of a Lua plugin.



" hi Normal guibg=#010101
" hi Normal ctermbg=none
" :highlight LineNr ctermfg=white
" hi LineNr guifg=#f3ff17
highlight LineNr ctermfg=yellow
" set cursorline
" highlight CursorLine cterm=NONE ctermbg=LightYellow ctermfg=NONE

" add this to top to change background of the 
" guibg=Black
" Set leader key to space (optional)

" Map `leader key + E` to open Netrw in the current window
nmap <leader>e :Ex<CR>
nnoremap <leader>q :q<CR>
nnoremap <leader>w :w<CR>
noremap <leader>s :split<CR>
noremap <leader>vs :vsplit<CR>
" Map `leader key + F` to open Telescope find_files
" nnoremap <leader>ls <cmd>Telescope find_files<cr>
" Open a new tab and then call Telescope live_grep
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
" Open a new tab and then call Telescope find_files
noremap <leader>nt :tabnew<CR>
" nnoremap <leader>tn :tabnew<CR>:lua require('telescope.builtin').find_files()<CR>
nnoremap <leader>ff :lua require('telescope.builtin').find_files({ cwd = vim.fn.expand('~') })<CR>
nnoremap <leader>fh <cmd>lua require('telescope.builtin').help_tags()<cr>
nnoremap <leader>fb <cmd>lua require('telescope.builtin').buffers()<cr>


nnoremap <C-z> :TagbarToggle<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <Leader>t :NERDTreeFind<CR>
" Map 'f' to Vim-Sneak's sneak functionality
" Map 'f' to Vim-Sneak's forward single-character sneak
" nmap f <Plug>Sneak_f
" Map 'F' to Vim-Sneak's backward single-character sneak
" nmap F <Plug>Sneak_F
" Map 't' to Vim-Sneak's forward single-character sneak up to the target
" nmap t <Plug>Sneak_t
" Map 'T' to Vim-Sneak's backward single-character sneak up to the target
" nmap T <Plug>Sneak_T
" Tab Navigation
" Open a new tab and find a file
" Go to the next tab
nnoremap L :tabnext<CR>
" Go to the previous tab
nnoremap H :tabprev<CR>
" set clipboard+=unnamedplus
" Set cursor shape in different modes


function! BrowseCurrentFileDirectory()
    " Get the directory of the current file
    let current_file_dir = expand('%:p:h')
    " Launch Telescope find_files at this directory
    execute 'Telescope find_files cwd=' . current_file_dir
endfunction
nnoremap <Leader>fd :call BrowseCurrentFileDirectory()<CR>


" automatically saves folds/ how you left the file in view
" autocmd BufWinLeave *.* mkview
" autocmd BufWinEnter *.* silent loadview
" stored in the .local/share/nvim/view

nnoremap <Leader>ls :call BrowseCurrentFileDirectory()<CR>


" Enable coc.nvim
" :call coc#util#install()

" Configuration for Python
" autocmd FileType python setl formatexpr=CocAction('formatSelected')
" let g:coc_global_extensions = ['coc-snippets', 'coc-pyright', 'coc-tsserver']


" Use <C-l> for trigger snippet expand.
imap <C-l> <Plug>(coc-snippets-expand)

" Use <C-j> for select text for visual placeholder of snippet.
vmap <C-j> <Plug>(coc-snippets-select)

" Use <C-j> for jump to next placeholder, it's default of coc.nvim
let g:coc_snippet_next = '<c-j>'

" Use <C-k> for jump to previous placeholder, it's default of coc.nvim
let g:coc_snippet_prev = '<c-k>'

" Use <C-j> for both expand and jump (make expand higher priority.)
imap <C-j> <Plug>(coc-snippets-expand-jump)

" Use <leader>x for convert visual selected code to snippet
xmap <leader>x  <Plug>(coc-convert-snippet)

" nnoremap <leader>gd :CocCommand workspace.jumToDefinition<CR>




" Type

" s{char}<space> to jump to a character before the end of the line.
" s<space><space> to jump to an empty line (or any EOL position if Visual mode or virtualedit allows it)
" s<enter> to repeat the last search.
" s{char}<enter> to jump to the first {char}{?} pair right away.
" s<enter><enter>... or s{char}<enter><enter>... to traverse through the matches.

