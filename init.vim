""VARIABLES
let g:deoplete#enable_at_startup = 1
let g:airline_theme='violet'
let g:ale_disable_lsp = 1
let g:airline#extensions#ale#enabled = 1
let g:yowish = {}
let g:yowish.option1 = 'foo'
let g:yowish.option2 = 0

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

"C
call dein#add('ctrlpvim/ctrlp.vim')
call dein#add('chemzqm/vim-jsx-improve')
call dein#add('christoomey/vim-tmux-navigator')
call dein#add('cristianoliveira/vim-react-html-snippets')

"D
call dein#add('dense-analysis/ale')

"E
call dein#add('elzr/vim-json')

"F

"G

"H

"I

"J

"K
call dein#add('KabbAmine/yowish.vim')

"L

"M
call dein#add('maxmellon/vim-jsx-pretty')

"N
call dein#add('neoclide/coc.nvim', { 'merged': 0, 'rev': 'master', 'build': 'yarn install --frozen-lockfile' })

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

"T

"U

"V
call dein#add('vim-airline/vim-airline')
call dein#add('vim-airline/vim-airline-themes')

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
colorscheme yowish
""</-- SETs -->


"<--RE-MAPPINGS -->
inoremap jj <Esc>
nnoremap <silent><c-t> <Cmd>exe v:count1 . "ToggleTerm"<CR>
inoremap <silent><c-t> <Esc><Cmd>exe v:count1 . "ToggleTerm"<CR>
nnoremap <C-o> :NERDTree<CR>

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

"</-- RE-MAPPINGS -->

" Load all plugins now.
packloadall
silent! helptags ALL
