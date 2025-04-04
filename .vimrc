set nocompatible

" 修改leader键
let mapleader = ','
let g:mapleader = ','

call plug#begin()
" 括号匹配
Plug 'Raimondi/delimitMate'
Plug 'yianwillis/vimcdoc'
Plug 'maralla/completor.vim'
Plug 'davidhalter/jedi'
Plug 'Yggdroot/indentLine'
Plug 'scrooloose/nerdtree'
Plug 'jistr/vim-nerdtree-tabs'
Plug 'tpope/vim-surround'
Plug 'terryma/vim-expand-region'
Plug 'tpope/vim-repeat'
Plug 'easymotion/vim-easymotion'
Plug 'tomasr/molokai'
Plug 'christoomey/vim-tmux-navigator'
Plug 'python-mode/python-mode'
Plug 'vim-scripts/ShowTrailingWhitespace'
Plug 'luochen1990/rainbow'
Plug 'kien/ctrlp.vim'
Plug 'godlygeek/tabular'
Plug 'tpope/vim-markdown'
Plug 'tomtom/tcomment_vim'
Plug 'majutsushi/tagbar'
Plug 'fatih/vim-go'
Plug 'mhinz/vim-startify'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'bronson/vim-trailing-whitespace'
Plug 'terryma/vim-multiple-cursors'
Plug 'jlanzarotta/bufexplorer'
call plug#end()

" Adjust windows size faster
nnoremap <silent> <leader>h :vertical resize -10<CR>
nnoremap <silent> <leader>l :vertical resize +10<CR>
nnoremap <silent> <leader>j :resize -5<CR>
nnoremap <silent> <leader>k :resize +5<CR>
" =====================================
"         插件及其对应配置
" =====================================


" =====================================
"               自动补全
" =====================================
if has('unix')
    let g:completor_python_binary = '/usr/bin/python3'
    let g:completor_clang_binary = '/usr/bin/clang'
endif

" if has('unix')
"     Plugin 'Valloric/YouCompleteMe'
"     " YCM配置
"     " let g:loaded_youcompleteme = 1
"     " 不显示Preview窗口
"     set completeopt-=preview
"     let g:ycm_add_preview_to_completeopt = 0
"     let g:ycm_confirm_extra_conf = 0
"     let g:ycm_key_list_select_completion = ['<c-n>', '<Down>']
"     let g:ycm_key_list_previous_completion = ['<c-p>', '<Up>']
" endif
" =====================================
"      Indent line，标注缩进线
" =====================================
" indent line 设置
let g:indentLine_color_gui = '#9370DB'
let g:indentLine_char = "┊""

" =====================================
"             NERDTree
" =====================================
" NerdTree配置
nmap <F3> :NERDTree <CR>
nmap <F4> :NERDTreeClose <CR>
let NERDTreeHighlightCursorline=1
let NERDTreeIgnore=['\.py[cd]$', '\~$', '\.swo$', '\.swp$', '^\.git$', '^\.hg$', '^\.svn$', '\.bzr$']
map <leader>r :NERDTreeFind<cr>
let g:nerdtree_tabs_open_on_gui_startup=0


" =====================================
"         Python一条龙解决方案
" =====================================
" Pymode配置
let g:pymode_lint = 1
let g:pymode_rope_complete_on_dot = 0
let g:pymode_rope_autoimport = 0
let g:pymode_rope_lookup_project = 0
let g:pymode_lint_on_write = 1
let g:pymode_folding = 0
let g:pymode_rope_goto_definition_cmd = 'new'
let g:pymode_lint_checkers=['pyflakes', 'pep8', 'mccabe']

" =====================================
"            显示行末的空格
" =====================================

" =====================================
"         更好的显示匹配的括号
" =====================================
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
" 滚动速度太慢了（似乎是因为Terminal模拟器在垂直切分时需要
" 重新截断字符串并计算），gvim中没有问题
if has("gui_running")
    Plugin 'yonchu/accelerated-smooth-scroll'
endif
" =====================================
"          CtrlP setting
" =====================================
let g:ctrlp_custom_ignore = {
    \ 'dir':  '\v[\/]\.(git|hg|svn|rvm)$',
    \ 'file': '\v\.(exe|so|dll|zip|tar|tar.gz|pyc)$',
    \ }

nmap <F8> :TagbarToggle<CR>

" =====================================
"          Go lang setting
" =====================================
"let g:go_fmt_command = "goimports"
let g:go_fmt_autosave = 1
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1

"修改Vim启动界面

" =====================================
"          airline，状态栏设置
" =====================================
set laststatus=2
let g:airline#extensions#whitespace#enabled = 1 "空白符检测
let g:airline#extensions#tabline#enabled = 1 "顶部tab栏显示
let g:airline#extensions#tabline#switch_buffers_and_tabs = 1
let g:airline#extensions#tabline#buffer_nr_show = 1
let g:airline#extensions#tabline#show_buffers=2 "总是显示buffer
let g:airline#extensions#tabline#show_tabs=0 "不显示tab
let g:airline#extensions#tabline#show_tab_nr = 1
let g:airline#extensions#tabline#buffer_idx_mode = 1
let g:airline_theme                      = "bubblegum" "设定主题

" =====================================
"               代码片段
" =====================================
" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger       = "<tab>"
let g:UltiSnipsListSnippets        = "<c-l>"
let g:UltiSnipsJumpForwardTrigger  = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<c-tab>"
" 定义存放代码片段的文件夹 .vim/snippets下，使用自定义和默认的，将会的到全局，有冲突的会提示
let g:UltiSnipsSnippetDirectories=["UltiSnips", "bundle/vim-snippets/UltiSnips"]

" Snippets are separated from the engine. Add this if you want them:

" =====================================
"     快速去行尾空格 [, + <Space>]
" =====================================
map <leader><space> :FixWhitespace<cr>

" 类似Sublime的多光标编辑

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
set vb t_vb=  " Disable the bell in GVim What about Linux?
" 会对滚动效率有影响，暂时禁用
" set cursorline          " 突出显示当前行
" set cursorcolumn        "突出显示当前列
noremap <F1> <Esc>
" ,s 用来快速保存文件
noremap <leader>s :update<cr>

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
" language messages zh_CN.utf-8
"vim的菜单乱码解决：
source $VIMRUNTIME/delmenu.vim
source $VIMRUNTIME/menu.vim

" =====================================
"       Vim窗口和标签页操作优化
" =====================================
" autocmd BufEnter * setlocal bufhidden=delete
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
map <leader>tl :tabnext<cr>
map <leader>th :tabprev<cr>
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

" Move to the next buffer
" nmap <leader>n :bnext<CR>
function! NextRealBuffer()
  let l:current = bufnr('%')
  let l:count = bufnr('$')
  let l:i = l:current

  while 1
    let l:i = (l:i % l:count) + 1
    if buflisted(l:i) && getbufvar(l:i, '&buftype') == ''
      execute 'buffer' l:i
      return
    endif
    if l:i == l:current
      return
    endif
  endwhile
endfunction

nnoremap <silent> <leader>n :call NextRealBuffer()<CR>

function! PreviousRealBuffer()
  let l:current = bufnr('%')
  let l:i = l:current
  let l:count = bufnr('$')

  while 1
    let l:i = (l:i - 2 + l:count) % l:count + 1
    if buflisted(l:i) && getbufvar(l:i, '&buftype') == ''
      execute 'buffer' l:i
      return
    endif
    if l:i == l:current
      return
    endif
  endwhile
endfunction

" Move to the previous buffer
nnoremap <silent> <Leader>p :call PreviousRealBuffer()<CR>


" Close the current buffer and move to the previous one
" This replicates the idea of closing a tab
nmap <leader>bq :bp <BAR> bd #<CR>
" Show all open buffers and their status
nmap <leader>bl :ls<CR>

" normal 模式下切换buffer
if has("gui_running")
    nmap <A-1> <Plug>AirlineSelectTab1
    nmap <A-2> <Plug>AirlineSelectTab2
    nmap <A-3> <Plug>AirlineSelectTab3
    nmap <A-4> <Plug>AirlineSelectTab4
    nmap <A-5> <Plug>AirlineSelectTab5
    nmap <A-6> <Plug>AirlineSelectTab6
    nmap <A-7> <Plug>AirlineSelectTab7
    nmap <A-8> <Plug>AirlineSelectTab8
    nmap <A-9> <Plug>AirlineSelectTab9
    nmap <A-l> <Plug>AirlineSelectPrevTab
    nmap <A-h> <Plug>AirlineSelectNextTab
else
    " not work, why???
    noremap <leader>b1 <Plug>AirlineSelectTab1
    noremap <leader>b2 <Plug>AirlineSelectTab2
    noremap <leader>b3 <Plug>AirlineSelectTab3
    noremap <leader>b4 <Plug>AirlineSelectTab4
    noremap <leader>b5 <Plug>AirlineSelectTab5
    noremap <leader>b6 <Plug>AirlineSelectTab6
    noremap <leader>b7 <Plug>AirlineSelectTab7
    noremap <leader>b8 <Plug>AirlineSelectTab8
    noremap <leader>b9 <Plug>AirlineSelectTab9
    noremap <leader>bh <Plug>AirlineSelectPrevTab
    noremap <leader>bl <Plug>AirlineSelectNextTab
endif

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

map <silent> <F11>
\    :call system("wmctrl -ir " . v:windowid . " -b toggle,fullscreen")<CR>

" 在图形界面和终端的配色方案、字体
if has("gui_running")
    " 窗体设置
    set guioptions-=T " 隐藏工具栏
    set guioptions-=m " 隐藏菜单栏
    " 在图形界面和终端的配色方案、字体
    set columns=999 lines=999    "设置gui默认界面大小
    if has("unix")
        set guifont=Source\ Code\ Variable\ 10
        set guifontwide=思源黑体\ CN\ 10
    elseif has("win32")
        au GUIEnter * simalt ~x
        " vsplit window, such as NERDTree will change window postion
        " see http://vim.1045645.n5.nabble.com/Vertical-split-changing-GVim-application-window-position-td5709140.html
        set guioptions+=l
        set guioptions-=L
        set guioptions+=r
        set guifont=Source\ Code\ Variable:h10
        " set guifontwide=Microsoft\ YaHei\ Mono:h10 " guifontwide只有在encoding=utf-8时才生效
        set guifontwide=等距更纱黑体\ SC:h10
        set vb t_vb=  " Disable the bell in Windows GVim
    endif
else
    set fillchars=vert:│ "让命令行下的垂直分割栏变成实线
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
    " au InsertEnter * set noimdisable
    " au InsertLeave * set imdisable
    "##### auto fcitx  ###########
    let g:input_toggle = 1
    function! Fcitx2en()
        let s:input_status = system("fcitx-remote")
        if s:input_status == 2
            let g:input_toggle = 1
            let l:a = system("fcitx-remote -c")
        endif
    endfunction

    function! Fcitx2zh()
        let s:input_status = system("fcitx-remote")
        if s:input_status != 2 && g:input_toggle == 1
            let l:a = system("fcitx-remote -o")
            let g:input_toggle = 0
        endif
    endfunction

    set ttimeoutlen=150
    "退出插入模式
    autocmd InsertLeave * call Fcitx2en()
    "进入插入模式
    autocmd InsertEnter * call Fcitx2zh()
    "##### auto fcitx end ######
endif

" 默认路径修改
if has("win32") || has ("win64")
    cd e:\workspace
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

if has('nvim')
    let g:python_host_prog = '/usr/bin/python'
    tnoremap <Esc> <C-\><C-n>
    " didn't use it yet.
    " tnoremap <A-h> <C-\><C-n><C-w>h
    " tnoremap <A-j> <C-\><C-n><C-w>j
    " tnoremap <A-k> <C-\><C-n><C-w>k
    " tnoremap <A-l> <C-\><C-n><C-w>l
    " nnoremap <A-h> <C-w>h
    " nnoremap <A-j> <C-w>j
    " nnoremap <A-k> <C-w>k
    " nnoremap <A-l> <C-w>l
endif
