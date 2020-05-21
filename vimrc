"==========================================
" Author: xwn <xieweineng@gmail.com>
" Last_modify: 2020-05-21
"==========================================

" -----------------------------------------------------------------------------
"  < Initial Plugin 加载插件 >
" -----------------------------------------------------------------------------
" 非兼容vi模式。去掉讨厌的有关vi一致性模式，避免以前版本的一些bug和局限
set nocompatible    " be iMproved

"################### 插件管理 ###################
" 使用 junegunn/vim-plug 来管理插件
"   :PlugInstall         安装
"   :PlugUpdate          更新
"   :PlugClean           清理
call plug#begin('~/.vim/plugged')

" 等号、参数对齐
Plug 'junegunn/vim-easy-align'
" 状态栏
Plug 'vim-airline/vim-airline'
" 快速移动
Plug 'Lokaltog/vim-easymotion'
" 文件管理
Plug 'ctrlpvim/ctrlp.vim'
" 缓冲区
Plug 'bling/vim-bufferline'
" 自动保全引号等
Plug 'Raimondi/delimitMate'
" 注释
Plug 'scrooloose/nerdcommenter'

" 制表 csv
" Plug 'chrisbra/csv.vim'
" 语言 latex
" Plug 'lervag/vim-latex'
" 语言 markdown
" Plug 'plasticboy/vim-markdown.git'
" 语言 html5
" Plug 'othree/html5.vim'
" 语言 plantuml
" Plug 'aklt/plantuml-syntax'
call plug#end()

" -----------------------------------------------------------------------------
"  < 通用配置 >
" -----------------------------------------------------------------------------
set ai                      "自动缩进
set bs=2                    "在insert模式下用退格键删除
set showmatch               "代码匹配
set laststatus=2            "总是显示状态行
" set cursorcolumn          "为光标所在列加划线
set cursorline              "为光标所在行加下划线
set autoread                "文件在Vim之外修改过，自动重新读入

set ignorecase              "检索时忽略大小写
set smartcase               "如果搜索模式包含大写字符，不使用 'ignorecase' 选项，只有在输入搜索模式并且打开 'ignorecase' 选项时才会使用
set hls                     "检索时高亮显示匹配项
set helplang=cn             "帮助系统设置为中文
set noeb 		            "去掉输入错误的提示声音
set hidden                  " don't unload buffer when it is abandoned
set diffopt+=iwhite         "vimdiff ignore whitespace change

" -----------------------------------------------------------------------------
"  < 编写文件时的配置 >
" -----------------------------------------------------------------------------
filetype on                 "启用文件类型侦测
filetype plugin on          "针对不同的文件类型加载对应的插件
filetype plugin indent on   "启用缩进
"使用utf-8或gbk打开文件
set fileencodings=utf-8,ucs-bom,cp936,gbk,gb2312,big5,latin1
set smartindent             "启用智能对齐方式
set expandtab               "将Tab键转换为空格
set tabstop=4               "设置Tab键的宽度
set shiftwidth=4            "换行时自动缩进4个空格
set smarttab                "指定按一次backspace就删除shiftwidth宽度的空格
set foldenable              "启用折叠
set foldmethod=indent       "indent 折叠方式
" set foldmethod=marker      "marker 折叠方式
set clipboard+=unnamed      "系统粘贴板
set clipboard=unnamedplus

" -----------------------------------------------------------------------------
"  < 界面配置 >
" -----------------------------------------------------------------------------
syntax enable               "语法高亮
set number                  "显示行号
set ruler                   "显示当前的行号列号
set laststatus=2            "启用状态栏信息
set showcmd                 "在状态栏显示正在输入的命令
set showmode                "左下角显示当前vim模式
set scrolloff=7             "在上下移动光标时，光标的上方或下方至少会保留显示的行数
set cmdheight=2             "设置命令行的高度为2，默认为1
set cursorline              "突出显示当前行
set nowrap                  "设置不自动换行
colorscheme  torte  		"配色方案

" -----------------------------------------------------------------------------
"  < others 其它设置 >
" -----------------------------------------------------------------------------
" 增强模式中的命令行自动完成操作
set wildmenu
" 忽略编译文件
set wildignore=*.o,*~,*.pyc,*.class

" 离开插入模式后自动关闭预览窗口
autocmd InsertLeave * if pumvisible() == 0|pclose|endif
" 回车即选中当前项
inoremap <expr> <CR>       pumvisible() ? "\<C-y>" : "\<CR>"

"上下左右键的行为 会显示其他信息
inoremap <expr> <Down>     pumvisible() ? "\<C-n>" : "\<Down>"
inoremap <expr> <Up>       pumvisible() ? "\<C-p>" : "\<Up>"
inoremap <expr> <PageDown> pumvisible() ? "\<PageDown>\<C-p>\<C-n>" : "\<PageDown>"
inoremap <expr> <PageUp>   pumvisible() ? "\<PageUp>\<C-p>\<C-n>" : "\<PageUp>"

" if this not work ,make sure .viminfo is writable for you
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

" -----------------------------------------------------------------------------
"  < bufferline >
" -----------------------------------------------------------------------------
" 不显示缓冲区序号
let g:bufferline_show_bufnr = 0
" 设置切换Buffer快捷键"
nnoremap <C-N> :bn<CR>
nnoremap <C-P> :bp<CR>

" -----------------------------------------------------------------------------
"  < airline >
" -----------------------------------------------------------------------------
let g:airline_powerline_fonts = 1
if !exists('g:airline_symbols')
        let g:airline_symbols = {}
endif

" unicode symbols
let g:airline_left_sep = '»'
let g:airline_left_sep = '▶'
let g:airline_right_sep = '«'
let g:airline_right_sep = '◀'
let g:airline_symbols.crypt = '🔒'
let g:airline_symbols.linenr = '␊'
let g:airline_symbols.linenr = '␤'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.spell = 'Ꞩ'
let g:airline_symbols.notexists = '∄'
let g:airline_symbols.whitespace = 'Ξ'
" powerline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = '☰'
let g:airline_symbols.maxlinenr = ''

let g:airline#extensions#whitespace#enabled = 0
"let g:airline#extensions#tabline#enabled = 1
"let g:airline#extensions#tabline#buffer_nr_show = 1

" -----------------------------------------------------------------------------
"  < NERDTree >
" -----------------------------------------------------------------------------
map <F3> :NERDTreeMirror<CR>
map <F3> :NERDTreeToggle<CR>
let NERDTreeChDirMode  = 2  				"选中root即设置为当前目录
let NERDTreeQuitOnOpen = 1 				"打开文件时关闭树
let NERDTreeWinSize    = 22					"设置视图大小
" let NERDTreeShowBookmarks=1 				"显示书签
" let NERDTreeMinimalUI=1 				"不显示帮助面板
" let NERDTreeDirArrows=1 				"目录箭头 1 显示箭头  0传统+-|号

" -----------------------------------------------------------------------------
"  < A.vim >
" -----------------------------------------------------------------------------
nmap <Leader>a :A<CR>

" -----------------------------------------------------------------------------
"  < easymotion >
" -----------------------------------------------------------------------------
map  / <Plug>(easymotion-sn)
omap / <Plug>(easymotion-tn)
map  n <Plug>(easymotion-next)
map  N <Plug>(easymotion-prev)
nmap s <Plug>(easymotion-s)
nmap t <Plug>(easymotion-t)
map <Leader>h <Plug>(easymotion-lineforward)
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)
map <Leader>l <Plug>(easymotion-linebackward)

" -----------------------------------------------------------------------------
"  < vim-easy-align >
" -----------------------------------------------------------------------------
" Start interactive EasyAlign in visual mode (e.g. vip<Enter>)
vmap <Enter> <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

" -----------------------------------------------------------------------------
"  < 字符统计函数 >
" -----------------------------------------------------------------------------
if !exists("*CalCharCount")
    function CalCharCount()
        exe '%s/\S/&/gn'
    endfunction
endif
"映射命令模式下ctrl+m调用字符统计
nnoremap <Leader>m :call CalCharCount()<CR>

" -----------------------------------------------------------------------------
"  < Tab 操作 >
" -----------------------------------------------------------------------------
nmap <C-t> :tabnew<CR>
nmap <C-c> :tabclose<CR>
nmap <C-d> :tabnext<CR>
nmap <C-a> :tabprevious<CR>

" -----------------------------------------------------------------------------
"  < 自定义映射 >
" -----------------------------------------------------------------------------
" 命令行模式增强，ctrl - a到行首， -e 到行尾
map ,/ :nohlsearch<CR>                                "取消查找高亮

let &t_ti.="\e[1 q"
let &t_SI.="\e[5 q"
let &t_EI.="\e[1 q"
let &t_te.="\e[0 q"
