" -------------------------------------------------------------------
" |                           Chris's NeoVim settings               |
" | Leader to ,                                                     |
" -------------------------------------------------------------------

set encoding=utf-8

" re-map leader first
" with a map leader it's possible to do extra key combinations
let mapleader = ","
let g:mapleader = ","

set viminfo='100,f1

" Prevent that q window thingy
map q: :q
noremap Q @@

" Use 2 spaces
set softtabstop=2
set shiftwidth=2
set tabstop=2
set expandtab

set wildmenu
set wildmode=longest,list:longest

set nobackup
set nowritebackup

" Persistent undo
set undofile
set undodir=$HOME/.config/nvim/.vim-undo
set undolevels=1000
set undoreload=10000
set hidden

" limit syntax highlighting to 120 chars
set synmaxcol=120


" Indenting *******************************************************************
set ai " Automatically set the indent of a new line (local to buffer)
set si " smartindent	(local to buffer)

" Scrollbars ******************************************************************
set sidescrolloff=2
set numberwidth=4

"Vertical split then hop to new buffer
"noremap ,v :vsp^M^W^W<cr>
"noremap ,h :split^M^W^W<cr>

" Open the current file in a new vertical split
noremap <silent> <leader>vs :<C-u>let @z=&so<CR>:set so=0 noscb<CR>:bo vs<CR>Ljzt:set scb<CR><C-w>p:set scb<CR>:let &so=@z<CR>

" Cursor highlights ***********************************************************
set cursorline

" Searching *******************************************************************
set hlsearch  " highlight search
set incsearch  " incremental search, search as you type
set inccommand=nosplit " incremental search/replace
set ignorecase " Ignore case when searching
set smartcase " Ignore case when searching lowercase
" Remove current search highlighting
noremap <leader><space> :noh<CR>

" In visual mode when you press * or # to search for the current selection
vnoremap <silent> * :call VisualSearch('b')<CR>
vnoremap <silent> # :call VisualSearch('f')<CR>

" From an idea by Michael Naumann
function! VisualSearch(direction) range
  let l:saved_reg = @"
  execute "normal! vgvy"

  let l:pattern = escape(@", '\\/.*$^~[]'")
  let l:pattern = substitute(l:pattern, "\n$", "", "")

  if a:direction == 'b'
    execute "normal ?" . l:pattern . "^M"
  elseif a:direction == 'gv'
    call CmdLine("vimgrep " . '/'. l:pattern . '/' . ' **/*.')
  elseif a:direction == 'f'
    execute "normal /" . l:pattern . "^M"
  endif

  let @/ = l:pattern
  let @" = l:saved_reg
endfunction

function! CmdLine(str)
  exe "menu Foo.Bar :" . a:str
  emenu Foo.Bar
  unmenu Foo
endfunction

" Macros *******************************************************************
" Convert to Ruby 1.9 style hash syntax
let @h = 'F:xel2xr:'
"
" Wrap this line at 80 chars
let @w = 'g080lF i'

" Wrap method parameters
let @p = 'f,a'
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Spell checking
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Pressing ,s will toggle and untoggle spell checking
map <leader>s :setlocal spell! spelllang=en_us<CR>

"Shortcuts using <leader>
map <leader>sn "s
map <leader>sp [s
map <leader>sa zg
map <leader>s? z=]


" Colors **********************************************************************
if $COLORTERM == 'gnome-terminal'
  set t_Co=256
endif
set background=dark
set termguicolors
syntax on " syntax highlighting
syntax sync minlines=256
set synmaxcol=300


" Status Line *****************************************************************
set showcmd
set noruler  "don't show ruler in favor of user-defined statusline
set laststatus=2  "enable user-defined statusline"

hi User1  guifg=#FFFFB6  guibg=NONE  gui=NONE  ctermfg=yellow  ctermbg=darkgray  cterm=NONE
hi User2  guifg=#FF73FD  guibg=NONE  gui=NONE  ctermfg=lightblue ctermbg=darkgray  cterm=NONE
set statusline=%n\ %F%2*%y%*%m%r%=%1*%{fugitive#statusline()}%*\ %l,%c%V\ %P


" Line Wrapping ***************************************************************
set nowrap
set linebreak  " Wrap at word
autocmd BufWinEnter * let w:m2=matchadd('Search', '\%>80v.\%>77v', -1)
autocmd BufWinEnter * let w:m2=matchadd('Error',  '\%>80v.\+',     -1)

" Mappings ********************************************************************
" Professor VIM says '87% of users prefer jj over esc', jj abrams disagrees
imap kj <Esc>
inoremap <Left> <NOP>
inoremap <Right> <NOP>
inoremap <Up> <NOP>
inoremap <Down> <NOP>

nmap <F3> G<CR><CR>a<C-R>=strftime("%Y-%m-%d %a %I:%M %p")<CR><CR>
imap <F3> <CR><C-R>=strftime("%Y-%m-%d %a %I:%M %p")<CR><CR>

" Fast Saving
nmap <leader>w :w!<cr>
nmap <leader>m :w!<cr>

" Quick Git Blame
nmap <leader>g :Gblame<cr>

" Quick Open file in github
nmap <leader>o :Gbrowse<cr>

" Fast editing of the .vimrc file
let MYVIMRC = "~/.confim/nvim/init.vim"
map <leader>e :e! $MYVIMRC<cr>

" Whem vimrc is edited, reload it
autocmd! bufwritepost $MYVIMRC source $MYVIMRC

" Close buffer
map <leader>q :bdelete<cr>

" set 7 lines to the cursors - when moving vertical.
set so=7

" Quick View Port (splits) Switching
map <C-l> <C-w>l
map <C-k> <C-w>k
map <C-j> <C-w>j
map <C-h> <C-w>h

" Move Tabs left and right with meta+<left> & meta+<right>
nnoremap <silent> <A-Left> :execute 'silent! tabmove ' . (tabpagenr()-2)<CR>
nnoremap <silent> <A-Right> :execute 'silent! tabmove ' . tabpagenr()<CR>

" Go to next or previous tabs with J and K (MIB settings)
" noremap H gT
" noremap L gt

" Toggle line numbers
nnoremap <leader>l :set nonumber!<CR>

" Toggle paste mode
set pastetoggle=<leader>p

" File Stuff ******************************************************************
filetype plugin indent on
au BufNewFile,BufRead *.rxls set filetype=ruby
au BufNewFile,BufRead *.gtr set filetype=guitar
au BufNewFile,BufRead *_steps.rb set filetype=cucumber
" To show current filetype use: set filetype

" Strip trailing whitespace from certain file types
autocmd FileType c,cpp,java,php,ruby,scss,feature,python,haml,javascript,scss autocmd BufWritePre <buffer> :%s/\s\+$//e

" Inser New Line **************************************************************
map <S-Enter> O<ESC> " awesome, inserts new line without going into insert mode
map <Enter> o<ESC>


" Sessions ********************************************************************
" Sets what is saved when you save a session
set sessionoptions=blank,localoptions,options,buffers,curdir,folds,help,resize,tabpages,winsize


" Misc ************************************************************************
set backspace=indent,eol,start
set number " Show line numbers
set matchpairs+=<:>
set vb t_vb= " Turn off bell, this could be more annoying, but I'm not sure how


" Invisible characters *********************************************************
set listchars=trail:.,tab:>-,eol:$
set nolist
:noremap <leader>i :set list!<CR> " Toggle invisible chars


" Cursor Movement *************************************************************
" Make cursor move by visual lines instead of file lines (when wrapping)
map <up> gk
imap <up> <C-o>gk
map <down> gj
imap <down> <C-o>gj
map E ge


" Ruby stuff ******************************************************************
"compiler ruby         " Enable compiler support for ruby
map <F5> :!ruby %<CR>

autocmd FileType ruby let b:dispatch = 'zeus rspec %'


" Omni Completion *************************************************************
autocmd FileType html :set omnifunc=htmlcomplete#CompleteTags
autocmd FileType python set omnifunc=pythoncomplete#Complete
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags
autocmd FileType php set omnifunc=phpcomplete#CompletePHP
autocmd FileType c set omnifunc=ccomplete#Complete
" May require ruby compiled in
"ruby
autocmd FileType ruby,eruby set omnifunc=rubycomplete#Complete
autocmd FileType ruby,eruby let g:rubycomplete_buffer_loading = 1
autocmd FileType ruby,eruby let g:rubycomplete_rails = 1
autocmd FileType ruby,eruby let g:rubycomplete_classes_in_global = 1
au BufRead,BufNewFile *.rabl setf ruby
"improve autocomplete menu color
highlight Pmenu ctermbg=238 gui=bold

set completeopt=menu,preview


" Folding *********************************************************************
set nofoldenable   " disable folding
" set foldmethod=syntax
" set foldlevelstart=1
" set foldminlines=5
" set foldnestmax=2


" -----------------------------------------------------------------------------
" |                               Host specific                               |
" -----------------------------------------------------------------------------
if filereadable(expand("~/.vimrc.local"))
  source ~/.vimrc.local
endif




" -----------------------------------------------------------------------------
" -----------------------------------------------------------------------------
" |                               Plugins                                     |
" -----------------------------------------------------------------------------
" -----------------------------------------------------------------------------
if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
  silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')

" Unused theme plugins
" Plug 'gilgigilgil/anderson.vim'
" Plug 'gosukiwi/vim-atom-dark'

" Colors
" Plug 'tristen/superman'
Plug 'tyrannicaltoucan/vim-deep-space'

" Markdown
Plug 'godlygeek/tabular' | Plug 'plasticboy/vim-markdown'
Plug 'jtratner/vim-flavored-markdown'

" Snippets
Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'

" Editing
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-abolish'
Plug 'justinmk/vim-sneak'
Plug 'machakann/vim-sandwich'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'ntpeters/vim-better-whitespace'

Plug 'prettier/vim-prettier', {
  \ 'do': 'npm install',
  \ 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue', 'yaml'] }

" HTML
Plug 'mattn/emmet-vim'

" Git
Plug 'tpope/vim-fugitive'
Plug 'whiteinge/diffconflicts'

" Go
Plug 'fatih/vim-go', { 'for': 'go' }

" Ruby
Plug 'tpope/vim-endwise', { 'for': 'ruby' }
Plug 'tpope/vim-rails', { 'for': 'ruby' }
Plug 'vim-ruby/vim-ruby', { 'for': 'ruby' }
Plug 'mattn/vim-rubyfmt', { 'for': 'ruby' }
Plug 'thoughtbot/vim-rspec', { 'for': 'ruby' }
Plug 'tpope/vim-haml', { 'for': 'haml' }
Plug 'tpope/vim-cucumber', { 'for': 'cucumber' }

call plug#end()

" colors *********************************************************************
" colorscheme superman
colorscheme deep-space

" autocomplpop ***************************************************************
" complete option
"set complete=.,w,b,u,t,k
"let g:AutoComplPop_CompleteOption = '.,w,b,u,t,k'
"set complete=.
let g:AutoComplPop_IgnoreCaseOption = 0
let g:AutoComplPop_BehaviorKeywordLength = 2


" -----------------------------------------------------------------------------
" |                                  fzf                                      |
" -----------------------------------------------------------------------------
noremap <leader>j :Files<cr>
noremap gb :Buffers<cr>
let g:fzf_buffers_jump = 1

" -----------------------------------------------------------------------------
" |                                Vim Rspec                                  |
" -----------------------------------------------------------------------------
" RSpec.vim mappings
au FileType ruby map <Leader>r :call RunCurrentSpecFile()<CR>
au FileType ruby map <Leader>h :call RunNearestSpec()<CR>
au FileType ruby map <Leader>l :call RunLastSpec()<CR>
au FileType ruby map <Leader>a :call RunAllSpecs()<CR>
let g:rspec_command = "compiler rspec | set makeprg=zeus | Make rspec {spec}"

" -----------------------------------------------------------------------------
" |                                UltiSnips                                   |
" -----------------------------------------------------------------------------
let g:UltiSnipsExpandTrigger="<leader>u"
let g:UltiSnipsJumpForwardTrigger="<c-a>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" -----------------------------------------------------------------------------
" |                                vim-go                                     |
" -----------------------------------------------------------------------------
au FileType go nmap <leader>r <Plug>(go-run)
au FileType go nmap <leader>b <Plug>(go-build)
au FileType go nmap <leader>t <Plug>(go-test)
au FileType go nmap <leader>c <Plug>(go-coverage)
au FileType go nmap <leader>v <Plug>(go-vet)

au FileType go nmap <Leader>gd <Plug>(go-def)

" Show interfaces implemented under cursor
au FileType go nmap <Leader>s <Plug>(go-implements)

" Switch to declarations in directory
au FileType go nmap <Leader>d :GoDeclsDir<CR>

let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1

let g:go_fmt_command = "goimports"

let g:go_auto_type_info = 1
let g:go_doc_popup_window = 1

" -----------------------------------------------------------------------------
" |                             vim-rubyfmt                                   |
" -----------------------------------------------------------------------------
let g:rubyfmt_autoopen = 1

" -----------------------------------------------------------------------------
" |                               coc-vim                                     |
" -----------------------------------------------------------------------------
" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
" inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position. Coc only does snippet and additional edit on confirm.
" if has('patch8.1.1068')
"   " Use `complete_info` if your (Neo)Vim version supports it.
"   inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
" else
"   imap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
" endif

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

let g:coc_global_extensions = [ 'coc-css', 'coc-emmet', 'coc-html', 'coc-json', 'coc-svg', 'coc-yank', 'coc-prettier' ]

" -----------------------------------------------------------------------------
" |                              vim-prettier                                  |
" -----------------------------------------------------------------------------
let g:prettier#autoformat = 1
let g:prettier#autoformat_require_pragma = 0
let g:prettier#exec_cmd_async = 1

" -----------------------------------------------------------------------------
" |                         vim-better-whitespace                             |
" -----------------------------------------------------------------------------
let g:better_whitespace_enabled=1
let g:strip_whitespace_on_save=1
let g:strip_whitelines_at_eof=1
