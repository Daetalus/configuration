set nocompatible

" 规定Vundle的路径和插件安装路径
if has('win32') || has('win64')
    set rtp+=$VIM/vimfiles/bundle/vundle/
    call vundle#rc('$VIM/vimfiles/bundle/')
elseif has('unix')
    set rtp+=~/.vim/bundle/vundle/
    call vundle#rc()
endif

" let Vundle manage Vundle
Bundle 'gmarik/vundle'
filetype plugin indent on

"My Bundle here:
"
" original repos on github
Bundle 'jiangmiao/auto-pairs'
Bundle 'yianwillis/vimcdoc'
if has('unix')
    Bundle 'Valloric/YouCompleteMe'
endif

" Indent line
Bundle 'Yggdroot/indentLine'
" Bundle 'nathanaelkane/vim-indent-guides'

" NERDTRee
Bundle 'scrooloose/nerdtree'
Bundle 'jistr/vim-nerdtree-tabs'

Bundle 'tpope/vim-surround'
Bundle 'tomasr/molokai'

" Python
Bundle 'klen/python-mode'
" 显示行末的空格；
Bundle 'vim-scripts/ShowTrailingWhitespace'
Bundle 'kien/ctrlp.vim'
Plugin 'godlygeek/tabular'
Bundle 'tpope/vim-markdown'

Bundle 'tomtom/tcomment_vim'
Plugin 'fatih/vim-go'
"修改Vim启动界面
Bundle 'mhinz/vim-startify'

Bundle 'bling/vim-airline'
" Track the engine.
Plugin 'SirVer/ultisnips'

" Snippets are separated from the engine. Add this if you want them:
Plugin 'honza/vim-snippets'
" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsListSnippets="<c-l>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<c-tab>"
"
""定义存放代码片段的文件夹 .vim/snippets下，使用自定义和默认的，将会的到全局，有冲突的会提示
let g:UltiSnipsSnippetDirectories=["UltiSnips", "bundle/vim-snippets/UltiSnips"]
""""""""""""""""""""""""""""""
" airline setting
""""""""""""""""""""""""""""""
set laststatus=2
let g:airline_detect_whitespace          = 1 "空白符检测
let g:airline#extensions#tabline#enabled = 1 "顶部tab栏显示
let g:airline_theme                      = "bubblegum" "设定主题

"let g:molokai_original = 1"let g:rehash256=1

colorscheme molokai
if !has("gui_running")
    set t_Co=256
endif

" indent line 设置
let g:indentLine_color_gui = '#9370DB'
" let g:indent_guides_guide_size = 1
" let g:indent_guides_enable_on_vim_startup = 1
"
" Pymode配置
let g:pymode_lint = 1
let g:pymode_lint_on_write = 1
let g:pymode_lint_checkers=['pyflakes', 'pep8', 'mccabe']
if !exists("syntax_on")
    syntax on
endif

set hlsearch
"vim和系统共用剪切板
let g:copycat#auto_sync = 1
set clipboard=unnamed

"设置tab字符个数
set tabstop=4
set shiftwidth=4
set expandtab
"自动缩进
set autoindent
"智能缩进
set si
"更方便的退格键
set backspace=2
set nu
set ruler
set nobackup
"自动将当前文件所在的目录设为工作目录
set autochdir
"映射F8为显示列表,需要taglist插件
nnoremap <silent> <F8> :Tlist<CR>

" YCM配置
let g:ycm_confirm_extra_conf = 0
let g:ycm_key_list_select_completion = ['<c-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<c-p>', '<Up>']

"对相应的文件进行特殊设置
if has("autocmd")
    " for Python
    au BufWriteCmd *.py write || :PymodeLint
    " autocmd FileType python setlocal et | setlocal sta | setlocal sw=4
    " autocmd FileType python compiler pyunit

    " for Go lang
    autocmd BufRead *.go set syn=go
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

set encoding=utf-8
" 在图形界面和终端的配色方案、字体
if has("gui_running")
    " 窗体设置
    set guioptions-=T " 隐藏工具栏 
    " 在图形界面和终端的配色方案、字体
    set columns=120 lines=40    "设置gui默认界面大小
    if has("unix")
        set guifont=Droid\ Sans\ Mono\ 10
        set guifontwide=思源黑体\ CN\ 10
    elseif has("win32")
        " vsplit window, such as NERDTree will change window postion
        " see http://vim.1045645.n5.nabble.com/Vertical-split-changing-GVim-application-window-position-td5709140.html
        set guioptions+=l
        set guioptions-=L
        set guioptions+=r
        set guifont=Consolas:h10
        "set guifontwide=Kaiti:h10
        set guifontwide=Microsoft\ YaHei\ Mono:h10 " guifontwide只有在encoding=utf-8时才生效
    endif
endif
" "缓冲区写入文件的时候自动检查文件类型
" au BufWritePost * filet detect

" TODO Windows下有效，Linux下待测
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

" NerdTree配置
nmap <F3> :NERDTree <CR>
nmap <F4> :NERDTreeClose <CR>

"Switch Input Method in Gvim
autocmd! InsertLeave *  set imdisable
autocmd! InsertEnter *  set noimdisable

" 默认路径修改
if has("win32") || has ("win64")
    cd d:\workspace
endif

" Go lang setting
"let g:go_fmt_command = "goimports"
let g:go_fmt_autosave = 1
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1

function! FontChangeOnResize()
    if &columns > 100
        set guifont=Droid\ Sans\ Mono\ 14
        set guifontwide=思源黑体\ CN\ 14
    elseif &columns > 60 && &columns < 100
        set guifont=Droid\ Sans\ Mono\ 10
        set guifontwide=思源黑体\ CN\ 10
    elseif &columns > 40 && &columns <60
        set guifont=Droid\ Sans\ Mono\ 10
        set guifontwide=思源黑体\ CN\ 10
    elseif &columns > 20 && columns < 40
        set guifont=Droid\ Sans\ Mono\ 10
        set guifontwide=思源黑体\ CN\ 10
    else
        set guifont=Droid\ Sans\ Mono\ 10
        set guifontwide=思源黑体\ CN\ 10
    endif
endfunction

if has("unix")
    autocmd VimResized * call FontChangeOnResize()
endif


