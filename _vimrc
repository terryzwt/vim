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

"配色方案及字体设置
set guifont=Courier_New:h12:cANSI
colorscheme freya 
"显示行号
set nu
" Tab键的宽度
set tabstop=2
" 统一缩进为2
set softtabstop=2
set shiftwidth=2

"禁止生成临时文件
set nobackup
set noswapfile

"搜索忽略大小写
set ignorecase
"搜索逐字符高亮
set hlsearch
set incsearch
"行内替换
set gdefault

"NERDTree插件功能配置
map <f2> :NERDTreeToggle<CR> "F2快捷键打开关闭NERDTree功能

"NERDTree Settings{
	let NERDTreeWinPos ="left" "将NERDTree的窗口设置在gvim窗口的左边
	let NERDTreeShowBookmarks=1 "当打开NERDTree窗口时，自动显示Bookmarks
	let NERDTreeBookmarksFile=$VIM."\\.NERDTreeBookmarks" "设置书签文件为VIM根目录
"}

"Taglist配置
map <F3> :Tlist<CR>
let Tlist_Ctags_Cmd = $VIM."\\ctags58\\ctags"
let Tlist_Show_One_File = 1      "不同时显示多个文件的tag，只显示当前文件的
let Tlist_Exit_OnlyWindow = 1    "如果taglist窗口是最后一个窗口，则退出vim
let Tlist_Use_Right_Window = 1   "在右侧窗口中显示taglist窗口

set autoread
"对.vimrc配置文件的修改立即生效
autocmd! bufwritepost _vimrc source %

" 退出插入模式时，自动写入文件
autocmd InsertLeave * write


" 自动补全
filetype plugin indent on
"set completeopt=longest,menu

" 自动补全文件
set dictionary-=$VIM/txt/php_funclist.txt dictionary+=$VIM/txt/php_funclist.txt

"用Ctrl+PageUp/PageDown切换标签页
map <S-Left> :tabp<CR>
map <S-Right> :tabn<CR>
"按F8、F9切换标签页
nnoremap <silent> <F8> :tabp<CR>
nnoremap <silent> <F9> :tabn<CR>
"按F12关闭当前标签
nnoremap <silent> <F12> :tabc<CR>
"Alt+n 切换标签页
function! BufPos_ActivateBuffer(num)
    let l:count = 1
    for i in range(1, bufnr("$"))
        if buflisted(i) && getbufvar(i, "&modifiable")
            if l:count == a:num
                exe "buffer " . i
                return
            endif
            let l:count = l:count + 1
        endif
    endfor
    echo "No buffer!"
endfunction
 
function! BufPos_Initialize()
    for i in range(1, 9)
        exe "map <M-" . i . "> :call BufPos_ActivateBuffer(" . i . ")<CR>"
    endfor
    exe "map <M-0> :call BufPos_ActivateBuffer(10)<CR>"
endfunction
autocmd VimEnter * call BufPos_Initialize()

"设置语言编码
set fileencodings=ucs-bom,utf-8,cp936,gb18030,big5,euc-jp,euc-kr,latin1
"set encoding=utf-8
"set termencoding=cp936
"language messages zh_CN.UTF-8

