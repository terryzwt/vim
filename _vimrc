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

"��ɫ��������������
set guifont=Courier_New:h12:cANSI
colorscheme freya 
"��ʾ�к�
set nu
" Tab���Ŀ��
set tabstop=2
" ͳһ����Ϊ2
set softtabstop=2
set shiftwidth=2

"��ֹ������ʱ�ļ�
set nobackup
set noswapfile

"�������Դ�Сд
set ignorecase
"�������ַ�����
set hlsearch
set incsearch
"�����滻
set gdefault

"NERDTree�����������
map <f3> :NERDTreeToggle<CR> "F2��ݼ��򿪹ر�NERDTree����

"NERDTree Settings{
	let NERDTreeWinPos ="left" "��NERDTree�Ĵ���������gvim���ڵ����
	"let NERDTreeShowBookmarks=1 "����NERDTree����ʱ���Զ���ʾBookmarks
	"let NERDTreeBookmarksFile=$VIM."\\.NERDTreeBookmarks" "������ǩ�ļ�ΪVIM��Ŀ¼
"}

