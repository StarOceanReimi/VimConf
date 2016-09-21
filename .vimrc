set nocompatible

" Vundle Settings -------------{{{
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'gmarik/Vundle.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'marijnh/tern_for_vim'
Plugin 'jalvesaq/R-Vim-runtime'
Plugin 'vim-scripts/Vim-R-plugin'
Plugin 'Valloric/YouCompleteMe' 
Plugin 'rdnetto/YCM-Generator'
Plugin 'bling/vim-airline'
Plugin 'junegunn/vim-easy-align'
Plugin 'Shougo/unite.vim'
Plugin 'Shougo/neomru.vim'
Plugin 'Shougo/neoyank.vim'
Plugin 'jiangmiao/auto-pairs'
Plugin 'rking/ag.vim'
Plugin 'int3/vim-taglist-plus'
Plugin 'scrooloose/nerdtree'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'mattn/emmet-vim'
Plugin 'Shutnik/jshint2.vim'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'maksimr/vim-jsbeautify'
Plugin 'einars/js-beautify'
Plugin 'sjl/gundo.vim'
Plugin 'scrooloose/syntastic'
Plugin 'digitaltoad/vim-jade'
Plugin 'groenewege/vim-less'
call vundle#end()
filetype plugin indent on
"}}}

"Plugin global settings"{{{
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline#extensions#tabline#buffer_idx_mode = 1
let g:airline#extensions#whitespace#enabled=0
let g:AutoPairsShortcutToggle = ''

let g:syntastic_cpp_compiler_options = '-std=c++11'
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0
let g:syntastic_enable_signs = 0
let g:loaded_syntastic_java_javac_checker = 1

let g:syntastic_javascript_checkers = ['']
let g:indent_guides_start_level = 1
let g:indent_guides_guide_size = 1

let g:instant_markdown_autostart = 0
map <F11> :InstantMarkdownPreview<cr>
"}}}

if &term == "xterm"
    let g:mopkai_is_not_set_normal_ctermbg = 1
    set t_Co=256
    "colorscheme mopkai
    colorscheme gruvbox
    set background=dark
    "colorscheme morning
endif

let mapleader="\\"

"Vim Mapping ----------------------{{{
imap <c-u> <esc>hevbUea
nnoremap <leader><cr> i<cr><esc>
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>
vnoremap <leader>' <esc>`<i'<esc>`>la'<esc>h 
vnoremap <leader>" <esc>`<i"<esc>`>la"<esc>h 

inoremap jk <esc>
nnoremap <esc>j gj
nnoremap <esc>k gk
vnoremap <esc>j gj
vnoremap <esc>k gk
nnoremap H ^
nnoremap L $

onoremap npn :<c-u>normal! 0f(vi)<cr>
onoremap npl :<c-u>normal! $F(vi)<cr>

onoremap in@ :<c-u>execute "normal! /[A-Za-z0-9+-_%.]\\+@[A-Za-z0-9-.]\\+\\.[A-Za-z0-9]\\{2,4\\}/\r:nohlsearch\rgn"<cr>

:nnoremap <silent> gw "_yiw:s/\(\%#\w\+\)\(\W\+\)\(\w\+\)/\3\2\1/<CR>``
nnoremap <c-j> <c-w><c-j>
nnoremap <c-h> <c-w><c-h>
nnoremap <c-k> <c-w><c-k>
nnoremap <c-l> <c-w><c-l>
nnoremap <silent> <Tab> :bnext<cr>
nnoremap <silent> <S-Tab> :bprevious<cr>
nnoremap <silent> <leader>c :bdelete<cr>
"Shrotcuts for closing split window
nnoremap <leader>q <c-w>q
nnoremap <silent> <leader>h :call ToggleHlsearch()<cr>
"nnoremap <silent> <leader>w :Explore<cr>
let g:netrw_liststyle=1
nnoremap <silent> <leader>w :NERDTreeTabsToggle<cr>
vmap <Enter> <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)
nnoremap <leader>m :w <BAR> !lessc % --autoprefix="last 3 version" >%:t:r.css<CR><space>
nnoremap <silent> <leader>r :w <BAR> :Tlist<cr>

call unite#filters#matcher_default#use(['matcher_fuzzy'])
"call unite#filters#sorter_default#use(['sorter_rank'])
let g:unite_enable_start_insert=1
"let g:unite_source_history_yank_enable=1
let g:unite_prompt='>>'
let g:unite_source_rec_max_cache_files=100000
let g:unite_split_rule = 'botright'
call unite#custom#source('file_rec/async,file_rec,file_mru',
      \ 'ignore_pattern', join([
      \ '\.DS_Store',
      \ '\.tmp/',
      \ '\.git/',
      \ '\.gitkeep',
      \ '\.hg/',
      \ '\.tox',
      \ '\.idea',
      \ '\.pyc',
      \ '\.png',
      \ '\.gif',
      \ '\.jpg',
      \ '\.svg',
      \ '\.eot',
      \ '\.ttf',
      \ '\.woff',
      \ '\.ico',
      \ '\.o',
      \ '__pycache__',
      \ '.env',
      \ '.env*',
      \ '.vagrant',
      \ '_build',
      \ 'build/',
      \ 'dist',
      \ '*.tar.gz',
      \ '*.zip',
      \ 'node_modules',
      \ 'bower_components',
      \ '.*\.egg',
      \ '*.egg-info',
      \ '.*egg-info.*',
      \ 'git5/.*/review/',
      \ 'google/obj/',
      \ '\.webassets-cache/',
      \ '\.sass-cache/',
      \ '\.coverage/',
      \ '\.m2/',
      \ '\.activator/',
      \ '\.composer/',
      \ '\.cache/',
      \ '\.npm/',
      \ '\.node-gyp/',
      \ '\.sbt/',
      \ '\.ivy2/',
      \ '\.local/activator/',
      \ ], '\|'))
if executable('ag')
    let g:unite_source_grep_command='ag'
    let g:unite_source_grep_default_opts='--nocolor --nogroup -S -C4'
    let g:unite_source_grep_recursive_opt=''
endif
nnoremap <c-p> :Unite -auto-resize file file_rec file_mru<cr> 
nnoremap <space>y :Unite history/yank<cr>
nnoremap <space>l :Unite line<cr>
nnoremap <space>k :Unite -quick-match buffer<cr>
"}}}

"{{{ autocmd groups


augroup filetype _vim
    autocmd!
    autocmd FileType vim setlocal foldmethod=marker
augroup END

" This code spinnets for html templates
augroup filetype _prog_iabbrev
    autocmd!
    autocmd FileType python :iabbrev <buffer> ifmain if __name__ == "__main__":<cr>
    autocmd FileType *html* :iabbrev <buffer> tb {% block %}{% endblock %}<esc>3F%hi
    autocmd FileType *html* :iabbrev <buffer> eg {% %}<esc>F%hi
    autocmd FileType *html* :iabbrev <buffer> gg {{ }}<esc>F}hi
augroup END

function! RunCpp(filter, ...)
    if a:0 < 1
        execute "!g++ -std=c++11 `ls " . a:filter . "` -o " . expand("%:r") . " && ./" . expand("%:r") . " && rm " . expand("%:r")
    else
        execute "!g++ -std=c++11 `ls " . a:filter . " | grep -v -E \"" . a:1 . "\"` -o " . expand("%:r") . " && ./" . expand("%:r") . " && rm " . expand("%:r")

    endif
endfunction

command! -nargs=+ RunCppCmd call RunCpp(<f-args>)

augroup filetype _prefix_adder
    autocmd!
    autocmd FileType css :inoremap <buffer> <leader>aa <esc>Y4pi-o-<esc>j^i-ms-<esc>j^i-moz-<esc>j^i-webkit-<esc>o
    autocmd FileType less :inoremap <buffer> <leader>aa <esc>Y4pi-o-<esc>j^i-ms-<esc>j^i-moz-<esc>j^i-webkit-<esc>o
    autocmd FileType javascript noremap <buffer>  <F3> :call JsBeautify()<cr>
    autocmd FileType *html* nnoremap <buffer> <F3> :call HtmlBeautify()<cr>
    autocmd FileType css noremap <buffer> <F3> :call CSSBeautify()<cr>
    autocmd FileType javascript noremap <buffer> <F4> :TernDef<cr>
    autocmd FileType javascript noremap <buffer> <F6> :TernType<cr>
    autocmd FileType javascript noremap <buffer> <F7> :TernRefs<cr>
    autocmd FileType javascript noremap <buffer> <F8> :TernRename<cr>
    autocmd FileType javascript nnoremap <buffer> <S-F6> :!node %<cr>
    autocmd FileType python nnoremap <buffer> <S-F6> :!python %<cr>
    autocmd FileType cpp nnoremap <buffer> <S-F6> :!g++ -std=c++11 % -o %:r && ./%:r && rm %:r<cr>
    autocmd FileType cpp nnoremap <buffer> <S-F7> :RunCppCmd *.cpp<cr>

augroup END

"augroup filetype _change_dir
"    autocmd!
"    autocmd BufEnter * silent! lcd %:p:h
"augroup END

augroup filetype setfiletype
    autocmd!
    autocmd BufRead,BufNewFile,BufWritePost {*.md,*.mkd,*.markdown} set ft=markdown
augroup END

"}}}

" Abbrevations when editing ----------------{{{
iabbrev adn and
iabbrev wath what
iabbrev waht what
iabbrev whta what
iabbrev teh the
iabbrev eth the
iabbrev eht the
iabbrev taht that
iabbrev thta that
iabbrev taht that
iabbrev tshi this
iabbrev tehn then
iabbrev tenh then
iabbrev dont don't
iabbrev @@ saiqiuli@gmail.com
iabbrev @U Li Qiu
"}}}

"{{{ YouCompleteMe Configuration
set completeopt-=preview
let g:ycm_confirm_extra_conf = 0
let g:ycm_extra_conf_globlist = ['~/dev/*', '!~/*']
let g:ycm_register_as_syntastic_checker = 0
let g:ycm_add_preview_to_completeopt=0

let g:ycm_filetype_blacklist = {
      \ 'tagbar' : 1,
      \ 'qf' : 1,
      \ 'notes' : 1,
      \ 'markdown' : 1,
      \ 'unite' : 1,
      \ 'text' : 1,
      \ 'vimwiki' : 1,
      \ 'pandoc' : 1,
      \ 'infolog' : 1,
      \ 'mail' : 1,
      \ 'html' : 1,
      \ 'yaml' : 1
      \}
nnoremap <leader>g :YcmCompleter GoToDefinition<cr>
nnoremap <leader>d :YcmCompleter GoToDeclaration<cr>
"}}}

" Common Switches -----------------{{{
set showcmd
"set autoindent      
"set smartindent   
set hidden
set showmatch   
set number
set laststatus=2
set splitright
set ttimeoutlen=50
set ignorecase
set nobackup
set noswapfile
set noshowmode
set expandtab
set shiftwidth=4
set softtabstop=4
set wrap linebreak nolist
set showbreak=\ ➥\ \ \ 
set cursorline
set omnifunc=syntaxcomplete#Complete
set listchars=eol:$,tab:>-,trail:~,extends:>,precedes:<
"set list
"set mouse=a
"use airline instead 
"set statusline=%F%m%r%h%w\ [%{&ff}]\ [%Y]\ [ASCII=\%03.3b\ HEX=\%02.2B]\ [POS=%04l,%04v\ %p%%\ %L]
"}}}

"Undos "{{{
nnoremap <F5> :GundoToggle<cr>
set undodir=~/.vim/tmp/undo//
set undofile
set history=1000
set undolevels=200"}}}

"{{{ Funcitons------------

function! ToggleHlsearch()
    if &hlsearch
        set nohlsearch
    else
        set hlsearch
    endif
endfunction

function! EscapeString(string)
    let string = a:string
    let string = escape(string, '^$.*\/~[]')
    let string = substitute(string, '\n', '\\n', 'g')
    return string
endfunction

function! GetVisual() range
    let reg_sav = getreg('"')
    let reg_type_sav = getregtype('"')
    let cb_sav = &clipboard
    set clipboard&
    "Put the current visual selection in the " register
    normal! ""gvy
    let selection = getreg('"')
    call setreg('"', reg_sav, reg_type_sav)
    let &clipboard = cb_sav
    let escaped_selection = EscapeString(selection)
    return "\\(" . escaped_selection . "\\)"
endfunction

vmap <leader>z <esc>:%s/<c-r>=GetVisual()<cr>//g<left><left>
"}}}

" jshint validation"{{{
nnoremap <silent><F2> :JSHint<CR>
inoremap <silent><F2> <C-O>:JSHint<CR>
vnoremap <silent><F2> :JSHint<CR>
"}}}

"{{{guioption
let g:gruvbox_italic=0
if has('gui_running')
    set columns=132 lines=43
    set guioptions-=M
    set guioptions-=T
    set guioptions-=r
    set guioptions-=L
    colorscheme gruvbox
    "set background=dark
    set background=light
    set <m-j>=^[j
    set <m-k>=^[k
    nnoremap <m-j> gj
    nnoremap <m-k> gk
    vnoremap <m-j> gj
    vnoremap <m-k> gk
    set guifont=Courier\ 10\ Pitch\ 12
    set showbreak=\ ➥\ 
endif"}}}
