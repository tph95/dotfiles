".vimrc -- Taylor Hosbach

"PLUGINS"
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif
call plug#begin('~/.vim/plugged')
Plug 'ycm-core/YouCompleteMe'
Plug 'preservim/nerdtree'
Plug 'vim-airline/vim-airline'
Plug 'dense-analysis/ale'
Plug 'airblade/vim-gitgutter'
Plug 'dracula/vim',{'as':'dracula'}
call plug#end()

let g:ale_linters = {'python': ['flake8']}

"basic settings
set number relativenumber
set showcmd
set linebreak
set noswapfile
set wildmode=longest,list,full
set tabstop=4
set softtabstop=4
set shiftwidth=4
set autoindent
set backspace=indent,eol,start


"Syntax and colorscheme
syntax enable
colorscheme dracula

"FILETYPES
autocmd BufRead,BufNewFile *.bib set filetype=bib
autocmd BufRead,BufNewFile *.tex set filetype=tex
autocmd BufRead,BufNewFile *.cpp set filetype=cpp
autocmd BufRead,BufNewFile *.py set filetype=python

"LaTeX Commands
"NORMAL MODE MACROS
	
"compile script must be in same directory as main.tex
autocmd Filetype tex nnoremap;cc :! ./compiletex.sh % <Enter>

"INSERT MODE MACROS
"Equation and listing environments
autocmd Filetype tex inoremap;eq  <Tab>\begin{equation}<Enter><Enter><Tab>\end{equation}<Esc>ki<Tab><Tab>
autocmd Filetype tex inoremap;eqn <Tab>\begin{equation*}<Enter><Enter><Tab>\end{equation*}<Esc>ki<Tab><Tab>
autocmd Filetype tex inoremap;al  <Tab>\begin{align}<Enter><Enter><Tab>\end{align}<Esc>ki<Tab><Tab>
autocmd Filetype tex inoremap;aln <Tab>\begin{align*}<Enter><Enter><Tab>\end{align*}<Esc>ki<Tab><Tab>
autocmd Filetype tex inoremap;en  <Tab>\begin{enumerate}<Enter><Enter><Tab>\end{enumerate}<Esc>ki<Tab><Tab>
autocmd Filetype tex inoremap;it  <Tab>\begin{itemize}<Enter><Enter><Tab>\end{itemize}<Esc>ki<Tab><Tab>

"Figure and diagram environments
autocmd Filetype tex inoremap;tc  <Tab>\begin{tcolorbox}<Enter><Enter>\end{tcolorbox}<Esc>ki<Tab><Tab>
autocmd Filetype tex inoremap;tz  <Tab>\begin{tikzpicture}<Enter><Enter>\end{tikzpicture}<Esc>ki<Tab><Tab>
autocmd Filetype tex inoremap;fg  <Tab>\begin{figure}<Enter><Tab><Tab>\centering<Enter><Tab><Tab>\includegraphics[]{}<Enter><Tab><Tab>\caption{}<Enter><Tab><Tab>\label{label:my fig}<Enter><Tab>\end{figure}<Esc>3k14li

"Text environment settings
autocmd Filetype tex inoremap;bf \textbf{}<Esc>hi
autocmd Filetype tex inoremap;rm \textrm{}<Esc>hi
autocmd Filetype tex inoremap;mm \(\)<Esc>hhi







