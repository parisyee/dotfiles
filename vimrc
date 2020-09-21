" Use Vim settings, rather than Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

" Switch syntax highlighting on
syntax on

" Enable file type detection and do language-dependent indenting.
filetype plugin indent on

" change leader to ','
let mapleader = ','

" ============= FROM VUNDLE ====================
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
" call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'tpope/vim-sensible'

Plugin 'scrooloose/nerdtree'
map \ :NERDTreeToggle<CR>
map \| :NERDTreeFind<CR>
let NERDTreeShowHidden=1

" FZF
Plugin 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plugin 'junegunn/fzf.vim'
map <C-P> :Files<CR>

Plugin 'tpope/vim-commentary'
xmap <leader>/ <Plug>Commentary
nmap <leader>/ <Plug>CommentaryLine

Plugin 'vim-ruby/vim-ruby'

Plugin 'tpope/vim-fugitive'

Plugin 'tpope/vim-repeat'

" Plugin 'jiangmiao/auto-pairs'

Plugin 'tpope/vim-surround'

Plugin 'bling/vim-airline'

Plugin 'ervandew/supertab'

Plugin 'tpope/vim-rails'

Plugin 'tpope/vim-abolish'

Plugin 'chriskempson/vim-tomorrow-theme'
" Make sure to `mkdir -p ~/.vim/colors; cp ~/.vim/bundle/vim-tomorrow-theme/colors/*.vim ~/.vim/colors/`
colorscheme Tomorrow-Night-Eighties

Plugin 'vim-syntastic/syntastic'

Plugin 'folke/AutoTag'
let g:autotagExcludeSuffixes="tml.xml.text.txt.vim"
map <leader>rt :!ctags --extra=+f --exclude=.git --exclude=log --exclude=doc --exclude=node_modules -R *<CR><CR>
map <C-\> :tnext<CR>

" Plugin 'thoughtbot/vim-rspec'
" " RSpec.vim mappings
" map <leader>t :call RunCurrentSpecFile()<CR>
" map <leader>s :call RunNearestSpec()<CR>
" map <leader>l :call RunLastSpec()<CR>
" map <leader>a :call RunAllSpecs()<CR>

Plugin 'mattn/emmet-vim'

Plugin 'pangloss/vim-javascript'

Plugin 'mxw/vim-jsx'
let g:jsx_ext_required = 0

Plugin 'rking/ag.vim'

" All of your Plugins must be added before the following line
call vundle#end()            " required
" =========== END FROM VUNDLE =====================

" split screen
:noremap <leader>v :vsp<CR><C-w>l
:noremap <leader>h :split<CR><C-w>j

" toggle fullscreen
:noremap tt :tab split<CR>
:noremap ty :tabc <CR>

" use tab and shift-tab to indent
nnoremap <tab> >>
nnoremap <s-tab> <<
vnoremap <tab> >gv
vnoremap <s-tab> <gv

" line numbers
set number

" Use spaces instead of tabs
set expandtab tabstop=2 shiftwidth=2

" Dont create swap files
set noswapfile

" Dont wrap lines
set nowrap

" Highlight search
set hlsearch

" Remove scroll bars in MacVim
set guioptions-=L
set guioptions-=r

" Enable folding
set foldmethod=syntax

" colorcolumn on active windows only
if exists('+colorcolumn')
  augroup ccolumn
    au!
    au VimEnter,WinEnter,BufWinEnter * setlocal colorcolumn=80
    au WinLeave * setlocal colorcolumn=
  augroup END
else
  au BufWinEnter * let w:m2=matchadd('ErrorMsg', '\%>80v.\+', -1)
endif

" Wrap line at 80 characters in markdown files
au BufNewFile,BufFilePre,BufRead *.md set filetype=markdown
au BufNewFile,BufFilePre,BufRead *.md setlocal textwidth=80

" Copy current file path
nmap <leader>cl :let @+=expand("%:p")<CR>
nmap <D-C> :let @+=expand("%:p")<CR>

" The Silver Searcher
if executable('ag')
  " Use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor
endif

" Define the Ag command
command -nargs=+ -complete=file -bar Ag silent! grep! <args>|cwindow|redraw!

" to grep word under cursor
nnoremap <leader>a :grep! "\b<C-R><C-W>\b"<CR>:cw<CR>
