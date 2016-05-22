set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
call vundle#end()            " required
filetype plugin indent on    " required

Bundle 'airblade/vim-gitgutter' 
Bundle 'bling/vim-airline' 
Bundle 'ervandew/supertab'
Bundle 'fatih/vim-go'
Bundle 'godlygeek/tabular'
Bundle 'honza/vim-snippets'
Bundle 'kien/ctrlp.vim' 
Bundle 'lokaltog/vim-easymotion' 
Bundle 'majutsushi/tagbar'  
Bundle 'scrooloose/nerdcommenter' 
Bundle 'scrooloose/nerdtree' 
Bundle 'terryma/vim-multiple-cursors'
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-repeat'
Bundle 'tpope/vim-surround'
Bundle 'raimondi/delimitmate'
" Bundle 'valloric/youcompleteme'


" Themes
Bundle 'altercation/vim-colors-solarized'
Bundle 'nanotech/jellybeans.vim'

" Appreance
set background=dark
" colorscheme solarized
" let g:solarized_termcolors=256
colorscheme jellybeans

" Base settings
syntax on
set mouse=n
" set ttymouse=xterm2
set nowrap
set cursorline
set cursorcolumn
set ruler
set vb
let mapleader=';'
set spell spelllang=en_us
set number
set splitbelow
set splitright
set ignorecase
set history=50
set showcmd
set incsearch
set hlsearch

" Basic mappings
nnoremap <C-c> <Esc>
nnoremap <C-j> <C-W><C-J>
nnoremap <C-k> <C-W><C-K>
nnoremap <C-l> <C-W><C-L>
nnoremap <C-h> <C-W><C-H>
nnoremap <C-x> :q!<CR>

" Plugin configs

" Go-vim
let g:go_def_mapping_enabled = 0 

" gitgutter
set updatetime=250
let g:gitgutter_max_signs=500
let g:gitgutter_diff_args = 'master'
nmap <leader>gj <Plug>GitGutterNextHunk
nmap <leader>gk <Plug>GitGutterPrevHunk

" airline
let g:airline_powerline_fonts = 1
map <leader>gd :GoDef<CR>

" nerdtree
map <leader>nt :NERDTreeToggle<CR>
let g:NERDTreeMapOpenSplit='x'
let g:NERDTreeMapOpenVSplit='v'

" tagbar
map <leader>tb :TagbarToggle<CR>

" CtrlP
let g:ctrlp_map = '<c-t>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'ra'
set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " MacOSX/Linux

" Easymotion
map / <Plug>(easymotion-sn)
omap / <Plug>(easymotion-tn)
map n <Plug>(easymotion-next)
map N <Plug>(easymotion-prev)
let g:EasyMotion_landing_highlight = 1

" NERDCommenter
let g:NERDSpaceDelims = 1
let g:NERDCompactSexyComs = 1
let g:NERDDefaultAlign = 'left'
let g:NERDCommentEmptyLines = 1
let g:NERDTrimTrailingWhitespace = 1

" multicursor
let g:multi_cursor_use_default_mapping=1
let g:multi_cursor_next_key='<C-n>'
let g:multi_cursor_prev_key='<C-p>'
let g:multi_cursor_skip_key='<C-x>'
let g:multi_cursor_quit_key='<Esc>'


" Notes
"
" Ctrl + w _ -> max out height of the current split
" Ctrl + w | -> max out width of the current split
" Ctrl + w = -> resize all windows
" Ctrl + o/i -> jump prev / back
" Ctrl + e/t/v/x -> CtrlP open options
" NerdTree vsplit/split -> s / i
