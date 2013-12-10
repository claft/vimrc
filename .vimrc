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
" スニペット補完を行うプラグイン（要設定。後で。
NeoBundle 'Shougo/neosnippet'
" なんかよくわからん。
NeoBundle 'jpalardy/vim-slime'
" シンタックスチェック用プラグイン。（単体ではうごかないっぽい。
NeoBundle 'scrooloose/syntastic'


filetype plugin indent on     " required!
filetype indent on
syntax on
