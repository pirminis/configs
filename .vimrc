set shell=/bin/bash

" leader key configuration
nnoremap <Space> <Nop>
let mapleader="\<Space>"
let maplocalleader="\<Space>"

" shows identifier of syntax symbol; useful when creating/modifying color
" themes
map ,q :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<'
\ . synIDattr(synID(line("."),col("."),0),"name") . "> lo<"
\ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>

" swap 'goto mark' keys
nnoremap ` '
nnoremap ' `

" goto EOF and center line
" nnoremap G Gzz

" swap 'create mark' and 'select register'
nnoremap " m
nnoremap m "
xnoremap " m
xnoremap m "

" faster navigation
nnoremap = 10j
nnoremap + 10k

" do no skip wrapped fake line
nnoremap j gj
nnoremap k gk

vmap ' <S-s>'
vmap '' <S-s>"

" UX surround
vmap s S
xmap s S

" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

" previous tab
nmap <Backspace> gT<CR>

" next tab
nmap <S-Backspace> gt<CR>

" clear all folds
nmap <leader>z zRzz

" fold around selected lines
vnoremap <Leader>za <Esc>`<kzfgg`>jzfG`<

" search using ripgrep ([g]o [f]ind)
nmap gf :GrepperRg ''<left>

" search selected text in files using ripgrep ([g]o [s]earch)
nmap gs  <plug>(GrepperOperator)
xmap gs  <plug>(GrepperOperator)

" open .vimrc
nmap ,g :tabe $MYVIMRC<CR>

" reload config file
nmap ,s :w<CR>:source $MYVIMRC<CR>

" toggle wrap
nmap ,w :set wrap!<CR>

" regenerate ctags
nmap <leader>0 :GutentagsUpdate!<CR>

" next error
nnoremap } :cn<CR>

" prev error
nnoremap { :cN<CR>

" select lines
nmap vv V

" select to the end of line
nmap <leader>v v$<left>

" select to the start of line
nmap <leader>V v^

" fuzzy find files
nmap <leader>p :Files<CR>

" fuzzy find buffers
nmap <leader>b :Buffers<CR>

" fuzzy find lines in file
nmap <leader>l :BLines<CR>

" fuzzy find any line on any file in the project
nmap <leader>r :Rg<CR>

" fuzzy find any method in the project
nmap <leader>d :Tags<CR>

" fuzzy select file type in the current buffer
nmap <leader>f :Filetypes<CR>

" insert at the end of line
nmap <leader>a <S-A>

" create empty line above
nmap <leader>o <S-O>

" insert at the start of line
nmap <leader>i <S-I>

" highlight word under cursor
nmap <leader>1 g*
vmap <leader>1 g*

" turn highlight off
nnoremap <leader><leader> :noh<CR>:echo "OK"<CR>

" put cursor at the end of line
nmap tl $
vmap tl $

" put cursor at the start of line
nmap th ^
vmap th ^

" goto declaration [1]
nmap <leader>j <C-w><C-]><C-w>T

" return from [1]
nmap <leader>k <C-w><C-n><C-w>T<C-o><C-o>

" redo
nmap <S-u> <C-R>

" save file
nmap s :w<CR>

" switch between windows
nmap <Tab> <C-w><C-w>

" comment line (-s)
nmap <leader>w gcc
vmap <leader>w gc

" indent left
nnoremap <S-r> <<
vnoremap <S-r> <gv

" indent right
nnoremap r >>
vnoremap r >gv

" escape insert mode in insert mode
imap jk <esc>

" close current buffer
nnoremap - :bd<CR>

" force close current buffer
nmap _ :bd!<CR>

" close quickfix window
nmap <Leader>c :ccl<CR>
nmap cc :ccl<CR>

" stay in place while searching
map *  <Plug>(asterisk-z*)
map #  <Plug>(asterisk-z#)
map g* <Plug>(asterisk-gz*)
map g# <Plug>(asterisk-gz#)

" autocmds
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter,BufEnter * :Rooter
autocmd User Grepper :resize 15

" highlight word under your cursor
" autocmd CursorHold * exe printf('match MatchParen /\V\<%s\>/', escape(expand('<cword>'), '/\'))

" settings
" set virtualedit =all
set pumheight   =15
set updatetime  =500
set foldmethod  =manual
set timeoutlen=1300 ttimeoutlen=0
set bufhidden   ="delete"
set backspace   =indent,eol,start
set fileformats ="unix"
set conceallevel=0
set history     =4000
set scrolloff   =4
set tabstop     =2
set shiftwidth  =2
set softtabstop =2
set tags        =./tags,tags;
set wildmode    =longest:full,full
set guifont     =jetmono:h13
set antialias
set guicursor  +=a:blinkon0
set lines       =999
set columns     =9999
set clipboard   =unnamed
set statusline +=%#warningmsg#
set statusline +=%{SyntasticStatuslineFlag()}
set statusline +=%*
set statusline +=%{gutentags#statusline('[Generating...]')}
set encoding    =utf8
set t_vb        =
set laststatus  =2
set linespace   =1
set showtabline =2
set foldtext    ='\ '
set fdo         -=search
set wildignore +=*/.git/*,*/.hg/*,*/.svn/*,*/.idea/*,*/.DS_Store,*/vendor,*/tmp,*/log
" set list listchars=tab:>·,trail:·,precedes:<,extends:>,space:·
set nolist
set autoread
set smartindent
set number
set norelativenumber
set nocompatible
set hidden
set splitbelow
set splitright
set lazyredraw
set smarttab
set expandtab
set ignorecase
set hlsearch
set incsearch
set noswapfile
set nobackup
set nowb
set wildmenu
set ttyfast
set nowrap
" set wrap
set noerrorbells
set novisualbell
set guioptions-=r
set guioptions-=R
set guioptions-=l
set guioptions-=L
set nocursorline
" set cursorline
set showcmd
set completeopt-=preview

filetype off

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" plugins
Plugin 'VundleVim/Vundle.vim'
Plugin 'tpope/vim-rails'
Plugin 'thoughtbot/vim-rspec'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'vim-ruby/vim-ruby'
Plugin 'scrooloose/syntastic'
Plugin 'tpope/vim-surround'
Plugin 'pangloss/vim-javascript'
Plugin 'tpope/vim-commentary'
Plugin 'airblade/vim-rooter'
Plugin 'ludovicchabant/vim-gutentags'
Plugin 'godlygeek/tabular'
Plugin 'ntpeters/vim-better-whitespace'
Plugin 'jiangmiao/auto-pairs'
Plugin 'tpope/vim-endwise'
Plugin 'tpope/vim-haml'
Plugin 'mhinz/vim-grepper'
Plugin 'dhruvasagar/vim-table-mode'
Plugin 'junegunn/vim-easy-align'
Plugin 'kana/vim-textobj-user'
Plugin 'kana/vim-textobj-line'
Plugin 'junegunn/fzf'
Plugin 'junegunn/fzf.vim'
Plugin 'wsdjeg/vim-lua'
Plugin 'Valloric/YouCompleteMe'
Plugin 'haya14busa/vim-asterisk'
Plugin 'Yggdroot/indentLine'
Plugin 'elzr/vim-json'
Plugin 'tommcdo/vim-lister'
Plugin 'preservim/vim-markdown'
Plugin 'alvan/vim-closetag'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" let loaded_netrwPlugin                              = 1
let ruby_operators                                  = 1
let ruby_pseudo_operators                           = 1
let ruby_space_errors                               = 1
let ruby_line_continuation_error                    = 1
let ruby_global_variable_error                      = 1
let g:rooter_patterns                               = ['.git/']
let g:rooter_silent_chdir                           = 1
let g:rooter_resolve_links                          = 1
let g:rooter_change_directory_for_non_project_files = 'home'
let g:asterisk#keeppos                              = 1
let g:vim_json_syntax_conceal                       = 0
let g:syntastic_always_populate_loc_list            = 1
let g:syntastic_auto_loc_list                       = 0
let g:syntastic_check_on_open                       = 1
let g:syntastic_check_on_wq                         = 0
let g:syntastic_loc_list_height                     = 6
let g:syntastic_enable_highlighting                 = 1
let g:airline_right_alt_sep                         = ""
let g:airline_right_sep                             = ""
let g:airline_left_alt_sep                          = ""
let g:airline_left_sep                              = ""
let g:airline_theme                                 = "sol"
let g:airline#extensions#tabline#enabled            = 1
let g:airline#extensions#tabline#fnamemod           = ':t'
let g:airline#extensions#ale#enabled                = 1
let g:airline#extensions#tabline#show_splits        = 0
let g:gutentags_enabled                             = 1
let g:gutentags_ctags_exclude                       = ["tmp/*", "log/*", "vendor/*", "test/*", ".git/*", "*.scss", "*.css", "public/assets/*"]
let g:gutentags_generate_on_missing                 = 1
let g:gutentags_generate_on_write                   = 0
let g:gutentags_generate_on_new                     = 1
let g:gutentags_generate_on_empty_buffer            = 1
let g:gutentags_file_list_command                   = "git ls-files | rg -v 'public/assets'"
let g:indentLine_color_gui                          = '#cccccc'
let g:indentLine_char                               = "·"
let g:indentLine_first_char                         = "·"
let g:indentLine_enabled                            = 0
let g:indentLine_showFirstIndentLevel               = 1
let g:AutoPairsMapSpace                             = 1
let g:better_whitespace_enabled                     = 1
let g:strip_whitespace_confirm                      = 0
let g:strip_whitespace_on_save                      = 1
let g:AutoPairsShortcutToggle                       = '<C-p>'
let g:AutoPairsFlyMode                              = 0
let delimitMate_jump_expansion                      = 1
let macvim_skip_colorscheme                         = 1

" let g:rg_binary                                     = "/usr/local/bin/rg"
" let g:rg_highlight                                  = 1
" let g:rg_format                                     = "%f:%l:%c:%m"
" let g:rg_command                                    = g:rg_binary . " --vimgrep --follow -i -j1 -e"
" let g:rg_derive_root                                = 1
let g:solarized_visibility                          = "low"
" let g:ctrlp_working_path_mode                       = 'ra'
" " let g:ctrlp_user_command                            = ['.git', 'cd %s && git ls-files . -co --exclude-standard']
" let g:ctrlp_user_command                            = ['.git', 'cd %s && rg "" -l --no-hidden --sort-files']
" let g:ctrlp_use_caching                             = 0
" let g:ctrlp_lazy_update                             = 0
" let g:ctrlp_match_window                            = 'bottom,order:btt,min:1,max:15,results:15'
" let g:ctrlp_buffer_func = {
"   \ 'enter': 'HideStatusLine',
"   \ 'exit': 'RestoreStatusLine'
"   \ }
let g:fzf_layout = { 'down': '~40%' }
let g:fzf_action = { 'enter': 'tab split' }
let g:fzf_preview_window = ''
let g:fzf_colors =
\ { 'hl':      ['fg', 'String'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'fg':      ['fg', 'Normal'],
  \ 'fg+':     ['fg', 'Normal', 'Normal', 'Normal'],
  \ 'bg+':     ['fg', 'Comment'],
  \ 'hl+':     ['fg', 'String'] }

function! HideStatusLine()
  let g:laststatus_last_value=&laststatus
  set laststatus=0
endfunction

function! RestoreStatusLine()
  let &laststatus=g:laststatus_last_value
endfunction

function! CleanEmptyBuffers()
  let buffers = filter(range(1, bufnr('$')), 'buflisted(v:val) && empty(bufname(v:val)) && bufwinnr(v:val)<0 && !getbufvar(v:val, "&mod")')
  if !empty(buffers)
    exe 'bw ' . join(buffers, ' ')
  endif
endfunction

let g:errors_are_open = 0

function! ToggleErrors()
  if g:errors_are_open
    lcl
    let g:errors_are_open = 0
  else
    lopen
    let g:errors_are_open = 1
  endif
endfunction

nmap <leader>e :call ToggleErrors()<cr>

let g:rufo_auto_formatting                              = 1
let g:ycm_filetype_whitelist = {
  \ '*': 1,
  \ 'ycm_nofiletype': 1
  \ }
let g:ycm_min_num_of_chars_for_completion               = 2
let g:ycm_min_num_identifier_candidate_chars            = 2
let g:ycm_max_num_candidates                            = 10
let g:ycm_max_num_identifier_candidates                 = 10
let g:ycm_add_preview_to_completeopt                    = 0
" let g:ycm_show_diagnostics_ui                           = 0
" let g:ycm_enable_diagnostic_signs                       = 0
" let g:ycm_enable_diagnostic_highlighting                = 0
" let g:ycm_echo_current_diagnostic                       = 0
let g:ycm_auto_hover                                    = ''
" let g:ycm_filter_diagnostics                            = 0
let g:ycm_always_populate_location_list                 = 0
" let g:ycm_open_loclist_on_ycm_diags                     = 0
let g:ycm_complete_in_comments                          = 1
let g:ycm_complete_in_strings                           = 1
let g:ycm_collect_identifiers_from_comments_and_strings = 1
let g:ycm_collect_identifiers_from_tags_files           = 1
let g:ycm_seed_identifiers_with_syntax                  = 1
let g:syntastic_mode_map                                = { 'mode': 'active', 'passive_filetypes': ['scss', 'html'], 'active_filetypes': ['ruby', 'haml'] }
let g:syntastic_javascript_checkers                     = ['eslint']
let g:table_mode_corner_corner                          = '+'
let g:table_mode_corner                                 = '+'
let g:table_mode_header_fillchar                        = '-'
let g:better_whitespace_operator                        = ''

" let g:SuperTabDefaultCompletionType                     = '<C-n>'
" let g:SuperTabCrMapping                                 = 0
" let g:ycm_key_list_select_completion                    = ['<C-j>', '<C-n>', '<Down>']
" let g:ycm_key_list_previous_completion                  = ['<C-k>', '<C-p>', '<Up>']

let g:airline#extensions#bookmark#enabled               = 0
let g:grepper = {
    \ 'highlight': '1',
    \ 'prompt_text': '$t -> ',
    \ 'jump': '0',
    \ 'tools': ['rg'],
    \ 'rg': {
    \   'grepprg':    'rg -i -H --no-heading --vimgrep -j1',
    \   'grepformat': '%f:%l:%c:%m',
    \   'escape':     '\^$.*+?()[]{}|',
    \ }}
let g:vim_markdown_folding_disabled = 1
let g:closetag_filenames = '*.html,*.xhtml,*.phtml,*.html.haml,*.erb'
let g:closetag_xhtml_filenames = '*.html,*.xhtml,*.phtml,*.html.haml,*.erb'
let g:closetag_filetypes = 'html,xhtml,phtml,eruby,haml,ruby'
let g:closetag_xhtml_filetypes = 'html,xhtml,phtml,eruby,haml,ruby'

syntax on

" colors
set background=light
colorscheme pirminis

hi DiffText   cterm=none ctermfg=White ctermbg=Red gui=none guifg=Black guibg=Red
hi DiffChange cterm=none ctermfg=White ctermbg=LightMagenta gui=none guifg=Black guibg=LightMagenta
hi SpecialKey guifg=Gray guibg=White
