set nocompatible               " be iMproved
filetype off

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
" ruby用の設定やりたい。
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
" Enable snipMate compatibility feature.
let g:neosnippet#enable_snipmate_compatibility = 1
" Tell Neosnippet about the other snippets
let g:neosnippet#snippets_directory='~/.vim/bundle/vim-snippets/snippets'


" なんかよくわからん。
NeoBundle 'jpalardy/vim-slime'
" 自動シンタックスチェック用プラグイン。
NeoBundle 'scrooloose/syntastic'

filetype plugin indent on     " required!
filetype indent on
syntax on
