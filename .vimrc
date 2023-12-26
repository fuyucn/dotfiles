
" -----------------------------------------------------------------------------
" SYSTEM
" -----------------------------------------------------------------------------

" Set compatibility to Vim only.
set nocompatible

" --- history / file handling ---
set history=999             " Increase history (default = 20)
set undolevels=999          " Moar undo (default=100)
set autoread                " reload files if changed externally

" 开启语法高亮显示
syntax on

" Automatically wrap text that extends beyond the screen length.
set wrap
set encoding=utf-8  
" 允许光标移动
set mouse=a

" 文件类型检查缩进
filetype indent on
set autoindent
" tab
set tabstop=2
set softtabstop=2

" -----------------------------------------------------------------------------
" UI
" -----------------------------------------------------------------------------
set t_Co=256


" 显示行号 (可选)
set nu

" Status bar
set laststatus=2

set showmode
set textwidth=80
set  ruler

" syntax match
set showmatch
" 搜索
set incsearch
set ignorecase

" 不备份
set nobackup
set undofile

" 自动切换目录 
set autochdir
