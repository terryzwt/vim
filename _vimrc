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
map <f2> :NERDTreeToggle<CR> "F2��ݼ��򿪹ر�NERDTree����

"NERDTree Settings{
	let NERDTreeWinPos ="left" "��NERDTree�Ĵ���������gvim���ڵ����
	let NERDTreeShowBookmarks=1 "����NERDTree����ʱ���Զ���ʾBookmarks
	let NERDTreeBookmarksFile=$VIM."\\.NERDTreeBookmarks" "������ǩ�ļ�ΪVIM��Ŀ¼
"}

"Taglist����
map <F3> :Tlist<CR>
let Tlist_Ctags_Cmd = $VIM."\\ctags58\\ctags"
let Tlist_Show_One_File = 1      "��ͬʱ��ʾ����ļ���tag��ֻ��ʾ��ǰ�ļ���
let Tlist_Exit_OnlyWindow = 1    "���taglist���������һ�����ڣ����˳�vim
let Tlist_Use_Right_Window = 1   "���Ҳര������ʾtaglist����

set autoread
"��.vimrc�����ļ����޸�������Ч
autocmd! bufwritepost _vimrc source %

" �˳�����ģʽʱ���Զ�д���ļ�
autocmd InsertLeave * write


" �Զ���ȫ
filetype plugin indent on
"set completeopt=longest,menu

" �Զ���ȫ�ļ�
set dictionary-=$VIM/txt/php_funclist.txt dictionary+=$VIM/txt/php_funclist.txt

"��Ctrl+PageUp/PageDown�л���ǩҳ
map <S-Left> :tabp<CR>
map <S-Right> :tabn<CR>
"��F8��F9�л���ǩҳ
nnoremap <silent> <F8> :tabp<CR>
nnoremap <silent> <F9> :tabn<CR>
"��F12�رյ�ǰ��ǩ
nnoremap <silent> <F12> :tabc<CR>
"Alt+n �л���ǩҳ
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

"�������Ա���
set fileencodings=ucs-bom,utf-8,cp936,gb18030,big5,euc-jp,euc-kr,latin1
"set encoding=utf-8
"set termencoding=cp936
"language messages zh_CN.UTF-8

