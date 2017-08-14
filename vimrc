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
set re=1
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
if &term =~ '^screen'
    " tmux will send xterm-style keys when its xterm-keys option is on
    execute "set <xUp>=\e[1;*A"
    execute "set <xDown>=\e[1;*B"
    execute "set <xRight>=\e[1;*C"
    execute "set <xLeft>=\e[1;*D"
endif
set background=dark
syntax on
set t_Co=256
hi Comment     term=reverse ctermfg=darkcyan
hi Search      term=reverse ctermbg=4 ctermfg=7


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Key Binding
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let mapleader = ","
let g:mapleader = ","

map <C-a>      0
map <C-e>      $


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
autocmd FileType yaml setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags
autocmd FileType c set omnifunc=ccomplete#Complete
autocmd FileType Makefile set noexpandtab    "disable tab replacement on Makefile

"
" Ruby
let g:ruby_path = system('rvm current')
"autocmd FileType ruby,eruby set omnifunc=rubycomplete#Complete
autocmd FileType ruby,eruby let g:rubycomplete_buffer_loading = 1
autocmd FileType ruby,eruby let g:rubycomplete_rails = 1
autocmd FileType ruby,eruby let g:rubycomplete_classes_in_global = 1
autocmd FileType ruby setlocal expandtab autoindent shiftwidth=2 tabstop=2 softtabstop=2

"
" CSS
autocmd FileType css setlocal expandtab shiftwidth=4 tabstop=4 softtabstop=4
autocmd FileType stylus setlocal expandtab shiftwidth=2 tabstop=2 softtabstop=2

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
" autocmd FileType javascript setlocal expandtab shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType javascript.jsx,javascript setlocal formatprg=prettier\ --stdin\ --print-width\ 100\ --single-quote\ --trailing-comma\ es5
autocmd BufWritePre *.js exe "normal! gggqG\<C-o>\<C-o>"
let javascript_enable_domhtmlcss=1

" Coffeescript
autocmd FileType coffee setlocal expandtab smarttab autoindent shiftwidth=2 tabstop=2 softtabstop=2

"
" Python
autocmd FileType python setlocal expandtab smarttab autoindent shiftwidth=4 tabstop=4 softtabstop=4 fdm=indent
autocmd BufWritePre *.py normal m`:%s/\s\+$//e ``            " Auto trim tail space
" python.vim: syntax highlight
"autocmd FileType python set complete+=k~/.vim/syntax/python.vim isk+=.,(
" help key mapping
"autocmd FileType python map <F1> K
"autocmd FileType python imap <F1> <ESC>K
" auto complete
"let g:pydiction_location='~/.vim/bundle/pydiction/complete-dict'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugin
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
"
call plug#begin('~/.vim/plugged')

"Plug 'powerline/powerline', { 'rtp': 'powerline/bindings/vim' }
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'altercation/vim-colors-solarized'

Plug 'Valloric/YouCompleteMe', { 'do': './install.py --clang-completer --gocode-completer --tern-completer' }
Plug 'mileszs/ack.vim'
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'easymotion/vim-easymotion'
Plug 'editorconfig/editorconfig-vim'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug '/usr/local/opt/fzf' | Plug 'junegunn/fzf.vim'
Plug 'tmhedberg/matchit'
Plug 'vim-syntastic/syntastic'
Plug 'majutsushi/tagbar'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'chrisbra/vim-diff-enhanced'
Plug 'alvan/vim-closetag'

Plug 'pangloss/vim-javascript', { 'for': 'javascript' }
Plug 'mxw/vim-jsx', { 'for': 'javascript' }
Plug 'flowtype/vim-flow', { 'for': 'javascript' }

Plug 'ap/vim-css-color'
"Plug 'hail2u/vim-css3-syntax'

"Plug 'fatih/vim-go', { 'for': 'go' }


call plug#end()

"
" ack.vim
if executable('ag')
    let g:ackprg = 'ag --vimgrep'
endif

"
" NERD_Tree
map <C-n>   :NERDTreeToggle<CR>

"
" Tagbar
nnoremap <silent> <C-t>  :TagbarToggle<CR>
let g:tagbar_autofocus = 1
let g:tagbar_type_javascript = {
\ 'ctagsbin' : 'jsctags'
\ }

"
"
" Powerline
"set rtp+=~/.vim/bundle/powerline/powerline/bindings/vim
"let g:Powerline_symbols = 'fancy'        " Require patched font "
"set guifont=Monaco\ for\ Powerline:h12

"
" Airline
let g:airline_powerline_fonts = 1
let g:airline_theme = 'solarized'

"
" UltiSnips
"let g:UltiSnipsExpandTrigger="<tab>"
"let g:UltiSnipsListSnippets="<f6>"

"
" YouCompleteMe
"let g:ycm_global_ycm_extra_conf = "~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py"
let g:ycm_confirm_extra_conf = 0
let g:ycm_key_list_select_completion=[]
let g:ycm_key_list_previous_completion=[]
nnoremap <leader>gd :YcmCompleter GoTo<CR>

"
" vim-jsx
let g:jsx_ext_required = 0

"
" vim-colors-solarized
"
colorscheme solarized

"
" unite.vim
"
" nnoremap <C-p> :Unite bookmark file_mru file_rec/git file_rec/async:/Users/kudo/01_Work/Repos<cr>
" nnoremap <space>/ :Unite grep:/Users/kudo/01_Work/Repos<cr>
let g:unite_enable_start_insert = 1
if executable('ag')
    " Use ag in unite grep source.
    let g:unite_source_grep_command = 'ag'
    let g:unite_source_grep_default_opts = '--nocolor --nogroup --column'
    let g:unite_source_grep_recursive_opt = ''
    let g:unite_source_rec_async_command = [ 'ag', '-l', '-g', '', '--nocolor' ]
endif

"
" syntastic
"
let g:syntastic_html_tidy_ignore_errors=[" proprietary attribute \"ng-"]
let g:syntastic_javascript_checkers = ['eslint']
let s:eslint_path = system('PATH=$(npm bin):$PATH && which eslint')
let b:syntastic_javascript_eslint_exec = substitute(s:eslint_path, '^\n*\s*\(.\{-}\)\n*\s*$', '\1', '')

"
" editorconfig
"
let g:EditorConfig_exclude_patterns = ['fugitive://.*', 'scp://.*']

"
" fzf
"
set rtp+=/usr/local/opt/fzf
let g:fzf_layout = { 'up': '~40%' }
nnoremap <C-p> :GFiles<cr>
nnoremap <space>/ :Ag<Space>

"
" vim-javascript
"
let g:javascript_plugin_flow = 1

"
" vim-flow
"
let g:flow#autoclose = 1

"
" vim-closetag
"
let g:closetag_filenames = '*.html,*.js'

" ----------------------------------------------------------------------------
" Cscope mappings
" Ref: https://github.com/junegunn/dotfiles/blob/master/vimrc
" ----------------------------------------------------------------------------
function! s:add_cscope_db()
  " add any database in current directory
  let db = findfile('cscope.out', '.;')
  if !empty(db)
    silent cs reset
    silent! execute 'cs add' db
  " else add database pointed to by environment
  elseif !empty($CSCOPE_DB)
    silent cs reset
    silent! execute 'cs add' $CSCOPE_DB
  endif
endfunction

if has("cscope")
  set csprg=/usr/local/bin/cscope
  set csto=0
  set cst
  set nocsverb
  set csverb
  call s:add_cscope_db()

  "   's'   symbol: find all references to the token under cursor
  "   'g'   global: find global definition(s) of the token under cursor
  "   'c'   calls:  find all calls to the function name under cursor
  "   't'   text:   find all instances of the text under cursor
  "   'e'   egrep:  egrep search for the word under cursor
  "   'f'   file:   open the filename under cursor
  "   'i'   includes: find files that include the filename under cursor
  "   'd'   called: find functions that function under cursor calls
  nnoremap <C-\>s :cs find s <C-R>=expand("<cword>")<CR><CR>
  nnoremap <C-\>g :cs find g <C-R>=expand("<cword>")<CR><CR>
  nnoremap <C-\>c :cs find c <C-R>=expand("<cword>")<CR><CR>
  nnoremap <C-\>t :cs find t <C-R>=expand("<cword>")<CR><CR>
  xnoremap <C-\>t y:cs find t <C-R>"<CR>
  " nnoremap <C-\>e :cs find e <C-R>=expand("<cword>")<CR><CR>
  nnoremap <C-\>f :cs find f <C-R>=expand("<cfile>")<CR><CR>
  " nnoremap <C-\>i :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
  nnoremap <C-\>d :cs find d <C-R>=expand("<cword>")<CR><CR>

  " extends
  nnoremap <C-\>e :cs find t extends <C-R>=expand("<cword>")<CR><CR>
  " implements
  nnoremap <C-\>i :cs find t implements <C-R>=expand("<cword>")<CR><CR>
  " new
  nnoremap <C-\>n :cs find t new <C-R>=expand("<cword>")<CR><CR>
endif
