filetype on

syntax enable
set relativenumber
set number
set termguicolors
filetype indent on
filetype plugin indent on
set nowrap
let mapleader=","
let maplocalleader = "\\"
nnoremap <leader>sv :source ~/.vimrc<cr>
nnoremap <leader>ev :vsplit ~/.vimrc<cr>

"split navigations
"nnoremap <C-S> <C-W><C-J>
"nnoremap <C-Q> <C-W><C-K>
"nnoremap <C-D> <C-W><C-L>
"nnoremap <C-A> <C-W><C-H>
"
set hidden
set history=100

" highlight search
set hlsearch
" highlight all pattern matches WHILE typing the pattern
set incsearch

"code folding
set foldmethod=indent
set foldlevel=99
" max no of chars in a line
setlocal textwidth=79

" NerdTree like structure
"let g:netrw_banner = 0
"let g:netrw_liststyle = 3
"let g:netrw_browse_split = 4
"let g:netrw_altv = 1
"let g:netrw_winsize = 15
"augroup ProjectDrawer
"  autocmd!
 " autocmd VimEnter * :Vexplore
"augroup END
set rtp+=~/.vim/bundle/Vundle.vim

" Plugins
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'neoclide/coc.nvim'
Plugin 'jiangmiao/auto-pairs'
"Plugin 'sjl/badwolf'
"Plugin 'joshdick/onedark.vim'
Plugin 'junegunn/fzf'
Plugin 'junegunn/fzf.vim'
Plugin 'itchyny/lightline.vim'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'preservim/nerdtree'
Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'
Plugin 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install'  }
Plugin 'sainnhe/sonokai'
Plugin 'Guzzii/python-syntax'
Plugin 'norcalli/nvim-colorizer.lua'
" latex plugins
Plugin 'lervag/vimtex'

call vundle#end()
colorscheme sonokai
" Start NERDTree and leave the cursor in it.
autocmd VimEnter * NERDTree

lua require'colorizer'.setup()
" NerdTree mappings
nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>
" Exit Vim if NERDTree is the only window left.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() |
    \ quit | endif

" few vimtex settings
" Viewer options: One may configure the viewer either by specifying a built-in
" viewer method:
" let g:vimtex_view_method = 'okular'

" Or with a generic interface:
let g:vimtex_view_general_viewer = 'okular'
let g:vimtex_view_general_options = '--unique file:@pdf\#src:@line@tex'
"let g:vimtex_compiler_method = 'latexrun'

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>":
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()

inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

nnoremap <silent> <leader>f :FZF<cr>
nnoremap <silent> <leader>F :FZF ~<cr>
nnoremap <silent> <localleader>b :Buffers <cr>

" <Ctrl-l> redraws the screen and removes any search highlighting.
nnoremap <silent> <leader>l :nohl<CR><C-l>

" delete the current line and paste it below the line we are at
nnoremap ~ ddp
" delete the current line and paste it above the line we are at
nnoremap _ ddkP
" delete a line in insert mode
inoremap <c-d> <esc>ddi
" convert current word under cursor to CAPS in insert mode
inoremap <c-u> <esc>viwUi
" convert current word under cursor to CAPS in normal mode
nnoremap <c-u> viwU
" undo in insert mode
"inoremap <c-z>  <esc>ui
inoremap jk <esc>
" save in insert and normal mode
nnoremap zz :update<cr>
inoremap zz <Esc>:update<cr>gi
