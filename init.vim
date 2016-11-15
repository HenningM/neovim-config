"Plugins {{{
    call plug#begin()

    "Git integration
    Plug 'tpope/vim-fugitive'

    "Autocompletion
    function! DoRemote(arg)
        UpdateRemotePlugins
    endfunction
    Plug 'Shougo/deoplete.nvim', { 'do': function('DoRemote') }
    Plug 'SirVer/ultisnips'
    Plug 'honza/vim-snippets'
    Plug 'greg-js/vim-react-es6-snippets'

    "Fuzzy file finder
    Plug 'ctrlpvim/ctrlp.vim'

    "Additional syntax detection & highlighting
    Plug 'rust-lang/rust.vim'

    "See editorconfig.org
    Plug 'editorconfig/editorconfig-vim'

    "Sneaky motions
    Plug 'justinmk/vim-sneak'

    "Better JS highlighting & indentation
    Plug 'pangloss/vim-javascript'

    "JSX support
    Plug 'mxw/vim-jsx'

    "CoffeeScript support
    Plug 'kchmck/vim-coffee-script'

    "Haxe support
    Plug 'rf-/vaxe'

    "ActionScript support
    Plug 'jeroenbourgois/vim-actionscript'

    "Modify surrounding chars, such as parantheses & quotes
    Plug 'tpope/vim-surround'

    call plug#end()

"}}}

"Plugin settings {{{
    "Enable vim-jsx also for .js files
    let g:jsx_ext_required = 0
"}}}

"Basic settings {{{
    set expandtab
    set shiftwidth=2
    set tabstop=2
    set smartindent
    set smarttab

    set ignorecase
    set smartcase
    set hlsearch
    set incsearch

    set wildmode=longest:full
    set wildmenu
    set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.idea/*,*/.DS_Store,*/vendor,*/node_modules

    set foldmethod=marker

    set backupcopy=yes

    syntax on
    filetype on
    filetype plugin indent on

    "Disable mouse
    set mouse=""

    "Use relative line numbers for all lines...
    set relativenumber
    "...except the current line
    set number

    colorscheme molokai256
"}}}

"Key mappings {{{
    nnoremap <Right> :tabnext<CR>
    nnoremap <Left> :tabprevious<CR>
    inoremap <Right> <Esc>:tabnext<CR>a
    inoremap <Left> <Esc>:tabprevious<CR>a

    "Make ctrl-l clear highlights
    nnoremap <c-l> :nohlsearch<cr>:diffupdate<cr>:syntax sync fromstart<cr><c-l>

    let mapleader=","

    imap jj <Esc>
"}}}

"Statusline {{{
    hi User1 ctermbg=black   ctermfg=white   guibg=darkgrey  guifg=white
    hi User2 ctermbg=black   ctermfg=grey    guibg=darkgrey  guifg=grey

    set laststatus=2
    set statusline+=%1*
    set statusline+=%F\ 
    set statusline+=%2*
    set statusline+=%m%r
    set statusline+=%y
    set statusline+=%{fugitive#statusline()}
    set statusline+=%=
    set statusline+=%10((%l,%c)%)\ 
    set statusline+=%P
"}}}

"Misc {{{
    set list
    set listchars=nbsp:…,tab:▸\ ,trail:·

    "Disable background color erase
    set t_ut=
"}}}

"Deoplete {{{
    let g:deoplete#enable_at_startup = 1
"}}}

"UltiSnips {{{
    let g:UltiSnipsExpandTrigger="<tab>"
    let g:UltiSnipsJumpForwardTrigger="<c-b>"
    let g:UltiSnipsJumpBackwardTrigger="<c-z>"
"}}}
