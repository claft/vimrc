set nocompatible               " be iMproved
filetype off

set listchars=tab:»-,trail:-
set list

set tabstop=2
set shiftwidth=2
set expandtab

if has('vim_starting')
  set runtimepath+=~/.vim/bundle/neobundle.vim
  call neobundle#rc(expand('~/.vim/bundle/'))
endif

" vimプラグイン管理ツール
NeoBundle 'Shougo/neobundle.vim'
" 非同期処理を実施するプラグイン（未インストール
NeoBundle 'Shougo/vimproc'
" 括弧とかのプラグイン。よくわからん。
NeoBundle 'VimClojure'
" vimからシェルを起動するプラグイン
NeoBundle 'Shougo/vimshell'
" vim用統合ユーザインタフェース
NeoBundle 'Shougo/unite.vim'

" 入力保管機能を提供するプラグイン（要設定。後で。
NeoBundle 'Shougo/neocomplcache'
" 起動時に有効化
let g:neocomplcache_enable_at_startup = 1

" スニペット補完を行うプラグイン
NeoBundle 'Shougo/neosnippet'
" サイトにあったものをコピペ。わかり次第コメント追加する。
" Plugin key-mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)
" SuperTab like snippets behavior.
imap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)"
\: pumvisible() ? "\<C-n>" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)"
\: "\<TAB>"
" For snippet_complete marker.
if has('conceal')
  set conceallevel=2 concealcursor=i
endif
" neosnippet有効化
let g:neosnippet#enable_snipmate_compatibility = 1
" snippets用のファイル配置場所指定
let g:neosnippet#snippets_directory='~/.vim/bundle/vim-snippets/snippets'
" 補完機能の背景色変更。ctermbg:背景色、guibg:文字色
" 補完候補popup menu
hi Pmenu   ctermbg=18 guibg=#ccffcc
" 補完対象選択時の色
"hi PmenuSel   ctermbg=7 guibg=Grey
"hi PmenuSbar  ctermbg=248 guibg=Grey
"hi PmenuThumb cterm=reverse gui=reverse

" なんかよくわからん
NeoBundle 'jpalardy/vim-slime'
" シンタックスチェック用プラグイン
NeoBundle 'scrooloose/syntastic'
" if-endなどの対になる文字を自動で書き出すプラグイン
NeoBundle 'tpope/vim-endwise'

" ruby on rails 環境用
NeoBundle 'tpope/vim-rails'

" python環境用
NeoBundleLazy "davidhalter/jedi-vim", {
  \ "autoload": {
  \   "filetypes": ["python", "python3", "djangohtml"],
  \ },
  \ "build": {
  \   "mac": "pip install jedi",
  \   "unix": "pip install jedi",
  \ }}
let s:hooks = neobundle#get_hooks("jedi-vim")
function! s:hooks.on_source(bundle)
  " jediにvimの設定を任せると'completeopt+=preview'するので
  " 自動設定機能をOFFにし手動で設定を行う
  let g:jedi#auto_vim_configuration = 0
  " 補完の最初の項目が選択された状態だと使いにくいためオフにする
  let g:jedi#popup_select_first = 0
  " quickrunと被るため大文字に変更
  let g:jedi#rename_command = '<Leader>r'
  " gundoと被るため大文字に変更
  let g:jedi#goto_command = '<Leader>g'
endfunction

filetype plugin indent on     " required!
filetype indent on

" ステータスライン設定
set laststatus=2
" ファイル名、更新有無、行数などの出力設定
set statusline=%f%m%=%l,%c\ %{'['.(&fenc!=''?&fenc:&enc).']\ ['.&fileformat.']'}

syntax on
