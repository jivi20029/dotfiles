syntax on
let mapleader=","
let g:mapleader=","


" set backspace=indent,eof,start
" 进行一些光标形状的设置 例如 插入模式下原来光标是个块状 现在是一条线 
let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_SR = "\<Esc>]50;CursorShape=2\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"

" 打开文件时,自动跳到上次关闭时的位置
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

" 设置可以使用鼠标 暂时屏蔽
" set mouse=a

set nocompatible
set backspace=indent,eol,start
" runtime macros/matchit.vim
packadd! matchit

set number
set norelativenumber 
set cursorline 
set wrap
set showcmd
set wildmenu

" search
set hlsearch
exec "nohlsearch"
set incsearch

set scrolloff=5

set ignorecase
set smartcase 

set nrformats=

" set system clipboard enabled 
" set clipboard=unnamed



" tab 
set noexpandtab
set tabstop=2
set shiftwidth=2
set softtabstop=2
set autoindent

" noremap <Tab> >
" noremap <S-Tab> <

" split screen 
noremap sl :set splitright<CR>:vsplit<CR>
noremap sh :set nosplitright<CR>:vsplit<CR>
noremap sj :set splitbelow<CR>:split<CR>
noremap sk :set nosplitbelow<CR>:split<CR>

noremap <up> :res +5<CR>
noremap <down> :res -5<CR>
noremap <left> :vertical resize -5<CR>
noremap <right> :vertical resize +5<CR>

" tab 
noremap tu :tabe<CR>
noremap th :-tabnext<CR>
noremap tl :+tabnext<CR>

noremap <Space><CR> :nohlsearch<CR>
noremap <Space><Space> <Esc>/<++><CR>:nohlsearch<CR>c4l

" inoremap jj <ESC> 
noremap J 5j
noremap K 5k

" copy between in system clipboard and vim clipboard
vnoremap Y "+y
vnoremap D "+d
" nnoremap P "+p
nnoremap <C-p> "+p 

" select all
" nnoremap <C-a> <Esc>ggVG

" replace ctrl to inoremap
" inoremap <Space>o <C-o>
" inoremap <Space>r <C-r>
noremap  <Space>j <C-w>j
noremap  <Space>k <C-w>k
noremap  <Space>h <C-w>h
noremap  <Space>l <C-w>l
nnoremap <Space>v <C-v>

map s <nop>
map S :w<CR>
map Q :q<CR>
map fq :q!<CR>
nnoremap RR :source $MYVIMRC<CR>
  
" :colorscheme hi HighlightedyankRegion term=bold ctermbg=0 guibg=#13354A 

call plug#begin('~/.vim/plugged')

Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'vim-airline/vim-airline'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'flazz/vim-colorschemes'
Plug 'mbbill/undotree'
Plug 'easymotion/vim-easymotion'
" Plug 'lyokha/vim-xkbswitch'
if has('nvim')
  Plug 'Shougo/defx.nvim', { 'do': ':UpdateRemotePlugins' }
else
  Plug 'Shougo/defx.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'mhinz/vim-startify'
Plug 'itchyny/vim-cursorword'
Plug 'lfv89/vim-interestingwords'
Plug 'tpope/vim-surround'
" Plug 'ybian/smartim'
Plug 'majutsushi/tagbar'
" Plug 'w0ng/vim-hybrid'
" Plug 'morhetz/gruvbox'
" Plug 'python-mode/python-mode', { 'for': 'python', 'branch': 'develop' }
Plug 'tpope/vim-commentary'
Plug 'jiangmiao/auto-pairs'  
Plug 'junegunn/vim-easy-align'
Plug 'honza/vim-snippets'
Plug 'iamcco/mathjax-support-for-mkdp'
Plug 'iamcco/markdown-preview.vim'
Plug 'tommcdo/vim-exchange'
Plug 'tpope/vim-repeat'
Plug 'tmhedberg/SimpylFold'

call plug#end()

" ===
" === NERDTree
" ===
nnoremap nt :NERDTreeToggle<cr>
nnoremap nf :NERDTreeFind<cr>
let NERDTreeMapOpenExpl = ""
let NERDTreeMapUpdir = ""
let NERDTreeMapUpdirKeepOpen = "l"
let NERDTreeMapOpenSplit = ""
let NERDTreeOpenVSplit = ""
let NERDTreeMapActivateNode = "i"
let NERDTreeMapOpenInTab = "o"
let NERDTreeMapPreview = ""
let NERDTreeMapCloseDir = "n"
let NERDTreeMapChangeRoot = "y"
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'
" let NERDTreeIgnore = [


" ===
" === Undotree
" ===
noremap L :UndotreeToggle<CR>
let g:undotree_DiffAutoOpen = 1
let g:undotree_SetFocusWhenToggle = 1
let g:undotree_ShortIndicators = 1
let g:undotree_WindowLayout = 2
let g:undotree_DiffpanelHeight = 8
let g:undotree_SplitWidth = 24
function g:Undotree_CustomMap()
	nmap <buffer> u <plug>UndotreeNextState
	nmap <buffer> e <plug>UndotreePreviousState
	nmap <buffer> U 5<plug>UndotreeNextState
	nmap <buffer> E 5<plug>UndotreePreviousState
endfunc


" ===
" === coc
" ===
" fix the most annoying bug that coc has
"silent! au BufEnter,BufRead,BufNewFile * silent! unmap if
let g:coc_global_extensions = ['coc-python', 'coc-go', 'coc-vimlsp', 'coc-html', 'coc-json', 'coc-css', 'coc-tsserver', 'coc-yank', 'coc-gitignore', 'coc-vimlsp', 'coc-tailwindcss', 'coc-stylelint', 'coc-tslint', 'coc-lists', 'coc-git', 'coc-explorer', 'coc-pyright', 'coc-sourcekit', 'coc-translator', 'coc-flutter', 'coc-todolist', 'coc-yaml', 'coc-tasks']
"set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}
"nmap <silent> <TAB> <Plug>(coc-range-select)
"xmap <silent> <TAB> <Plug>(coc-range-select)
" use <tab> for trigger completion and navigate to the next complete item
function! s:check_back_space() abort
	let col = col('.') - 1
	return !col || getline('.')[col - 1]	=~ '\s'
endfunction
inoremap <silent><expr> <TAB>
	\ pumvisible() ? "\<C-n>" :
	\ <SID>check_back_space() ? "\<TAB>" :
	\ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
function! s:check_back_space() abort
	let col = col('.') - 1
	return !col || getline('.')[col - 1]  =~# '\s'
endfunction
inoremap <silent><expr> <c-space> coc#refresh()
" inoremap <silent><expr> <c-o> coc#refresh()

" Open up coc-commands
nnoremap <c-c> :CocCommand<CR>
" Text Objects
xmap kf <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap kf <Plug>(coc-funcobj-i)
omap af <Plug>(coc-funcobj-a)
" Useful commands
nnoremap <silent> <space>y :<C-u>CocList -A --normal yank<cr>
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nmap <silent> ma <Plug>(coc-format)
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>rn <Plug>(coc-rename)
nmap tt :CocCommand explorer<CR>
" coc-translator
nmap ts <Plug>(coc-translator-p)
" Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)
" coctodolist
nnoremap <leader>tn :CocCommand todolist.create<CR>
nnoremap <leader>tl :CocList todolist<CR>
nnoremap <leader>tu :CocCommand todolist.download<CR>:CocCommand todolist.upload<CR>
" coc-tasks
noremap <silent> T :CocList tasks<CR>


" ===
" === easymotion 
" ===
map em <Plug>(easymotion-s2)
map ss <Plug>(easymotion-s2)



" ===
" === XkbSwitch 发现没有作用暂进注释掉了 
" ===
" let g:XkbSwitchLib = '/usr/local/lib/libInputSourceSwitcher.dylib'
" let g:XkbSwitchEnabled = 1

" 下面的也没有用处，也先注释掉  
let g:input_toggle = 0
function! Fcitx2en()
   let s:input_status = system("fcitx-remote")
   if s:input_status == 2
      let g:input_toggle = 1
      let l:a = system("fcitx-remote -c")
   endif
endfunction

function! Fcitx2zh()
   let s:input_status = system("fcitx-remote")
   if s:input_status != 2 && g:input_toggle == 1
      let l:a = system("fcitx-remote -o")
      let g:input_toggle = 0
   endif
endfunction

set timeoutlen =150
" autocmd InsertLeave * call Fcitx2en()
" autocmd InsertEnter * call Fcitx2zh()


" ===
" === 使用 ;e 切换显示文件浏览，使用 ;a 查找到当前文件位置
" ===
let g:maplocalleader=';'
nnoremap <silent> <LocalLeader>e
\ :<C-u>Defx -resume -toggle -buffer-name=tab`tabpagenr()`<CR>
nnoremap <silent> <LocalLeader>a
\ :<C-u>Defx -resume -buffer-name=tab`tabpagenr()` -search=`expand('%:p')`<CR>

function! s:defx_mappings() abort
	" Defx window keyboard mappings
	setlocal signcolumn=no
	" 使用回车打开文件
	nnoremap <silent><buffer><expr> <CR> defx#do_action('multi', ['drop'])
endfunction

call defx#custom#option('_', {
	\ 'columns': 'indent:git:icons:filename',
	\ 'winwidth': 25,
	\ 'split': 'vertical',
	\ 'direction': 'topleft',
	\ 'listed': 1,
	\ 'show_ignored_files': 0,
	\ 'root_marker': '≡ ',
	\ 'ignored_files':
	\     '.mypy_cache,.pytest_cache,.git,.hg,.svn,.stversions'
	\   . ',__pycache__,.sass-cache,*.egg-info,.DS_Store,*.pyc,*.swp'
	\ })

autocmd FileType defx call s:defx_mappings()


" ===
" === fzf  
" ===
nnoremap <silent> <Space>ag :Ag<CR>
nnoremap <silent> <Space>fi :Files<CR>


" ===
" === tagbar
" ===
nmap <F8> :TagbarToggle<CR>
" let g:tagbar_ctags_bin = 'ctags'            "tagbar以来ctags插件
" let g:tagbar_left = 1                       "让tagbar在页面左侧显示，默认右边
" let g:tagbar_width = 30                     "设置tagbar的宽度为30列，默认40
" let g:tagbar_autofocus = 1                  "这是tagbar一打开，光标即在tagbar页面内，默认在vim打开的文件内
" let g:tagbar_sort = 0                       "设置标签不排序，默认排序


" ===
" === set colorscheme
" ===
set background=dark
" colorscheme gruvbox
" colorscheme ayu
colorscheme desert
	


" ===
" === python-mode 
" ===
" let g:pymode_python ='python3'
" let g:pymode_trim_whitespaces = 1
" let g:pymode_doc = 1
" let g:pymode_doc_bink = 'K'
" let g:pymode_rope_goto_definition_bind = "<C-]>"
" let g:pymode_lint = 1
" let g:pymode_lint_checkers = ['pyflakes','pep8','mccabe','pylint']
" let g:pymode_options_max_line_length = 120
"


" ===
" === easy align
" ===
"  Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)
" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

" ===
" === markdown preview 
" ===
nmap <silent> <F9> <Plug>MarkdownPreview        " for normal mode
imap <silent> <F9> <Plug>MarkdownPreview        " for insert mode
nmap <silent> <F10> <Plug>StopMarkdownPreview    " for normal mode
imap <silent> <F10> <Plug>StopMarkdownPreview    " for insert mode
