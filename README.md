Kudo's vimrc
============

INSTALL
-------

1. Check out from github

        git clone git://github.com/Kudo/vimrc.git ~/.vim
        cd ~/.vim
        git submodule update --init --recursive

2. Install ~/.vimrc

        cd $HOME && ln -s .vim/vimrc .vimrc

Requirements
-------
1. exuberant-ctags   (required by TagBar)
2. clang and libclang (required by clang_complete)
3. [powerline patched font](https://github.com/Lokaltog/vim-powerline/wiki/Patched-fonts)   (required by powerline fancy setting)

PLUGINS
-------

* [pathogen](https://github.com/tpope/vim-pathogen.git): makes it super easy to install plugins and runtime files in their own private directories  
* [supertab](https://github.com/ervandew/supertab): allows you to use <Tab> for all your insert completion needs  
* [TagBar](http://majutsushi.github.com/tagbar/): browsing the tags of source files ordered by classes.

  Useful commands:    
    `Ctrl-t` toggles the TagBar
 
* [nerd Tree](https://github.com/scrooloose/nerdtree.git): allows you to explore your filesystem and to open files and directories  

  Useful commands:    
    `Ctrl-o` toggles the NerdTree
    
* [easy motion](https://github.com/Lokaltog/vim-easymotion.git): provides a much simpler way to use some motions in vim  
    `,,w` forward easy motion  
    `,,b` backward easy motion  
    `,,f` easy motion for target char  

* [AutoClose](http://www.vim.org/scripts/script.php?script_id=1849):  Inserts matching bracket, paren, brace or quote.
* [surround](https://github.com/tpope/vim-surround/blob/master/doc/surround.txt): deal with pairs of surroundings.
* [matchit](http://www.vim.org/scripts/script.php?script_id=39): extended % matching for HTML, LaTeX, and many other languages. 
* [snipMate](http://www.vim.org/scripts/script.php?script_id=2540): TextMate-style snippets for Vim

  `:help snipMate` to see more info.
* [Zen Coding](https://github.com/mattn/zencoding-vim): expanding abbreviation like zen-coding.

  Useful commands:   
    `<ctrl-y>,` expand zen-coding abbreviation.

* [fugitive](https://github.com/tpope/vim-fugitive): git integration with vim.
* [powerline](https://github.com/Lokaltog/vim-powerline): Show fancy statusline in vim.

* [vim-javascript](https://github.com/pangloss/vim-javascript): Vastly improved vim's javascript indentation.
* [vim-css-color](https://github.com/skammer/vim-css-color): Highlight colors in css files.
* [clang_complete](https://github.com/Rip-Rip/clang_complete): Vim plugin that use clang for completing C/C++ code.
* [python.vim](https://github.com/vim-scripts/python.vim--Vasiliev): enhanced python syntax highlight  
* [pep8-indent](https://github.com/hynek/vim-python-pep8-indent.git): fix vim default terrible auto indent  
* [pydoc.vim](https://github.com/fs111/pydoc.vim): python doc  
    `K` show document according to current cursor  

* [flake8](https://github.com/nvie/vim-flake8): python syntax checking and format checking  
    `<F7>` show checking result  
  
REFERENCE
---------

https://github.com/beards/vimrc  
https://github.com/vgod/vimrc  
http://dancingpenguinsoflight.com/2009/02/python-and-vim-make-your-own-ide/  
http://www.lichihua.com/2006/files/vimrc.html  
http://edt1023.sayya.org/vim/node10.html  
http://blog.eddie.com.tw/2012/06/01/screencast-3-vim-plugins/

