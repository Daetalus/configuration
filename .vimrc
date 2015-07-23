set nocompatible

" 修改leader键
let mapleader = ','
let g:mapleader = ','

" 规定Vundle的路径和插件安装路径
if has('win32') || has('win64')
    set rtp+=$VIM/vimfiles/bundle/vundle/
    call vundle#rc('$VIM/vimfiles/bundle/')
elseif has('unix')
    set rtp+=~/.vim/bundle/vundle/
    call vundle#rc()
endif
" let Vundle manage Vundle
Plugin 'gmarik/vundle'
filetype plugin indent on

" =====================================
"         插件及其对应配置
" =====================================

" 括号匹配
Plugin 'Raimondi/delimitMate'

Plugin 'yianwillis/vimcdoc'

if has('unix')
    Plugin 'Valloric/YouCompleteMe'
    " YCM配置
    " let g:loaded_youcompleteme = 1
    " 不显示Preview窗口
    set completeopt-=preview
    let g:ycm_add_preview_to_completeopt = 0
    let g:ycm_confirm_extra_conf = 0
    let g:ycm_key_list_select_completion = ['<c-n>', '<Down>']
    let g:ycm_key_list_previous_completion = ['<c-p>', '<Up>']
endif

" =====================================
"      Indent line，标注缩进线
" =====================================
Plugin 'Yggdroot/indentLine'
" Plugin 'nathanaelkane/vim-indent-guides'
" indent line 设置
let g:indentLine_color_gui = '#9370DB'
let g:indentLine_char = "┊""

" =====================================
"             NERDTRee
" =====================================
Plugin 'scrooloose/nerdtree'
Plugin 'jistr/vim-nerdtree-tabs'
" NerdTree配置
nmap <F3> :NERDTree <CR>
nmap <F4> :NERDTreeClose <CR>
let NERDTreeHighlightCursorline=1
let NERDTreeIgnore=['\.py[cd]$', '\~$', '\.swo$', '\.swp$', '^\.git$', '^\.hg$', '^\.svn$', '\.bzr$']
let g:nerdtree_tabs_open_on_gui_startup=0

Plugin 'tpope/vim-surround'
Plugin 'terryma/vim-expand-region'
Plugin 'tpope/vim-repeat'
Plugin 'easymotion/vim-easymotion'
Plugin 'tomasr/molokai'
Plugin 'christoomey/vim-tmux-navigator'

" =====================================
"         Python一条龙解决方案
" =====================================
Plugin 'klen/python-mode'
" Pymode配置
let g:pymode_lint = 1
let g:pymode_rope_complete_on_dot = 0
let g:pymode_rope_autoimport = 0
let g:pymode_rope_lookup_project = 0
let g:pymode_lint_on_write = 1
let g:pymode_folding = 0
let g:pymode_lint_checkers=['pyflakes', 'pep8', 'mccabe']

" =====================================
"            显示行末的空格
" =====================================
Plugin 'vim-scripts/ShowTrailingWhitespace'

" =====================================
"         更好的显示匹配的括号
" =====================================
Plugin 'luochen1990/rainbow'
"0 if you want to enable it later via :RainbowToggle
let g:rainbow_active = 1
let g:rainbow_conf = {
\   'guifgs': ['orchid', 'seagreen3', 'darkorange3', 'firebrick'],
\   'ctermfgs': ['lightblue', 'magenta', 'darkgreen', 'darkcyan', 'brown'],
\   'operators': '_,_',
\   'parentheses': ['start=/(/ end=/)/ fold', 'start=/\[/ end=/\]/ fold', 'start=/{/ end=/}/ fold'],
\   'separately': {
\       '*': {},
\       'tex': {
\           'parentheses': ['start=/(/ end=/)/', 'start=/\[/ end=/\]/'],
\       },
\       'lisp': {
\           'guifgs': ['royalblue3', 'darkorange3', 'seagreen3', 'firebrick', 'darkorchid3'],
\       },
\       'vim': {
\           'parentheses': ['start=/(/ end=/)/', 'start=/\[/ end=/\]/', 'start=/{/ end=/}/ fold', 'start=/(/ end=/)/ containedin=vimFuncBody', 'start=/\[/ end=/\]/ containedin=vimFuncBody', 'start=/{/ end=/}/ fold containedin=vimFuncBody'],
\       },
\       'html': {
\           'parentheses': ['start=/\v\<((area|base|br|col|embed|hr|img|input|keygen|link|menuitem|meta|param|source|track|wbr)[ >])@!\z([-_:a-zA-Z0-9]+)(\s+[-_:a-zA-Z0-9]+(\=("[^"]*"|'."'".'[^'."'".']*'."'".'|[^ '."'".'"><=`]*))?)*\>/ end=#</\z1># fold'],
\       },
\       'css': 0,
\   }
\}
" 平滑滚动
" 在uxrvt下可以在垂直分割后的面板中使用平滑滚动
" 在gnome terminal或terminator中不要使用垂直分割后平滑滚动
" 滚动速度太慢了，gvim中没有问题
Plugin 'yonchu/accelerated-smooth-scroll'

Plugin 'kien/ctrlp.vim'
Plugin 'godlygeek/tabular'
Plugin 'tpope/vim-markdown'
Plugin 'tomtom/tcomment_vim'
Plugin 'majutsushi/tagbar'
nmap <F8> :TagbarToggle<CR>

" =====================================
"          Go lang setting
" =====================================
Plugin 'fatih/vim-go'
"let g:go_fmt_command = "goimports"
let g:go_fmt_autosave = 1
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1

"修改Vim启动界面
Plugin 'mhinz/vim-startify'

" =====================================
"          airline，状态栏设置
" =====================================
Plugin 'bling/vim-airline'
set laststatus=2
let g:airline_detect_whitespace          = 1 "空白符检测
let g:airline#extensions#tabline#enabled = 1 "顶部tab栏显示
let g:airline_theme                      = "bubblegum" "设定主题

" =====================================
"               代码片段
" =====================================
Plugin 'SirVer/ultisnips'
" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsListSnippets="<c-l>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<c-tab>"
" 定义存放代码片段的文件夹 .vim/snippets下，使用自定义和默认的，将会的到全局，有冲突的会提示
let g:UltiSnipsSnippetDirectories=["UltiSnips", "bundle/vim-snippets/UltiSnips"]

" Snippets are separated from the engine. Add this if you want them:
Plugin 'honza/vim-snippets'

" =====================================
"     快速去行尾空格 [, + <Space>]
" =====================================
Plugin 'bronson/vim-trailing-whitespace'
map <leader><space> :FixWhitespace<cr>

" 类似Sublime的多光标编辑
Plugin 'terryma/vim-multiple-cursors'

" =====================================
"              Vim配置选项
" =====================================
"let g:molokai_original = 1"
let g:rehash256=1

colorscheme molokai

set t_Co=256

if !exists("syntax_on")
    syntax on
endif

"vim和系统共用剪切板
set clipboard=unnamed

if has('unnamedplus')
    set clipboard=unnamed,unnamedplus
endif

" let g:copycat#auto_sync = 1

" =====================================
"          控制、显示相关的设置
" =====================================
set fillchars=vert:│ "让命令行下的垂直分割栏变成实线

set scrolloff=3     " 光标移动到buffer的顶部和底部时保持3行距离
set ttyfast
set lazyredraw
" 在终端中启用鼠标
set mouse=a
" 高亮搜索
set hlsearch
" 打开增量搜索模式,随着键入即时搜索
set incsearch

"设置tab字符个数
set tabstop=4
set shiftwidth=4
" 将tab展开成空格
set expandtab
" 按退格键时可以一次删掉4个空格
set softtabstop=4

"自动缩进
set autoindent
" 更方便的退格键
set backspace=2
" 行号
set nu
set ruler

" 去掉输入错误的提示声音
set novisualbell         " don't beep
set noerrorbells         " don't beep
" 会对滚动效率有影响，暂时禁用
" set cursorline          " 突出显示当前行
" set cursorcolumn        "突出显示当前列
noremap <F1> <Esc>

" =====================================
"            文件及编码相关
" =====================================

set autochdir
" 获得权限写入文档
cnoremap w!! w !sudo dd of=%
" 无备份文件
set nobackup
" 关闭交换文件
set noswapfile
" 当文件在外部改动时，自动读取
set autoread
" 使用unix的换行模式作为标准文件类型
set ffs=unix,dos,mac

" 合并中文时不在中间加空格
set formatoptions+=B
" 如遇Unicode值大于255的文本，不必等到空格再折行。
set formatoptions+=m

"设定文件编码类型，彻底解决中文编码问题
set encoding=utf-8
set termencoding=utf-8
set fileencoding=utf-8
set fileencodings=ucs-bom,utf-8,gbk,cp936,latin-1

"vim提示信息乱码的解决
language messages zh_CN.utf-8
"vim的菜单乱码解决：
source $VIMRUNTIME/delmenu.vim
source $VIMRUNTIME/menu.vim

" =====================================
"       Vim窗口和标签页操作优化
" =====================================
autocmd BufEnter * setlocal bufhidden=delete
" 更方便的在窗口之间跳转
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" 优化水平滚动
map zl zL
map zh zH

" 在软折行上跳转
nnoremap k gk
nnoremap gk k
nnoremap j gj
nnoremap gj j

" 更好的操作不同tab
" http://vim.wikia.com/wiki/Alternative_tab_navigation
" http://stackoverflow.com/questions/2005214/switching-to-a-particular-tab-in-vim
map <leader>th :tabnext<cr>
map <leader>tl :tabprev<cr>
map <leader>te :tabedit<cr>
map <leader>tc :tabclose<cr>
map <leader>tm :tabm<cr>

" 新建tab  Ctrl+t
nnoremap <C-t>     :tabnew<CR>
inoremap <C-t>     <Esc>:tabnew<CR>

" normal模式下切换到确切的tab
noremap <leader>1 1gt
noremap <leader>2 2gt
noremap <leader>3 3gt
noremap <leader>4 4gt
noremap <leader>5 5gt
noremap <leader>6 6gt
noremap <leader>7 7gt
noremap <leader>8 8gt
noremap <leader>9 9gt
noremap <leader>0 :tablast<cr>

" 调整缩进后自动选中，方便再次操作
vnoremap < <gv
vnoremap > >gv

"对相应的文件进行特殊设置
if has("autocmd")
    " for Python
    au BufWriteCmd *.py write || :PymodeLint
    autocmd FileType python setlocal foldmethod=indent
    "默认展开所有代码
    set foldlevel=99

    " for Go lang
    autocmd BufRead *.go set syn=go
    au FileType go nmap <leader>r <Plug>(go-run)
    au FileType go nmap <leader>b <Plug>(go-build)
    au FileType go nmap <leader>t <Plug>(go-test)
    au FileType go nmap <leader>c <Plug>(go-coverage)
    " for Markdown
    augroup markdown
        au!
        au BufNewFile,BufRead *.md,*.markdown setlocal filetype=markdown
    augroup END
    " for Java
    if has('win32') || has('win64')
        autocmd FileType java nnoremap <F5> :exec '!cmd /c javac % && java %:r' <cr>
    else
        autocmd BufRead *.java command RunJava execute "!gnome-terminal -e \"bash -c \\\"javac %; java %:r; exec bash\\\"\""
        " 临时禁用Eclim，自己写点东西就足够了。
        autocmd BufRead *.java map <F5> :RunJava<CR>
    endif
endif

" 在图形界面和终端的配色方案、字体
if has("gui_running")
    " 窗体设置
    set guioptions-=T " 隐藏工具栏
    " 在图形界面和终端的配色方案、字体
    set columns=120 lines=40    "设置gui默认界面大小
    if has("unix")
        set guifont=Source\ Code\ Pro\ 11
        set guifontwide=思源黑体\ CN\ 11
    elseif has("win32")
        " vsplit window, such as NERDTree will change window postion
        " see http://vim.1045645.n5.nabble.com/Vertical-split-changing-GVim-application-window-position-td5709140.html
        set guioptions+=l
        set guioptions-=L
        set guioptions+=r
        set guifont=Source\ Code\ Pro:h10
        set guifontwide=Microsoft\ YaHei\ Mono:h10 " guifontwide只有在encoding=utf-8时才生效
    endif
endif

" Windows下有效，Linux目前直接在普通模式禁用输入法
" 输入法设置
if has('multi_byte_ime')
    "未开启IME时光标背景色
    hi Cursor guifg=bg guibg=Orange gui=NONE
    "开启IME时光标背景色
    hi CursorIM guifg=NONE guibg=Skyblue gui=NONE
    " 关闭Vim的自动切换IME输入法(插入模式和检索模式)
    set iminsert=0 imsearch=0
    " 插入模式输入法状态未被记录时，默认关闭IME
    inoremap <silent> <ESC> <ESC>:set iminsert=2<CR>
endif

if has("unix")
    au InsertEnter * set noimdisable
    au InsertLeave * set imdisable
endif

" 默认路径修改
if has("win32") || has ("win64")
    cd d:\workspace
endif

" =====================================
"             功能函数配置
" =====================================

map <leader>a :call AutoSetFileHead()<cr>
" 定义函数AutoSetFileHead，自动插入文件头
autocmd BufNewFile *.sh,*.py exec ":call AutoSetFileHead()"

function! AutoSetFileHead()
    "如果文件类型为.sh文件
    if &filetype == 'sh'
        call setline(1, "\#!/bin/bash")
    endif

    "如果文件类型为python
    if &filetype == 'python'
        call setline(1, "\#!/usr/bin/env python")
        call setline(2, "\# -*- coding:utf-8 -*-")
        call setline(3, "from __future__ import division")
        call setline(4, "from __future__ import unicode_literals")
        call setline(5, "from __future__ import print_function")
    endif

    if &filetype == 'cpp'
        call setline(1, "#include<iostream>")
        call setline(2, "using namesapce std;")
    endif

    normal G
    normal o
    normal o
endfunc
