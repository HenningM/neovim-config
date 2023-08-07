"Plugins {{{
    call plug#begin()

    "Git integration
    Plug 'tpope/vim-fugitive'

    "Language server protocol
    Plug 'neovim/nvim-lspconfig'
    Plug 'nvimdev/lspsaga.nvim', { 'branch': 'main' }

    "Code completion
    Plug 'hrsh7th/cmp-nvim-lsp'
    Plug 'hrsh7th/cmp-buffer'
    Plug 'hrsh7th/cmp-path'
    Plug 'hrsh7th/cmp-cmdline'
    Plug 'hrsh7th/nvim-cmp'

    "Telescope
    Plug 'nvim-lua/popup.nvim'
    Plug 'nvim-lua/plenary.nvim'
    Plug 'nvim-telescope/telescope.nvim'

    "Treesitter
    Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

    "Fuzzy file finder
    Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
    Plug 'junegunn/fzf.vim'

    "Additional syntax detection & highlighting
    Plug 'rust-lang/rust.vim'

    "See editorconfig.org
    Plug 'editorconfig/editorconfig-vim'

    "Sneaky motions
    Plug 'justinmk/vim-sneak'

    "Better JS highlighting & indentation
    Plug 'pangloss/vim-javascript'

    "Async execution for vim (dependency of tsuquyomi)
    Plug 'Shougo/vimproc.vim', { 'do': 'make' }

    "JSX support
    Plug 'mxw/vim-jsx'

    "CoffeeScript support
    Plug 'kchmck/vim-coffee-script'

    "Modify surrounding chars, such as parantheses & quotes
    Plug 'tpope/vim-surround'

    "Sonokai color theme
    Plug 'sainnhe/sonokai'

    call plug#end()

"}}}

"Plugin settings {{{
    "Enable vim-jsx also for .js files
    let g:jsx_ext_required = 0

    "Disable folding for markdown files
    let g:vim_markdown_folding_disabled = 1
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

    "Don't allow NVIM to set cursor shape
    let $NVIM_TUI_ENABLE_CURSOR_SHAPE = 0
    set guicursor=

    "Disable mouse
    set mouse=""

    "Use relative line numbers for all lines...
    set relativenumber
    "...except the current line
    set number

    colorscheme sonokai
"}}}

"Key mappings {{{
    let mapleader=","

    nmap <Leader>p :Files<CR>
    nmap <Leader>o :Buffers<CR>
    nmap <Leader>l :Lines<CR>

    "Make ctrl-l clear highlights
    nnoremap <c-l> :nohlsearch<cr>:diffupdate<cr>:syntax sync fromstart<cr><c-l>

    imap jj <Esc>

    "Use <Tab> and <S-Tab> to navigate through popup menu
    inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
    inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

    "Telescope
    nnoremap <Leader>f <cmd>Telescope find_files<cr>
    nnoremap <Leader>r <cmd>Telescope live_grep<cr>
    nnoremap <Leader>\ <cmd>Telescope buffers<cr>
    nnoremap <Leader>; <cmd>Telescope help_tags<cr>

    "LSP {{{
        "Hover doc
        nnoremap <silent>K :Lspsaga hover_doc<CR>
        "Signature help
        inoremap <silent> <C-k> <Cmd>Lspsaga signature_help<CR>
        "Code actions
        nnoremap <silent><leader>ca :Lspsaga code_action<CR>
        vnoremap <silent><leader>ca :<C-U>Lspsaga range_code_action<CR>
    "}}}

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
