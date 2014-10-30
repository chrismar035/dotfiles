" -----------------------------------------------------------------------------  
" |                            VIM Settings                                   |
" |                   (see gvimrc for gui vim settings)                       |
" |                                                                           |
" | Some highlights:                                                          |
" |   jj = <esc>  Very useful for keeping your hands on the home row          |
" |   ,n = toggle NERDTree off and on                                         |
" |                                                                           |
" |   ,f = fuzzy find all files                                               |
" |   ,b = fuzzy find in all buffers                                          |
" |                                                                           |
" |   hh = inserts '=>'                                                       |
" |   aa = inserts '@'                                                        |
" |                                                                           |
" |   ,h = new horizontal window                                              |
" |   ,v = new vertical window                                                |
" |                                                                           |
" |   ,i = toggle invisibles                                                  |
" |                                                                           |
" |   enter and shift-enter = adds a new line after/before the current line   |
" |                                                                           |
" |   :call Tabstyle_tabs = set tab to real tabs                              |
" |   :call Tabstyle_spaces = set tab to 2 spaces                             |
" |                                                                           |
" | Put machine/user specific settings in ~/.vimrc.local                      |
" -----------------------------------------------------------------------------  

set encoding=utf-8
set nocompatible

" re-map leader first
" with a map leader it's possible to do extra key combinations
let mapleader = ","
let g:mapleader = ","

set viminfo='100,f1

" Tabs ************************************************************************
"set sta " a <Tab> in an indent inserts 'shiftwidth' spaces

function! Tabstyle_tabs()
  " Using 4 column tabs
  set softtabstop=4
  set shiftwidth=4
  set tabstop=4
  set noexpandtab
  autocmd User Rails set softtabstop=4
  autocmd User Rails set shiftwidth=4
  autocmd User Rails set tabstop=4
  autocmd User Rails set noexpandtab
endfunction

function! Tabstyle_spaces()
  " Use 2 spaces
  set softtabstop=2
  set shiftwidth=2
  set tabstop=2
  set expandtab
endfunction

call Tabstyle_spaces()

set wildmenu
"set wildmode=list:longest,full
set wildmode=longest,list:longest

set backup
set backupdir=~/vim-backup
set dir=~/vim-swap

nnoremap <silent> ,t :TlistToggle<CR>
let Tlist_GainFocus_On_ToggleOpen = 1
let Tlist_Auto_Highlight_Tag = 1
let Tlist_Close_On_Select = 1
let Tlist_Use_Right_Window = 1

" Indenting *******************************************************************
set ai " Automatically set the indent of a new line (local to buffer)
set si " smartindent	(local to buffer)


" Scrollbars ******************************************************************
set sidescrolloff=2
set numberwidth=4


" Windows *********************************************************************
set equalalways " Multiple windows, when created, are equal in size
set splitbelow splitright

"Vertical split then hop to new buffer
"noremap ,v :vsp^M^W^W<cr>
"noremap ,h :split^M^W^W<cr>

" Open the current file in a new vertical split
noremap <silent> <leader>vs :<C-u>let @z=&so<CR>:set so=0 noscb<CR>:bo vs<CR>Ljzt:set scb<CR><C-w>p:set scb<CR>:let &so=@z<CR>

" Cursor highlights ***********************************************************
set cursorline
"set cursorcolumn


" Searching *******************************************************************
set hlsearch  " highlight search
set incsearch  " incremental search, search as you type
set ignorecase " Ignore case when searching 
set smartcase " Ignore case when searching lowercase

" In visual mode when you press * or # to search for the current selection
vnoremap <silent> * :call VisualSearch('f')<CR>
vnoremap <silent> # :call VisualSearch('b')<CR>

function! CmdLine(str)
  exe "menu Foo.Bar :" . a:str
  emenu Foo.Bar
  unmenu Foo
endfunction

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


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Spell checking
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Pressing ,ss will toggle and untoggle spell checking
map <leader>ss :setlocal spell!<cr>

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
syntax on " syntax highlighting
colorscheme superman


" Status Line *****************************************************************
set showcmd
set noruler  "don't show ruler in favor of user-defined statusline
set laststatus=2  "enable user-defined statusline"
"set ch=2  "make command line two lines high

hi User1  guifg=#FFFFB6  guibg=NONE  gui=NONE  ctermfg=yellow  ctermbg=darkgray  cterm=NONE
hi User2  guifg=#FF73FD  guibg=NONE  gui=NONE  ctermfg=lightblue ctermbg=darkgray  cterm=NONE
set statusline=%n\ %F%2*%y%*%m%r%=%1*%{fugitive#statusline()}%*\ %l,%c%V\ %P


" Line Wrapping ***************************************************************
set nowrap
set linebreak  " Wrap at word
autocmd BufWinEnter * let w:m2=matchadd('Search', '\%>80v.\%>77v', -1)
autocmd BufWinEnter * let w:m2=matchadd('Error',  '\%>80v.\+',     -1)

" custom vim-surround surroundings
let g:surround_35 = "#{\r}"
let g:surround_36 = "\"#{\r}\""
let g:surround_37 = "{% \r %}"

" Mappings ********************************************************************
" Professor VIM says '87% of users prefer jj over esc', jj abrams disagrees
imap kj <Esc>
imap uu _
imap hh =>
imap aa @
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
map <leader>e :e! ~/.vimrc<cr>

" Whem vimrc is edited, reload it
autocmd! bufwritepost vimrc source ~/.vimrc

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

" Directories *****************************************************************
" Setup backup location and enable
"set backupdir=~/backup/vim
"set backup

" Set Swap directory
"set directory=~/backup/vim/swap

" Sets path to directory buffer was loaded from
"autocmd BufEnter * lcd %:p:h


" File Stuff ******************************************************************
filetype plugin indent on
au BufNewFile,BufRead *.rxls set filetype=ruby
au BufNewFile,BufRead *.gtr set filetype=guitar
au BufNewFile,BufRead *_steps.rb set filetype=cucumber
" To show current filetype use: set filetype

"autocmd FileType html :set filetype=xhtml 

"autocmd FileType html,xml,php so ~/.vim/plugin/html_autoclosetag.vim

" Strip trailing whitespace from certain file types
autocmd FileType c,cpp,java,php,ruby,scss,feature,python,haml,javascript,scss autocmd BufWritePre <buffer> :%s/\s\+$//e
" autocmd BufWritePost * silent execute "!git stripspace < <afile>" | redraw!
nnoremap <silent> <F6> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar>:nohl<CR>
" Highlight trailing whitespace
match LongLineWarning /\s\+$/
" Highlight tab characters
match Error /\t/

" Inser New Line **************************************************************
map <S-Enter> O<ESC> " awesome, inserts new line without going into insert mode
map <Enter> o<ESC>
"set fo-=r " do not insert a comment leader after an enter, (no work, fix!!)


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


" Mouse ***********************************************************************
"set mouse=a " Enable the mouse
"behave xterm
"set selectmode=mouse


" Cursor Movement *************************************************************
" Make cursor move by visual lines instead of file lines (when wrapping)
map <up> gk
map k gk
imap <up> <C-o>gk
map <down> gj
map j gj
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
set foldmethod=syntax
set foldlevelstart=1
set foldminlines=5
set foldnestmax=2

" -----------------------------------------------------------------------------  
" |                              Plug-ins                                     |
" -----------------------------------------------------------------------------  

" DWM settings **************************************************************
let g:dwm_master_pane_width=95

" NERDTree ********************************************************************
:noremap <leader>n :NERDTreeToggle<CR>

" User instead of Netrw when doing an edit /foobar
let NERDTreeHijackNetrw=1

" Single click for everything
let NERDTreeMouseMode=1

" use old school tree indicators w/o unicode
let g:NERDTreeDirArrows=0


" SnippetsEmu *****************************************************************
"imap <unique> <C-j> <Plug>Jumper
"let g:snip_start_tag = "_\."
"let g:snip_end_tag = "\._"
"let g:snip_elem_delim = ":"
"let g:snip_set_textmate_cp = '1'  " Tab to expand snippets, not automatically.


" fuzzyfinder_textmate ********************************************************
"map ,f :FuzzyFinderTextMate<CR>
"map ,b :FuzzyFinderBuffer<CR>
"let g:fuzzy_ignore = '.o;.obj;.bak;.exe;.pyc;.pyo;.DS_Store;.db'

" autocomplpop ***************************************************************
" complete option
"set complete=.,w,b,u,t,k
"let g:AutoComplPop_CompleteOption = '.,w,b,u,t,k'
"set complete=.
let g:AutoComplPop_IgnoreCaseOption = 0
let g:AutoComplPop_BehaviorKeywordLength = 2


" Command-T ****************************************************************
let g:CommandTMaxHeight = 15
set wildignore+=*.o,*.obj,.git,*.pyc
"noremap <leader>j :CommandT<cr>
noremap <leader>y :CommandTFlush<cr>

" Ctrl-P *******************************************************************
noremap <leader>j :CtrlPMixed<cr>

" AutoScrollMode ***********************************************************
noremap <leader>. :call AutoScrollMode()<CR>

" -----------------------------------------------------------------------------
" |                               Host specific                               |
" -----------------------------------------------------------------------------
if filereadable(expand("~/.vimrc.local"))
  source ~/.vimrc.local
endif

call pathogen#infect()

" -----------------------------------------------------------------------------
" |                               Syntastic                                   |
" -----------------------------------------------------------------------------
let g:syntastic_check_on_open=1
let g:syntastic_echo_current_error=0
let g:syntastic_auto_jump=1
let g:syntastic_auto_loc_list_height=3
let g:syntastic_auto_loc_list=1
let g:syntastic_mode_map = { 'passive_filetypes': ['cucumber'], 'mode': 'active' }


" -----------------------------------------------------------------------------
" |                               ack.vim                                     |
" -----------------------------------------------------------------------------
let g:ackprg = 'ag --nogroup --nocolor --column'

" -----------------------------------------------------------------------------
" |                             easybuffer.vim                                |
" -----------------------------------------------------------------------------
noremap <leader>f :EasyBuffer<CR>

" -----------------------------------------------------------------------------
" |                                HARD MODE                                  |
" -----------------------------------------------------------------------------
"autocmd VimEnter,BufNewFile,BufReadPost * silent! call HardMode()

" -----------------------------------------------------------------------------
" |                                 DISPATCH                                  |
" -----------------------------------------------------------------------------
nnoremap <F4> :Dispatch!<CR>
nnoremap <F3> :Dispatch<CR>

" -----------------------------------------------------------------------------
" |                              Google Calendar                              |
" -----------------------------------------------------------------------------
let g:calendar_google_calendar = 1

" -----------------------------------------------------------------------------
" |                                Vim Rspec                                  |
" -----------------------------------------------------------------------------
" RSpec.vim mappings
map <Leader>r :call RunCurrentSpecFile()<CR>
map <Leader>h :call RunNearestSpec()<CR>
map <Leader>l :call RunLastSpec()<CR>
map <Leader>a :call RunAllSpecs()<CR>
let g:rspec_command = "compiler rspec | set makeprg=zeus | Make rspec {spec}"
