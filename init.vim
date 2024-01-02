:set number
:set autoindent
:set tabstop=2
:set shiftwidth=2
:set smarttab
:set softtabstop=4
:set ignorecase
:set smartcase
:set cursorline
:set termguicolors
:set background="dark"
:set splitright
:set splitbelow
:set mouse=a
:set backspace=start,eol,indent

" install plugins
call plug#begin()

Plug 'http://github.com/tpope/vim-surround' " Surrounding ysw)
Plug 'https://github.com/preservim/nerdtree' " NerdTree
Plug 'https://github.com/tpope/vim-commentary' " For Commenting gcc & gc
Plug 'https://github.com/vim-airline/vim-airline' " Status bar
Plug 'https://github.com/ap/vim-css-color' " CSS Color Preview
Plug 'https://github.com/rafi/awesome-vim-colorschemes' " Retro Scheme
Plug 'https://github.com/ryanoasis/vim-devicons' " Developer Icons
Plug 'https://github.com/tc50cal/vim-terminal' " Vim Terminal
Plug 'https://github.com/terryma/vim-multiple-cursors' " CTRL + N for multiple cursors
Plug 'bluz71/vim-moonfly-colors', { 'as': 'moonfly' } " moonfly theme
Plug 'bluz71/vim-nightfly-colors', { 'as': 'nightfly' } " nightfly theme
Plug 'nvim-lualine/lualine.nvim' " lualine status bar
Plug 'kyazdani42/nvim-web-devicons' " icons
Plug 'https://github.com/csexton/trailertrash.vim.git' " Trailertrash - removes trailing whitespaces
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'BenGH28/neo-runner.nvim', {'do': ':UpdateRemotePlugins'}
Plug 'deoplete-plugins/deoplete-clang'
Plug 'https://github.com/Pocco81/auto-save.nvim.git' " AUto-save plugin

call plug#end()

" Navigation keys for NerdTree
nnoremap <C-f> :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-l> :call CocActionAsync('jumpDefinition')<CR>

:colorscheme moonfly

" up and down icons in NerdTree 
let g:NERDTreeDirArrowExpandable="+"
let g:NERDTreeDirArrowCollapsible="-"

"Neorunner configs for c/c++ and python
"C/C++
let g:runner_c_compiler = 'gcc'
let g:runner_cpp_compiler = 'g++'
let g:runner_c_options = '-std=c99 -Wall'
let g:runner_cpp_options = '-std=c++11 -Wall'

"Python
let g:runner_python_ex = 'python3'
let g:runner_python_options = ''

"Autocmd commands for Trailertrash, c files
autocmd BufWritePre *.c :TrailerTrim
autocmd BufWritePost *.c make

lua << END
-- Configuration for lualine status bar
require('lualine').setup {
  options = {
    icons_enabled = true,
    theme = 'auto',
		component_separators = { left = '', right = ''},
		section_separators = { left = '', right = ''},
    disabled_filetypes = {
      statusline = {},
      winbar = {},
    },
    ignore_focus = {},
    always_divide_middle = true,
    globalstatus = false,
    refresh = {
      statusline = 1000,
      tabline = 1000,
      winbar = 1000,
    }
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {'branch', 'diff', 'diagnostics'},
    lualine_c = {'filename'},
    lualine_x = {'encoding', 'fileformat', 'filetype'},
    lualine_y = {'progress'},
    lualine_z = {'location'}
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {'filename'},
    lualine_x = {'location'},
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {},
  winbar = {},
  inactive_winbar = {},
  extensions = {}
}
END
