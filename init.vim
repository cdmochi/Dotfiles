""VARIABLES
let g:deoplete#enable_at_startup = 1
let g:airline_theme='minimalist'
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:ale_disable_lsp = 1

set runtimepath+=~/.vim/bundle/repos/github.com/Shougo/dein.vim
call dein#begin("~/.vim/bundle/repos/github.com/Shougo")
call dein#add("~/.vim/bundle/repos/github.com/Shougo")
if !has('nvim')
  call dein#add('roxma/nvim-yarp')
  call dein#add('roxma/vim-hug-neovim-rpc')
endif

"" <-- PLUGINS -->
"A

"B
call dein#add('BurntSushi/ripgrep')

"C
call dein#add('ctrlpvim/ctrlp.vim')
call dein#add('chemzqm/vim-jsx-improve')
call dein#add('christoomey/vim-tmux-navigator')
call dein#add('cristianoliveira/vim-react-html-snippets')

"D
call dein#add('dense-analysis/ale')
call dein#add('dikiaap/minimalist')

"E
call dein#add('elzr/vim-json')

"F

"G

"H

"I

"J

"K

"L

"M
call dein#add('maxmellon/vim-jsx-pretty')
"call dein#add('morhetz/gruvbox')

"N
call dein#add('neoclide/coc.nvim', { 'merged': 0, 'rev': 'master', 'build': 'yarn install --frozen-lockfile' })
call dein#add('nvim-telescope/telescope-ui-select.nvim')
call dein#add('nvim-lua/plenary.nvim')
call dein#add('nvim-telescope/telescope.nvim')
call dein#add('nvim-telescope/telescope-fzf-native.nvim')

"O
call dein#add('OmniSharp/omnisharp-vim')

"P
call dein#add('preservim/nerdtree')
call dein#add('pangloss/vim-javascript')
call dein#add('preservim/nerdcommenter')

"Q

"R

"S
call dein#add('Shougo/neosnippet.vim')
call dein#add('Shougo/neosnippet-snippets')
call dein#add('Shougo/defx.nvim')
call dein#add('stevearc/vim-arduino')
call dein#add('stevearc/dressing.nvim')
call dein#add('sheerun/vim-polyglot')

"T

"U

"V
call dein#add('vim-airline/vim-airline')
call dein#add('vim-airline/vim-airline-themes')
call dein#add('vim-scripts/nvim-treesitter')
call dein#add('valloric/MatchTagAlways')

"W

"X

"Y

"Z

"N

call dein#end()
"</-- PLUGINS -->


""<-- SETs -->
set tabstop=4 
set shiftwidth=4
set expandtab
set number

filetype plugin indent on
filetype plugin on
syntax enable
""</-- SETs -->

""Color Scheme
if (empty($TMUX))
    if (has("nvim"))
        "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
        let $NVIM_TUI_ENABLE_TRUE_COLOR=1
    endif
    "For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
    "Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
    " < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
    if (has("termguicolors"))
        set termguicolors
    endif
endif

set t_Co=256
syntax on
colorscheme minimalist

"<--RE-MAPPINGS -->
inoremap jj <Esc>
nnoremap <silent><c-t> <Cmd>exe v:count1 . "ToggleTerm"<CR>
inoremap <silent><c-t> <Esc><Cmd>exe v:count1 . "ToggleTerm"<CR>
nnoremap <C-o> :NERDTreeToggle<CR>

"" Map Ctrl + Space for auto-complete
inoremap <silent><expr> <TAB>
            \ pumvisible() ? "\<C-n>" :
            \ <SID>check_back_space() ? "\<TAB>" :
            \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Clear highlighting on escape in normal mode
nnoremap <esc> :noh<return><esc>
nnoremap <esc>^[ <esc>^[

" Arduino
nnoremap <buffer> <leader>am :ArduinoVerify<CR>
nnoremap <buffer> <leader>au :ArduinoUpload<CR>
nnoremap <buffer> <leader>ad :ArduinoUploadAndSerial<CR>
nnoremap <buffer> <leader>ab :ArduinoChooseBoard<CR>
nnoremap <buffer> <leader>ap :ArduinoChooseProgrammer<CR>

" " Copy to clipboard
vnoremap  <leader>y  "+y
nnoremap  <leader>Y  "+yg_
nnoremap  <leader>y  "+y
nnoremap  <leader>yy  "+yy

" " Paste from clipboard
nnoremap <leader>p "+p
nnoremap <leader>P "+P
vnoremap <leader>p "+p
vnoremap <leader>P "+P

nnoremap <buffer> <leader>am <cmd>ArduinoVerify<CR>
nnoremap <buffer> <leader>au <cmd>ArduinoUpload<CR>
nnoremap <buffer> <leader>ad <cmd>ArduinoUploadAndSerial<CR>
nnoremap <buffer> <leader>ab <cmd>ArduinoChooseBoard<CR>
nnoremap <buffer> <leader>ap <cmd>ArduinoChooseProgrammer<CR>

""Telescope
" Find files using Telescope command-line sugar.
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>

"" OmniSharp 
autocmd Filetype cs nmap <silent> gd :OmniSharpGotoDefinition<CR>
autocmd Filetype cs nmap <buffer> <Leader>fu :OmniSharpFindUsages<CR>
autocmd Filetype cs nmap <buffer> <Leader>fi :OmniSharpFindImplementations<CR>
autocmd Filetype cs nmap <buffer> <Leader><Space> :OmniSharpGetCodeActions<CR>
let g:ale_linters = {
    \ 'cs': ['OmniSharp']
\}

autocmd Filetype ts nmap <silent> gd :call CocActionAsync('jumpDefinition')<CR>
autocmd Filetype html nmap <silent> gd :call CocActionAsync('jumpDefinition')<CR>

"</-- RE-MAPPINGS -->

" Load all plugins now.
packloadall
silent! helptags ALL
