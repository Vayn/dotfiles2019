if &compatible
  set nocompatible
endif

call plug#begin('~/.vim/plugged')

Plug 'arcticicestudio/nord-vim'
Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': 'bash install.sh',
    \ }
Plug 'dmix/elvish.vim', { 'on_ft': ['elvish'] }
Plug 'junegunn/vim-easy-align'
Plug 'lotabout/skim', {
    \ 'dir': '~/.skim',
    \ 'do': './install',
    \ }
Plug 'lotabout/skim.vim'
Plug 'RRethy/vim-hexokinase'
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

call plug#end()

filetype plugin indent on
syntax enable
set encoding=UTF-8


" 常规设置 Regular Settings {{{1

" Unix 风格 slash
set shellslash
" history 文件记录行数
set history=1000

" 备份 {{{2
set backup
set undofile

if has("win32") || has("win64")
    set backupdir=%TMP%
    set directory=%TMP%
    set undodir=%TMP%
else
    set backupdir=~/.tmp/vim_backup   " backups
    set directory=~/.tmp/vim_swap     " swap files
    set undodir=~/.tmp/vim_undodir    " undo
endif

set undolevels=1000
set undoreload=10000 "max number lines to save for undo on a buffer reload
" 2}}}

" 允许backspace和光标键跨越行边界
set whichwrap=b,s,[,],h,l

" 搜索时不区分大小写
set ignorecase

" 搜索高亮
set hlsearch

" 当前 buffer 可放在 bg 而不用写入磁盘
set hidden

" 禁止在选择补全时打开 preview 窗口显示文档信息
" 针对 python omnicomplete（太扰民了）
set completeopt-=preview

set isfname-==
set noequalalways
set winaltkeys=no
set completeopt+=longest
set cedit=<C-Y>

" End: Regular Settings 1}}}


" 格式设置 File Format Settings {{{1

" 编码 {{{2
set encoding=utf-8
set fileencodings=utf-8,chinese,latin-1
if has("win32")
    set fileencoding=chinese
else
    set fileencoding=utf-8
endif
language messages zh_CN.utf-8
" 2}}}

" 正确地处理中文字符的折行和拼接
set formatoptions+=mM
" 设置文件格式为unix
set fileformat=unix

" 缩进
set shiftwidth=4
set tabstop=4
set softtabstop=4

" 行间距
if has("gui_macvim")
    set linespace=0
else
    set linespace=4
endif

set expandtab

" 带有如下符号的单词不要被换行分割
set iskeyword+=_,$,@,%,#,-
" 使backspace正常处理indent, eol, start等
set backspace=indent,eol,start
" 在输入命令时列出匹配项目
set wildmenu
set wildmode=list:longest

" Exclude files and directories when expanding wildcards
" MacOSX/Linux
set wildignore+=*/tmp/*,*/.cache/*,*.so,*.swp,*.zip
" Windows
set wildignore+=*\\tmp\\*,*.swp,*.zip,*.exe

" Indenting
set copyindent
" End: File Format Settings 1}}}


" 显示设置 Interface Settings {{{1

" 字体 Font {{{2
set ambiwidth=single
" 2}}}

" 窗口及主题设置 Window and theme {{{2
"if !has('gui_running')
    """ 有些终端不能改变大小 http://vayn.de/qF7u2c
    "set lines=30            " 终端出现断裂的原因
    "set columns=85
"endif

if has("termguicolors") && $TERM != "xterm-256color"
    " Fix bug for vim
    set t_8f=^[[38;2;%lu;%lu;%lum
    set t_8b=^[[48;2;%lu;%lu;%lum

    "  设置终端真色彩
    set termguicolors
endif

colorscheme nord

" 显示状态栏
set laststatus=2
" Hide the default mode text (e.g. -- INSERT -- below the statusline)
set noshowmode
" End: Window and theme 2}}}

" Titlebar 设置 {{{2
set title " Turn on titlebar support

" Set the to- and from-status-line sequences to match the xterm titlebar
" manipulation begin/end sequences for any terminal where
"   a) We don't know for a fact that these sequences would be wrong, and
"   b) the sequences were not already set in terminfo.
" NOTE: This would be nice to fix in terminfo, instead...
if &term !~? '^\v(linux|cons|vt)' && empty(&t_ts) && empty(&t_fs)
  exe "set t_ts=\<ESC>]2;"
  exe "set t_fs=\<C-G>"
endif

"  Titlebar string: hostname> ${PWD:s/^$HOME/~} || (view|vim) filename ([+]|)
"let &titlestring =hostname() . '> ' . '%{expand("%:p:~:h")}'
                "\ . ' || %{&ft=~"^man"?"man":&ro?"view":"vim"} %f %m'
let &titlestring ='%{&ft=~"^man"?"man":&ro?"view":"vim"} %f %m' .
            \ '%{expand("%:p:~:h")}'

" When vim exits and the original title can't be restored, use this string:
if !empty($TITLE)
  " We know the last title set by the shell. (My zsh config exports this.)
  let &titleold=$TITLE
else
  "  Old title was probably something like: hostname> ${PWD:s/^$HOME/~}
  "let &titleold=hostname() . '> ' . fnamemodify($PWD,':p:~:s?/$??')
  let &titleold=fnamemodify($PWD,':p:~:s?/$??')
endif
" End: Titlebar 2}}}

" 高亮光标所在行列
set cursorline
"set cursorcolumn

" highlight three columns after 'textwidth'
set textwidth=80
set colorcolumn=+1,+2,+3
highlight ColorColumn ctermbg=237 guibg='#3c3836'

" 使用相对行号并显示所在行行号
set number
set relativenumber

" 在输入括号时光标会短暂地跳到与之相匹配的括号处，不影响输入
set showmatch
" 匹配括号的规则，增加针对html的<>
set matchpairs=(:),{:},[:],<:>
" 匹配括号高亮的时间（单位是十分之一秒）
set matchtime=1
" 不要闪烁
set novisualbell
set listchars=eol:$,tab:>-,nbsp:~
" 自动关闭折叠
set foldclose=all
" 显示窗口末行尽量多的内容
set display=lastline
" 自动回绕
set nolinebreak
" 启动的时候不显示intro
set shortmess=atI
" 屏幕保留行数
set scrolloff=5

" 隐藏底部滚动条
set guioptions-=b
" 隐藏右边滚动条
set guioptions-=R
set guioptions-=r
" 隐藏左边滚动条
set guioptions-=l
set guioptions-=L
" 隐藏菜单和工具栏
set guioptions-=m
set guioptions-=T

" Avoid cmdline redraw on every entered char by turning off Arabic
" shaping (which is implemented poorly).
if has('arabic')
    set noarabicshape
endif

if has("conceal")
    set concealcursor=nc
    set maxcombine=4
endif

" End: Interface Settings 1}}}



" 键映射 Mappings {{{1

" 回车取消搜索高亮
nnoremap <silent> <cr> :nohl<cr>

" 窗口区域切换 ←→↑↓
imap <silent> `h <esc><C-w><left>
vmap <silent> `h <esc><C-w><left>
nmap <silent> `h <C-w><left>
imap <silent> `l <esc><C-w><right>
vmap <silent> `l <esc><C-w><right>
nmap <silent> `l <C-w><right>
imap <silent> `k <esc><C-w><up>
vmap <silent> `k <esc><C-w><up>
nmap <silent> `k <C-w><up>
imap <silent> `j <esc><C-w><down>
vmap <silent> `j <esc><C-w><down>
nmap <silent> `j <C-w><down>

" Use the damn hjkl keys
nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>

" And make them fucking work, too.
nnoremap j gj
nnoremap k gk

" Display Highlight Group
nnoremap wh :echo
            \ "highlight<" .
            \ synIDattr(synID(line("."), col("."), 1), "name") .
            \ '> trans<' . synIDattr(synID(line("."),col("."),0),"name") .
            \ "> lo<" .
            \ synIDattr(synIDtrans(synID(line("."), col("."), 1)), "name") .
            \ ">"<cr>

nnoremap <BS> d

" 跳转搜索结果时，其所在行居中并闪烁
nnoremap <silent> n nzzzv:call PulseCursorLine()<cr>
nnoremap <silent> N Nzzzv:call PulseCursorLine()<cr>

" ctrl + c
vmap <C-c> "+y
" ctrl + x
vmap <C-x> "+x
" ctrl + v
nnoremap <C-v> "+gP
" ctrl + h
imap <C-h> <esc>:%s/
vmap <C-h> <esc>:%s/
nmap <C-h> :%s/

" Make selecting inside an HTML tag less dumb
nnoremap Vit vitVkoj
nnoremap Vat vatV
" ci[ 删除一对 [] 中的所有字符并进入插入模式
" ci( 删除一对 () 中的所有字符并进入插入模式
" ci< 删除一对 <> 中的所有字符并进入插入模式
" ci{ 删除一对 {} 中的所有字符并进入插入模式
" cit 删除一对 HTML/XML 的标签内部的所有字符并进入插入模式
" ci” ci’ ci` 删除一对引号字符 (” 或 ‘ 或 `) 中所有字符并进入插入模式

" 交换历史移动键位，键位作用参见 cmdline.txt
cnoremap <C-p> <up>
cnoremap <C-n> <down>
cnoremap <up> <C-p>
cnoremap <down> <C-n>

" End: Mappings 1}}}


" Leader Mappings {{{1
let mapleader=","

" strip all trailing whitespace in the current file
nnoremap <leader>W :%s/\s\+$//<cr>:let @/=''<cr>
" imitates TextMates Ctrl+Q function to re-hardwrap paragraphs of text
nnoremap <leader>q gqip
" CSS properties sorted
nnoremap <leader>S /{<cr>jV/^\s*\}\?$<cr>k:sort<cr>:noh<cr>

" Edit vim stuff.
nnoremap <leader>ev :call EditVimRC()<cr>

" Full-screen, wide-margins, no distractions
nnoremap <Leader>f :set fuoptions=maxvert fu<cr>

" open a new vertical split and switch over to it
nnoremap <leader>w <C-w>v<C-w>l

" 让选中内容变成搜索项
vnoremap <Leader># "9y?<C-r>='\V'.substitute(escape(@9,'\?'),'\n','\\n','g')<cr><cr>
vnoremap <Leader>* "9y/<C-r>='\V'.substitute(escape(@9,'\/'),'\n','\\n','g')<cr><cr>

" End: Leader Mappings 1}}}


" 自动命令 Autocmds {{{1

" 设默认 filetype 为 txt
autocmd BufEnter * if &filetype == "" | setlocal ft=txt | endif

" Jump to the last position when reopening a file
autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

autocmd BufReadPost *.rs setlocal filetype=rust

" End: Autocmds 1}}}


" 自定义函数 Custom Functions {{{1

" Pulse {{{2
" 来自 http://vayn.de/tUAYAK
function! PulseCursorLine()
    let current_window=winnr()

    windo set nocursorline
    execute current_window . 'wincmd w'

    setlocal cursorline

    redir => old_hi
        silent execute 'highlight CursorLine'
    redir END
    let old_hi=split(old_hi, '\n')[0]
    let old_hi=substitute(old_hi, 'xxx', '', '')

    highlight CursorLine guibg=#2a2a2a ctermbg=233
    redraw
    sleep 20m

    highlight CursorLine guibg=#333333 ctermbg=235
    redraw
    sleep 20m

    highlight CursorLine guibg=#3a3a3a ctermbg=239
    redraw
    sleep 20m

    highlight CursorLine guibg=#444444 ctermbg=240
    redraw
    sleep 20m

    highlight CursorLine guibg=#4a4a4a ctermbg=242
    redraw
    sleep 20m

    highlight CursorLine guibg=#444444 ctermbg=240
    redraw
    sleep 20m

    highlight CursorLine guibg=#3a3a3a ctermbg=239
    redraw
    sleep 20m

    highlight CursorLine guibg=#333333 ctermbg=235
    redraw
    sleep 20m

    highlight CursorLine guibg=#2a2a2a ctermbg=233
    redraw
    sleep 20m

    execute 'highlight ' . old_hi

    windo set cursorline
    execute current_window . 'wincmd w'
endfunction
" End: Pulse 2}}}

" EditVimRC {{{2
function! EditVimRC()
    if argc() > 0
        topleft vertical new
        redraw
    endif
    edit $MYVIMRC
endfunction
" 2}}}

" End: Custom Functions 1}}}


" 插件 Plugins {{{1

" vim-airline {{{2
let g:airline_theme='nord'
let g:airline#extensions#tabline#enabled=1
let g:airline_statusline_ontop=1
" End: vim-airline 2}}}

" NerdTree {{{2
let NERDTreeQuitOnOpen=1
autocmd StdinReadPre * let s:std_in=1
"autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | exe 'cd '.argv()[0] | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") &&
            \ b:NERDTreeType == "primary") | q | endif
nnoremap <leader>t :NERDTreeToggle<cr>
" 2}}}

" LanguageClient-neovim {{{2
let g:LanguageClient_serverCommands = {
    \ 'rust': ['~/.cargo/bin/rustup', 'run', 'stable', 'rls'],
    \ 'python': ['/usr/local/bin/pyls'],
    \ }

" Automatically start language servers.
let g:LanguageClient_autoStart = 1

" Maps K to hover, gd to goto definition, F2 to rename
nnoremap <silent> K :call LanguageClient_textDocument_hover()
nnoremap <silent> gd :call LanguageClient_textDocument_definition()
nnoremap <silent> <F2> :call LanguageClient_textDocument_rename()

" End: LanguageClient-neovim 2}}}

" skim.vim {{{2
" Mapping selecting mappings
nmap <leader><tab> <plug>(fzf-maps-n)
xmap <leader><tab> <plug>(fzf-maps-x)
omap <leader><tab> <plug>(fzf-maps-o)

" Insert mode completion
imap <c-x><c-k> <plug>(fzf-complete-word)
imap <c-x><c-f> <plug>(fzf-complete-path)
imap <c-x><c-j> <plug>(fzf-complete-file-ag)
imap <c-x><c-l> <plug>(fzf-complete-line)

" Advanced customization using autoload functions
inoremap <expr> <c-x><c-k> fzf#vim#complete#word({'left': '15%'})

autocmd! FileType fzf
autocmd  FileType fzf set laststatus=0 noshowmode noruler
  \| autocmd BufLeave <buffer> set laststatus=2 showmode ruler 
" End: skim.vim 2}}}

" End: Plugins 1}}}
