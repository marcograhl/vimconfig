
set nocompatible              " be iMproved, required

so ~/.vim/plugins.vim

"-----------------------------Basicvisuells-----------------------------
set t_Co=256
syntax on
colorscheme candyman
set guifont=Source\ Code\ Pro\ Light:h16
hi LineNr guibg=bg
hi vertsplit guifg=bg guibg=bg
set guioptions-=T " Removes top toolbar
set guioptions-=r " Removes right hand scroll bar
set guioptions-=e 
set go-=L " Removes left hand scroll bar
set linespace=3
hi FoldColumn	guibg=bg guifg=bg
hi NonText guifg=bg
"-----------------------------Basics-Set-----------------------------
" by default, in insert mode backspace won't delete over line breaks, or 
" automatically-inserted indentation, let's change that
set backspace=indent,eol,start
set undofile
set history=100
set undolevels=100
" set , as mapleader
let mapleader = ","
set encoding=utf-8
set fileencoding=utf-8
set hidden 
" With :set hidden, opening a new file when the current buffer 
" has unsaved changes causes files to be hidden instead of closed
" therefore E37: No write since last change (add ! to override) wont be displayed
set laststatus=2    "To display the status line always
set scrolloff=8         "Start scrolling when we're 8 lines away from margins
set sidescrolloff=15
set sidescroll=1
set splitbelow
set splitright
set visualbell           " don't beep
set noerrorbells         " don't beep
set showmode                    " always show what mode we're currently editing in
set nowrap                      " don't wrap lines
set tags=tags
set shiftround                  " use multiple of shiftwidth when indenting with '<' and '>'
set copyindent                  " copy the previous indentation on autoindenting
set number                      " always show line numbers
set ignorecase                  " ignore case when searching
set smartcase                   " ignore case if search pattern is all lowercase,
set timeout timeoutlen=200 ttimeoutlen=100
set mouse=a

set grepprg=ag
nnoremap j gj
nnoremap k gk
nmap oo o<Esc>k
nmap OO O<Esc>j

" Easy Align
"" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)
" Indent show invisibles
nmap <leader>q :set list!<CR>
set listchars=tab:▸\ ,eol:¬
nnoremap <F11> :set invpaste paste?<CR>
set pastetoggle=<F11>
set showmode
set wildmode=list:longest
set wildmenu                "enable ctrl-n and ctrl-p to scroll thru matches
set wildignore=*.o,*.obj,*~ "stuff to ignore when tab completing
set wildignore+=*vim/backups*
set wildignore+=*sass-cache*
set wildignore+=*DS_Store*
set wildignore+=vendor/rails/**
set wildignore+=vendor/cache/**
set wildignore+=*.gem
set wildignore+=log/**
set wildignore+=tmp/**
set wildignore+=*.png,*.jpg,*.gif
"" Toggle relative line number
function! NumberToggle()
    if(&relativenumber)
        set norelativenumber
        set number
    else
        "" Uncomment the following to display a '0' instead of the line number
        set nonumber
        set relativenumber
    endif
endfunc
 
nnoremap <C-n> :call NumberToggle()<cr>
nnoremap <C-n><C-n>  :let &number=1-&number<CR>
" map   <silent> <A-n>   :let &number=1-&number<Bar>set number?<C
"-----------------------------tabs/spaces-----------------------------
set autoindent                  " always set autoindenting on
set expandtab
set shiftwidth=2
set softtabstop=2  
set showbreak="►\ "
nmap <leader>fc <Plug>FoldToggleColumn
"-----------------------------Mappings-----------------------------
"Easy Access the .vimrc file
nmap <Leader>ev :edit ~/.vimrc<cr>

inoremap II <Esc>I
inoremap AA <Esc>A
inoremap OO <Esc>O
inoremap CC <Esc>C
inoremap SS <Esc>S
inoremap DD <Esc>dd
inoremap UU <Esc>u
inoremap kj <Esc>
" Auto indent pasted text
" nnoremap p p=`]<C-o>
" nnoremap P P=`]<C-o>
" Make Y yank everything from the cursor to the end of the line. This makes Y
" act more like C or D because by default, Y yanks the current line (i.e. the
" same as yy).
noremap Y y$
nnoremap <silent> <F3> :set nowrap!<CR>:set nowrap?<CR>

"--NERDTREE
nmap - :NERDTreeToggle<cr>
nmap <D-d> :NERDTreeFind<cr>

" let NERDTreeHijackNetrw = 0 
" Ignore turds left behind by Mercurial.
let g:NERDTreeIgnore=['\.orig']
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'
" The default of 31 is just a little too narrow.
let g:NERDTreeWinSize=40
" Disable display of '?' text and 'Bookmarks' label.
let g:NERDTreeMinimalUI=1
" Single-click to toggle directory nodes, double-click to open non-directory
" nodes.
let g:NERDTreeMouseMode=2

"--CTrlp
nmap <D-r> :CtrlPBufTag<cr>
nmap <D-e> :CtrlPMRUFiles<cr>
let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git'
let g:ctrlp_match_window = 'top,order:btt,min:1,max:30,results:30'
"--GRep
let g:grep_cmd_opts = '--line-numbers --noheading'

"------------------------------------
" vim-grepper: Helps you win at grep.
"------------------------------------
let g:grepper={}
" Use the quickfix window.
let g:grepper.quickfix=1
" Open the quickfix window after the search finishes.
let g:grepper.open=1
" Switch to the quickfix window after the search finishes.
let g:grepper.switch=1
" Show the prompt by default.
let g:grepper.prompt=1
" Supported tools (use 'git' before 'ag').
let g:grepper.tools=['git', 'ag', 'ack', 'grep', 'findstr', 'sift', 'pt']
" Works like /, but uses vim-grepper to do the searching.
nnoremap <Leader>/ :Grepper<CR>
" Works like *, but uses vim-grepper to do the searching.
nnoremap <Leader>* :Grepper -cword -noprompt<CR>

" togglables without FN keys
nnoremap <leader>1 :GundoToggle<CR>

"make space in normal mode add space
nnoremap <Space> i<Space><Esc>l

nnoremap <C-j> <C-d>
nnoremap <C-k> <C-u>
nnoremap <leader>A :!ag 
nnoremap <leader>a :Ag! 
"----------------------------Buffers/Air-----------------------------
set autowriteall 
nnoremap <silent> <C-s> :w<CR>:wa<CR>
inoremap <silent> <C-s> <Esc>:w<CR><Esc>:wa<CR>
vnoremap <silent> <C-s> <Esc>:w<CR><Esc>:wa<CR>
" Check for changes in all buffers, automatically reload them, and redraw.
nnoremap <silent> <Leader>rr :set autoread <Bar> checktime <Bar> redraw! <Bar> set noautoread<CR>

"---- Bufftabline
let g:buftabline_numbers=2
hi! BufTabLineHidden guifg=#888888 guibg=#151515
hi! link BufTabLineActive Normal
hi! BufTabLineFill guibg=#242424
hi! link BufTabLineCurrent Function
nmap <D-1> <Plug>BufTabLine.Go(1)
nmap <D-2> <Plug>BufTabLine.Go(2)
nmap <D-3> <Plug>BufTabLine.Go(3)
nmap <D-4> <Plug>BufTabLine.Go(4)
nmap <D-5> <Plug>BufTabLine.Go(5)
nmap <D-6> <Plug>BufTabLine.Go(6)
nmap <D-7> <Plug>BufTabLine.Go(7)
nmap <D-8> <Plug>BufTabLine.Go(8)
nmap <D-9> <Plug>BufTabLine.Go(9)
nmap <D-0> <Plug>BufTabLine.Go(10)

nnoremap <Leader>q :Bdelete<CR>



" Easy bindings for its various modes
nmap <leader>bb :CtrlPBuffer<cr>
nmap <leader>bm :CtrlPMixed<cr>
nmap <leader>bs :CtrlPMRU<cr>
" Move to the next buffer
nmap <leader>l :bnext<CR>
" Move to the previous buffer
nmap <leader>j :bprevious<CR>
" Close all buffers
map <leader>ba :bufdo bd!<cr>
let g:indentLine_enabled = 1


" consistent menu navigation
inoremap <C-j> <C-n>
inoremap <C-k> <C-p>

" reload all open buffers
nnoremap <leader>ra :tabdo exec "windo e!"

" Keep search matches in the middle of the window.
nnoremap n nzzzv
nnoremap N Nzzzv

" clever-f prompt
let g:clever_f_show_prompt = 1
let g:clever_f_across_no_line = 1
nmap <F12> <Plug>(clever-f-reset)
let g:clever_f_repeat_last_char_inputs = ["\<CR>", "\<Tab>"]
inoremap kj <ESC>

let g:gundo_width = 60
let g:gundo_preview_height = 40
let g:gundo_right = 1
let g:gundo_help = 0
let g:gundo_close_on_revert = 1
"-----------------------------Split-Managment-----------------------------
"easier window navigation
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
"-----------------------------Search-----------------------------
" search settings
set incsearch        " find the next match as we type the search
set hlsearch         " hilight searches by default
nnoremap  <leader><space> :nohlsearch<CR>
" use ,space to remove search higlight
nnoremap <Leader><space> :noh<cr>

" Allows you to easily replace the current word and all its occurrences.
nnoremap <Leader>rc :%s/\<<C-r><C-w>\>/
vnoremap <Leader>rc y:%s/<C-r>"/

" Quickly select the text that was just pasted. This allows you to, e.g.,
" indent it after pasting.
noremap gV `[v`]
" Allows you to easily change the current word and all occurrences to something
" else. The difference between this and the previous mapping is that the mapping
" below pre-fills the current word for you to change.
nnoremap <Leader>cc :%s/\<<C-r><C-w>\>/<C-r><C-w>
vnoremap <Leader>cc y:%s/<C-r>"/<C-r>"

if executable("ag")
  let g:ackprg = "ag --nogroup --column"
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
endif

" session management
let g:session_directory = "~/.vim/session"
let g:session_autoload = "no"
let g:session_autosave = "no"
let g:session_command_aliases = 1
nnoremap <leader>so :OpenSession 
nnoremap <leader>ss :SaveSession 
nnoremap <leader>sd :DeleteSession<CR>
nnoremap <leader>sc :CloseSession<CR>
nnoremap <leader>d "_d
vnoremap <leader>d "_d
vnoremap <leader>p "_dP
let g:SuperTabDefaultCompletionType = "<C-X><C-O>"
map ; :
noremap ;; ;
inoremap ; :
inoremap : ;
"-----------------------------Auto-Commands-----------------------------
set complete=.,w,b,u,U,t,i,d
aug omnicomplete
    au!
    au FileType css,sass,scss,stylus,less setl omnifunc=csscomplete#CompleteCSS
    au FileType html,htmldjango,jinja,markdown setl omnifunc=emmet#completeTag
    au FileType javascript,jsx setl omnifunc=tern#Complete
    au FileType python setl omnifunc=pythoncomplete#Complete
    au FileType xml setl omnifunc=xmlcomplete#CompleteTags
  aug END
" autocmd BufNewFile,BufRead *.styl             set ft=styl.css  

function! StartUp()                                                                                                                                                                                         
    if 0 == argc()
        NERDTree
    end
endfunction
autocmd VimEnter * call StartUp()
" autocmd InsertEnter * :set number
" autocmd InsertLeave * :set relativenumber
"Automatically source the vimrc file on save.
augroup line_return
    au!
    au BufReadPost *
        \ if line("'\"") > 0 && line("'\"") <= line("$") |
        \     execute 'normal! g`"zvzz' |
        \ endif
augroup END

augroup autosourcing
  autocmd!
  autocmd BufWritePost .vimrc source %
augroup END

