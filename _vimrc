set encoding=utf-8
set fileencoding=utf-8
set fileencodings=ucs-bom,utf-8,chinese,cp936
set guifont=Consolas:h10
set fileformats=unix,dos
language messages zh_CN.utf-8
set lines=45 columns=100
set number
set autoindent
set smartindent
set tabstop=4
set autochdir
" 打开javascript对dom、html和css的支持
let javascript_enable_domhtmlcss=1

set shiftwidth=4
set foldmethod=manual
colorscheme Monokai

set nocompatible
source $VIMRUNTIME/vimrc_example.vim
source $VIMRUNTIME/mswin.vim
behave mswin

set diffexpr=MyDiff()
function MyDiff()
  let opt = '-a --binary '
  if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
  if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
  let arg1 = v:fname_in
  if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
  let arg2 = v:fname_new
  if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
  let arg3 = v:fname_out
  if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
  let eq = ''
  if $VIMRUNTIME =~ ' '
    if &sh =~ '\<cmd'
      let cmd = '""' . $VIMRUNTIME . '\diff"'
      let eq = '"'
    else
      let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
    endif
  else
    let cmd = $VIMRUNTIME . '\diff'
  endif
  silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3 . eq
endfunction

"Toggle Menu and Toolbar
set guioptions-=m
set guioptions-=T
map <silent> <F2> :if &guioptions =~# 'T' <Bar>
        \set guioptions-=T <Bar>
        \set guioptions-=m <bar>
    \else <Bar>
        \set guioptions+=T <Bar>
        \set guioptions+=m <Bar>
    \endif<CR>
au BufRead,BufNewFile *.ftl set ft=javascript syntax=jquery

" Bundle settings
set nocompatible              " be iMproved
filetype off                  " required!

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required!
Bundle 'gmarik/vundle'

" My bundles here:
"
" original repos on GitHub
" Bundle 'tpope/vim-fugitive'
" Bundle 'Lokaltog/vim-easymotion'
" Bundle 'rstacruz/sparkup', {'rtp': 'vim/'}
" Bundle 'tpope/vim-rails.git'
" 配色
Bundle 'sickill/vim-monokai.git'
" javascript.vim
Bundle 'javascript.vim'
" 迄今位置最好的自动VIM自动补全插件了吧
" Vundle的这个写法，是直接取该插件在Github上的repo
Bundle 'Valloric/YouCompleteMe'
" SuperTab与Youcompleteme冲突
" Bundle 'SuperTab'
" 相较于Command-T等查找文件的插件，ctrlp.vim最大的好处在于没有依赖，干净利落
Bundle 'ctrlp.vim'
" 在输入()，""等需要配对的符号时，自动帮你补全剩余半个
Bundle 'AutoClose'
" 神级插件，ZenCoding可以让你以一种神奇而无比爽快的感觉写HTML、CSS
Bundle 'ZenCoding.vim'
" 在()、""、甚至HTML标签之间快速跳转；
Bundle 'matchit.zip'
" 显示行末的空格；
Bundle 'ShowTrailingWhitespace'
" JS代码格式化插件；
Bundle '_jsbeautify'
" 用全新的方式在文档中高效的移动光标，革命性的突破
Bundle 'EasyMotion'
" 自动识别文件编码；
Bundle 'FencView.vim'
" 必不可少，在VIM的编辑窗口树状显示文件目录
Bundle 'The-NERD-tree'
" NERD出品的快速给代码加注释插件，选中，`ctrl+h`即可注释多种语言代码；
Bundle 'The-NERD-Commenter'
" 解放生产力的神器，简单配置，就可以按照自己的风格快速输入大段代码。
Bundle 'UltiSnips'
" 让代码更加易于纵向排版，以=或,符号对齐
Bundle 'Tabular'
" jQuery 关键词高亮
Bundle 'jQuery'
" vim-scripts repos

" non-GitHub repos
" ...

filetype plugin indent on     " required!
"
" Brief help
" :BundleList          - list configured bundles
" :BundleInstall(!)    - install (update) bundles
" :BundleSearch(!) foo - search (or refresh cache first) for foo
" :BundleClean(!)      - confirm (or auto-approve) removal of unused bundles
"
" see :h vundle for more details or wiki for FAQ
" NOTE: comments after Bundle commands are not allowed.
