set nocompatible              
filetype off                  

lua <<EOF

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- set termguicolors to enable highlight groups
vim.opt.termguicolors = true

EOF

call plug#begin('~/.vim/plugged')

    Plug 'VundleVim/Vundle.vim'
    Plug 'scrooloose/syntastic'
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'
    Plug 'tomasr/molokai'
    Plug 'terryma/vim-multiple-cursors'	
    Plug 'yggdroot/indentline'
    Plug 'jiangmiao/auto-pairs'
    Plug 'easymotion/vim-easymotion'
    Plug 'tpope/vim-fugitive'
    Plug 'mattn/emmet-vim'
    Plug 'rust-lang/rust.vim'
    Plug 'tpope/vim-rails'
    Plug 'othree/html5.vim'
    Plug 'hail2u/vim-css3-syntax'
    Plug 'akz92/vim-ionic2'
    Plug 'leafgarland/typescript-vim'
    Plug 'vim-latex/vim-latex'
    Plug 'alvan/vim-closetag'
    Plug 'pangloss/vim-javascript'
    Plug 'maxmellon/vim-jsx-pretty'
    Plug 'ctrlpvim/ctrlp.vim'
    Plug 'junegunn/fzf'
    Plug 'junegunn/fzf.vim'
    Plug 'vim-ruby/vim-ruby'
    Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
    Plug 'nvim-tree/nvim-web-devicons'

    Plug 'williamboman/mason.nvim'
    Plug 'williamboman/mason-lspconfig.nvim'
    Plug 'neovim/nvim-lspconfig'

    Plug 'hrsh7th/cmp-nvim-lsp'
    Plug 'hrsh7th/cmp-buffer'
    Plug 'hrsh7th/cmp-path'
    Plug 'hrsh7th/cmp-cmdline'
    Plug 'hrsh7th/nvim-cmp'
    Plug 'L3MON4D3/LuaSnip'
    Plug 'saadparwaiz1/cmp_luasnip'

    Plug 'Luxed/ayu-vim'    " or other package manager

    Plug 'nvim-tree/nvim-tree.lua'




    
    

call plug#end()

lua <<EOF

    local function open_nvim_tree()

    -- open the tree
    require("nvim-tree.api").tree.open()
    end

    require("nvim-tree").setup()
    vim.api.nvim_create_autocmd({ "VimEnter" }, { callback = open_nvim_tree })


  -- Set up nvim-cmp.
  local cmp = require'cmp'

  cmp.setup({
    snippet = {
      -- REQUIRED - you must specify a snippet engine
      expand = function(args)
        require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
      end,
    },
    window = {
      -- completion = cmp.config.window.bordered(),
      -- documentation = cmp.config.window.bordered(),
    },
    mapping = cmp.mapping.preset.insert({
      ['<C-b>'] = cmp.mapping.scroll_docs(-4),
      ['<C-f>'] = cmp.mapping.scroll_docs(4),
      ['<C-Space>'] = cmp.mapping.complete(),
      ['<C-e>'] = cmp.mapping.abort(),
      ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
    }),
    sources = cmp.config.sources({
      { name = 'nvim_lsp' },
      { name = 'luasnip' }, -- For luasnip users.
    }, {
      { name = 'buffer' },
    })
  })

  -- Set configuration for specific filetype.
  cmp.setup.filetype('gitcommit', {
    sources = cmp.config.sources({
      { name = 'cmp_git' }, -- You can specify the `cmp_git` source if you were installed it.
    }, {
      { name = 'buffer' },
    })
  })

  -- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline({ '/', '?' }, {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
      { name = 'buffer' }
    }
  })

  -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline(':', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({
      { name = 'path' }
    }, {
      { name = 'cmdline' }
    })
  })


require('lspconfig')
require("mason").setup()

require("mason-lspconfig").setup {
    ensure_installed = { "solargraph" },
}

require("lspconfig").solargraph.setup {
    capabilities = capabilities
}


EOF

filetype plugin indent on

colorscheme ayu 
set background=dark

let g:airline#extensions#tabline#enabled = 1
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:tex_flavor='latex'
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_eruby_ruby_quiet_messages =
    \ {'regex': 'possibly useless use of a variable in void context'}
set laststatus=2

" Close tag
let g:closetag_filenames = ".html,.xhtml,*.phtml, *.html.erb"

" color scheme of the moment:
syntax on
set number
set autoindent
set backspace=indent,eol,start
set tabstop=4 shiftwidth=4 expandtab
set number relativenumber
set nu rnu
let &softtabstop=&shiftwidth
" colorscheme molokai
if has('gui_running')
	set guioptions-=T  "remove toolbar
	set guioptions-=r  "remove right-hand scroll bar
	set guioptions-=L  "remove left-hand scrollbar
endif

let g:ctrlp_working_path_mode = 'ra'

" add jbuilder syntax highlighting
au BufNewFile,BufRead *.json.jbuilder set ft=ruby

" JSX highlighting
let g:vim_jsx_pretty_colorful_config = 1 " default 0

set autoread

let g:Tex_DefaultTargetFormat = 'pdf'
let g:Tex_MultipleCompileFormats='pdf, aux'
set nogdefault

