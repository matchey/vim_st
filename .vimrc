"---------------------------
 " bundleで管理するディレクトリを指定"{{{
 set runtimepath+=~/.vim/bundle/neobundle.vim/
 
 " Required:
 call neobundle#begin(expand('~/.vim/bundle/'))
 
 "neobundle自体をneobundleで管理
 "NeoBundleFetch 'Shougo/neobundle.vim'
 
 "以下追加plugin
 "NeoBundle "ompugao/ros.vim"
 "NeoBundle 'scrooloose/nerdcommenter'
 "NeoBundle 'yegappan/mru'
 "NeoBundle 'Townk/vim-autoclose'
 "NeoBundle 'junegunn/vim-easy-align'
 "NeoBundle 'SingleCompile'
  NeoBundle 'embear/vim-localvimrc'
  NeoBundle 'taketwo/vim-ros'
 "NeoBundleLazy 'taketwo/vim-ros'
  NeoBundle 'LeafCage/foldCC'
  NeoBundle 'tomtom/tcomment_vim'
  NeoBundle 'vim-latex/vim-latex'
  NeoBundle 'scrooloose/syntastic'

 call neobundle#end()
 
 " Required:
 filetype plugin indent on
 
 " 未インストールのプラグインがある場合、インストールするかどうかを尋
 " 毎回聞かれると邪魔な場合もあるので、この設定は任意です。
 " NeoBundleCheck
 
 "-------------------------
 " End Neobundle Settings.
 "-------------------------
 ""}}}

"{{{ set
 set number "行番号を表示する
 set title "編集中のファイル名を表示
" set showmatch "括弧入力時の対応する括弧を表示(一瞬カーソル移動)
" autocmd ColorScheme * highlight MatchParen gui=bold,underline guibg=NONE guifg=blue
 colorscheme molokai
 syntax on "コードの色分け
 set t_Co=256 "カラースキーム反映させるのに必要
 set tabstop=4 "インデントをスペース4つ分に設定
 highlight Normal ctermbg=none 
 set shiftwidth=4
 set autoindent
 set smartindent "オートインデント
 set modeline "モードラインを有効にする
 set modelines=5 "モードラインの検索行数を設定
 set scrolloff=1 " カーソル位置をウィンドウ端からn行残してスクロール
 "#####検索設定#####
 set ignorecase "大文字/小文字の区別なく検索する
"set smartcase "検索文字列に大文字が含まれている場合は区別して検索する
 set wrapscan "検索時に最後まで行ったら最初に戻る
 set noswapfile
 set wildmode=longest:full,full "共通部分まで補完->候補
"set nocompatible 
 set clipboard=autoselect,unnamedplus "OS のクリップボードと vim のヤンクを共有>    する．
"set clipboard=autoselect,unnamed "OS のクリップボードと vim のヤンクを共有>    する．
 set foldtext=FoldCCtext()
 set foldcolumn=1 "左端にガイドを表示(1列)
 set fillchars=vert:\|
 let g:foldCCtext_head = 'repeat("-   ",indent(v:foldstart)/shiftwidth()-1)'
 let g:foldCCtext_tail = 'v:foldend-v:foldstart+1'
 let g:foldCCtext_enable_autofdc_adjuster = 1
 set foldmethod=marker "{{ {} }}で折りたたむ
 set completeopt=menu,preview,longest "insertの補完で一致まで
 set complete-=i   " disable scanning included files
 set complete-=t   " disable searching tags
 set encoding=utf-8
"set fileencodings=ucs-bom,iso-2022-jp-3,iso-2022-jp,eucjp-ms,euc-jisx0213,euc-jp,sjis,cp932,utf-8 "shift-jisで開くための設定
"}}}

 source ~/.vim/script/RosTopicList.vim"{{{
 source ~/.vim/script/RosCatkinMake.vim
"source ~/.vim/script/RosChibiMake.vim
 source ~/.vim/script/RosRun.vim
 source ~/.vim/script/PyRun.vim
 source ~/.vim/script/CppRun.vim
 source ~/.vim/script/CppMake.vim
 source ~/.vim/script/RosBuild.vim
"source ~/.vim/script/smooth_scroll.vim
 "}}}
"let loaded_matchparen = 1 "括弧のハイライトを表示しない
"autocmd ColorScheme * highlight MatchParen gui=bold,underline guibg=NONE guifg=orenge
hi MatchParen term=standout ctermbg=Black ctermfg=Black guibg=yellow guifg=yellow
 "nerdcommenter用 cc でコメントor コメントアウト
 let NERDSpaceDelims = 1
 nmap cc <Plug>NERDCommenterToggle
 vmap cc <Plug>NERDCommenterToggle
 "mru用 スペース2回押しでプラグイン起動
"nnoremap <space><space> :<c-u>MRU<CR>
 
 "自動整形プラグイン用 整形したい部分をvisual modeで選択してenter.
 " Start interactive EasyAlign in visual mode (e.g. vip<Enter>)
 vmap <Enter> <Plug>(EasyAlign)
 " Start interactive EasyAlign for a motion/text object (e.g.<Leader>    aip)
 nmap <Leader>a <Plug>(EasyAlign)

 "DoxygenToolkitは C/C++ の関数の先頭で :Dox とうつと，自動的に
 "Doxygenスタイルのコメントを挿入してくれる．
 "
 "vim-autoclose はカッコのケツを自動挿入してくれる．
 "
 "nerdtree は :NERDTree でディレクトリツリーの表示．
 
 "original"
 " set cursorline
 " highlight CursorLine cterm=NONE ctermfg=NONE ctermbg=black
 "change line

let g:localvimrc_persistent=2 "選択を保存"{{{
let g:localvimrc_sandbox=0 "変更可能にする

let g:tex_flavor='latex' "}}}

augroup vimrcEx"{{{
  au BufRead * if line("'\"") > 0 && line("'\"") <= line("$") |
  \ exe "normal g`\"" | endif
augroup END "前回の編集場所のカーソル位置から開く"}}}

function! ZenkakuSpace()"{{{
    highlight ZenkakuSpace cterm=reverse ctermfg=DarkMagenta gui=reverse guifg=DarkMagenta
endfunction
if has('syntax')
    augroup ZenkakuSpace
        autocmd!
        autocmd ColorScheme       * call ZenkakuSpace()
        autocmd VimEnter,WinEnter * match ZenkakuSpace /　/
    augroup END
    call ZenkakuSpace()
endif "全角スペースを可視化する"}}}

 set hlsearch

"{{{ map
 nmap <CR> i<CR><ESC>
 nmap <BS> i<BS><ESC><Right>

 inoremap jj <ESC><Right>

 inoremap {{ {}<Left><CR><Up><ESC>o
 inoremap }} {<ESC>o}<ESC>dd
"inoremap {<C-l> {<Down>
 inoremap (( ()<Left>
 inoremap )) (<ESC>Ea)
"inoremap (<C-l> (<ESC>Ea)
 inoremap "" ""<Left>
"inoremap "" "<ESC>Ea"
 inoremap "<Right> "<Right>
 inoremap "<C-l> "<Right>
 inoremap [[ []<Left>
 inoremap ]] [<ESC>Ea]
"inoremap < <><Left>
"inoremap <<Right> <

 nnoremap <Space>w :w<Enter>
 nnoremap <silent><Space>q :q<Enter>
 nnoremap <silent><Space><S-q> gg"qyG'':q!<Enter>
"nnoremap <silent>q<Up> <C-w><Up>:hide<Enter>
"nnoremap <silent>q<Down> <C-w><Down>:hide<Enter>
"nnoremap <silent><Space>q :bl<CR>:q<CR>:bf<CR>
"nnoremap <silent><Space><S-q> :bl<CR>:q!<CR>:bf<CR>
 nnoremap <Space>m :make<Enter>
"nnoremap <Space>c :RosCatkinMake<Enter>
"nnoremap <Space>b :RosBuild<Enter>
"nnoremap <Space>b :cd %:p:h:h<CR>:make<Enter>
 nnoremap <Space>t :tabnew
"nnoremap <Space>r o<C-r>%<ESC>6bDbdB"pyiwu:!rosrun<Space><C-r>p<Space>%:t:r<CR>

 nnoremap <Space>g "gyiw:vimgrep <C-r>g %<CR>:cw<CR>
 nnoremap <C-n> :cnext<CR>
 nnoremap <C-p> :cprevious<CR>
"nnoremap <C-k> :crewind<CR>
"nnoremap <C-j> :clast<CR>
"nnoremap <Space>d <C-w><Down>:q<CR>
 nnoremap <Space>f :cw<CR>
 nnoremap * *N
"nnoremap * *''
 vnoremap * "zy*:let @/ = @z<CR>
 nnoremap <C-h> :noh<CR>
 nnoremap <Space>s "syiw:%s/<C-r>s//gc<Left><Left><Left>

 nnoremap <C-Up> <C-w>+
 nnoremap <C-Down> <C-w>-

 nnoremap j gj
 nnoremap <Down> gj
"nnoremap <Down> <C-w><Down><Down>
 inoremap <Down> <ESC>gja
 nnoremap k gk
 nnoremap <Up> gk
"nnoremap <Up> <C-w><Up><Up>
 inoremap <Up> <ESC>gka
 noremap <S-h> ^
 noremap <S-l> $
"noremap <S-k> {
"noremap <S-j> }
 noremap <S-k> H
 noremap <S-j> L
 inoremap <C-h> <Left>
 inoremap <C-j> <ESC>gja
 inoremap <C-k> <ESC>gka
 inoremap <C-l> <Right>
 noremap { [{
 noremap } ]}
 noremap ( [(
 noremap ) ])

 cnoremap <C-h> <Left>
 cnoremap <C-j> <Down>
 cnoremap <C-k> <Up>
 cnoremap <C-l> <Right>

"nnoremap == gg=G''zz
 nmap <ESC>a <M-a>
 nnoremap <ESC>a ggyG''
 nnoremap == gg=G''
 nnoremap <Space><Space> i<Space><ESC><Right>
 nnoremap <Space><CR> o<ESC>
 vnoremap ccc <ESC>a*/<ESC>gvo<ESC>i/*<ESC>

 noremap 0p "0p
 inoremap @p <Right><ESC>"0pi 
 nnoremap <Space>p "ap
 noremap <Space>y "ay
 noremap Y y$
 noremap 1p "1p
"nnoremap ;; u.
"inoremap <kPageDown> <ESC>
 nnoremap <C-e> <C-l> "再描画
 nnoremap <silent> ciy ciw<C-r>0<ESC>:let@/=@1<CR>:noh<CR>
 nnoremap <silent> cy   ce<C-r>0<ESC>:let@/=@1<CR>:noh<CR>
 vnoremap <silent> cy   c<C-r>0<ESC>:let@/=@1<CR>:noh<CR>

 nnoremap <Space>a za
 nnoremap <Space>i zMzv
 "次の折りたたみへ移動
 nnoremap <C-j> zj
 nnoremap <C-k> zk 
 "折りたたみの最後へ移動
 nnoremap <Space>l ]z
 nnoremap <Space>h [z 
 "}}}
 
