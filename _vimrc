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
map <f3> :NERDTreeToggle<CR> "F2快捷键打开关闭NERDTree功能

"NERDTree Settings{
	let NERDTreeWinPos ="left" "将NERDTree的窗口设置在gvim窗口的左边
	"let NERDTreeShowBookmarks=1 "当打开NERDTree窗口时，自动显示Bookmarks
	"let NERDTreeBookmarksFile=$VIM."\\.NERDTreeBookmarks" "设置书签文件为VIM根目录
"}

