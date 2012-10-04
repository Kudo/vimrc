"
" vimrc
" By Kudo
"
" Reference
" http://www.lichihua.com/2006/files/vimrc.html
" http://edt1023.sayya.org/vim/node10.html
" https://github.com/beards/vimrc
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Basic Options
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nocompatible
set backspace=indent,eol,start         " allow backspacing over everything in insert mode
set history=50
set showcmd
set nowrap
set nonumber
set ruler
set nomodeline
"set nocursorline
set laststatus=2
set statusline=\ %{HasPaste()}%-20.(%f\ %m%r%h\ %w%)\ 
set statusline+=\ %<%30(\ \ \ %{hostname()}:%{CurDir()}%)\ 
set statusline+=%=\ [%c%V,\ %l/%L]\ [%{&ff}/%{&fileencoding}/%Y]
function! CurDir()
    let curdir = substitute(getcwd(), $HOME, "~", "")
    return curdir
endfunction
function! HasPaste()
    if &paste
        return '[PASTE]'
    else
        return ''
    endif
endfunction


"
" Encoding
set ffs=unix,dos,mac
set ff=unix
if has("multi_byte")
  set encoding=utf-8
  set fileencodings=utf-8,big5,cp950,gbk,cp936,iso-2022-jp,sjis,euc-jp,japan,euc-kr,ucs-bom,utf-bom,latin1,iso8859-1
  set termencoding=utf-8
  " for Big5 environment
  " set termencoding=big5
  " set fileencoding=big5
else
  set enc=taiwan
  set fileencoding=taiwan
endif

"
" Indent
"set tabstop=8
set shiftwidth=4
set softtabstop=4
set expandtab       "use space instead of tab
set autoindent
set smartindent
filetype on
filetype indent on
filetype plugin on

"
" Folding
"
set foldmethod=indent
set foldlevel=3
set foldnestmax=3

"
" Search
"
set incsearch       "highlight while typing
set hlsearch        "highlight search result
set smartcase       "ignore case if search pattern is all lowercase,case-sensitive otherwise

"
" Terminal
"set   term=xterm-color
if &term =~ "xterm"
  set ttymouse=xterm2                  
endif

"
set background=dark
syntax on
set t_Co=256
hi Comment     term=reverse ctermfg=darkcyan
hi Search      term=reverse ctermbg=4 ctermfg=7


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Key Binding
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map <C-a>      0
map <C-e>      $
map <C-u>      :set fileencoding=utf-8<CR>
map <C-b>      :set fileencoding=big5<CR>


" Tab for vim7
"set showtabline=1
map <C-d>      :tabc<CR>       
map <S-Left>   :tabp<CR>
map <S-Right>  :tabn<CR>

map <F2>       :set mouse=a<CR>
map <F3>       :set mouse=<CR>
"" Toggle on/off paste mode，在 insert mode 要設 pastetoggle 才能生效。
map <F5> :set paste!<BAR>set paste?<CR>
set pastetoggle=<F5>
map <F8> :%!xxd<CR>                    " 16 進位編輯
map <F9> :%!xxd -r<CR>         " 取消 16 進位編輯

" allow multiple indentation/deindentation in visual mode
vnoremap < <gv
vnoremap > >gv

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"縮寫
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
iabbrev #b /****************************************
iabbrev #e <Space>****************************************/
iabbrev #m // --------------------------------------
iabbrev xdate <c-r>=strftime("%d/%m/%y %H:%M:%S")<cr>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Text autocmd
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
autocmd FileType text setlocal textwidth=78

" When editing a file, always jump to the last known cursor position.
" Don't do it when the position is invalid or when inside an event handler
" (happens when dropping a file on gvim).
autocmd BufReadPost *
  \ if line("'\"") > 0 && line("'\"") <= line("$") |
  \   exe "normal g`\"" |
  \ endif
 
"
" Misc
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType xhtml set omnifunc=xhtmlcomplete#CompleteTags
autocmd FileType html,xhtml setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags
autocmd FileType c set omnifunc=ccomplete#Complete
autocmd FileType Makefile set noexpandtab    "disable tab replacement on Makefile

"
" Ruby
autocmd FileType ruby,eruby set omnifunc=rubycomplete#Complete
autocmd FileType ruby,eruby let g:rubycomplete_buffer_loading = 1
autocmd FileType ruby,eruby let g:rubycomplete_rails = 1
autocmd FileType ruby,eruby let g:rubycomplete_classes_in_global = 1
autocmd FileType ruby setlocal expandtab shiftwidth=2 tabstop=2 softtabstop=2
 
"
" CSS
autocmd FileType css setlocal expandtab shiftwidth=4 tabstop=4 softtabstop=4

"
" PHP
autocmd FileType php set omnifunc=phpcomplete#CompletePHP
set foldmethod=syntax
let php_folding=2
 
"
" Perl
" highlight advanced perl vars inside strings
let perl_extended_vars=1

" Javascript
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType javascript setlocal expandtab shiftwidth=2 tabstop=2 softtabstop=2
let javascript_enable_domhtmlcss=1

"
" Python
autocmd FileType python set omnifunc=pythoncomplete#Complete
autocmd FileType python setlocal expandtab smarttab autoindent shiftwidth=4 tabstop=4 softtabstop=4
autocmd BufWritePre *.py normal m`:%s/\s\+$//e ``            " Auto trim tail space
" python.vim: syntax highlight
"autocmd FileType python set complete+=k~/.vim/syntax/python.vim isk+=.,(
" help key mapping
"autocmd FileType python map <F1> K
"autocmd FileType python imap <F1> <ESC>K
" flake8: ignore E501 line too long
let g:flake8_ignore="E501,W391"
" auto complete
"let g:pydiction_location='~/.vim/bundle/pydiction/complete-dict'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugin
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
" vim-pathogen
runtime bundle/vim-pathogen/autoload/pathogen.vim
call pathogen#infect()
 
"
" Taglist
let g:ctags_statusline=1        " Display function name in status bar
let generate_tags=1             " Automatically start script
let Tlist_Use_Horiz_Window=0    " Displays taglist results in a vertical window
let Tlist_Use_Right_Window = 1
let Tlist_Compact_Format = 1
let Tlist_Exit_OnlyWindow = 1
let Tlist_GainFocus_On_ToggleOpen = 1
let Tlist_File_Fold_Auto_Close = 1
map <C-t> :TlistToggle<CR>
imap <C-t> <c-o>:TlistToggle<CR>

"
" NERD_Tree
map <C-o>   :NERDTreeToggle<CR>

"
" Easy Motion
let mapleader=","
let g:mapleader=","

"
" Powerline
let g:Powerline_symbols = 'fancy'        " Require patched font "
