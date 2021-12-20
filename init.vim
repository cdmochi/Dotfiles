""VARIABLES
let g:deoplete#enable_at_startup = 1
let g:airline_theme='violet'
set number

" Required:
" Add the dein installation directory into runtimepath
set runtimepath+=~/.cache/dein/repos/github.com/Shougo/dein.vim

" Required:
call dein#begin("~/.cache/dein/repos/github.com/Shougo/dein.vim")

" Let dein manage dein
call dein#add("~/.cache/dein/repos/github.com/Shougo/dein.vim")
if !has('nvim')
  call dein#add('roxma/nvim-yarp')
  call dein#add('roxma/vim-hug-neovim-rpc')
endif

"<START-- PLUGINS -->
"Json Syntax
call dein#add('Shougo/neosnippet.vim')
call dein#add('Shougo/neosnippet-snippets')
call dein#add('elzr/vim-json')
""call dein#add('Shougo/defx.nvim')
call dein#add('sainnhe/sonokai')
call dein#add('OmniSharp/omnisharp-vim')
call dein#add('akinsho/toggleterm.nvim')
call dein#add('preservim/nerdtree')
call dein#add('neoclide/coc.nvim', { 'merged': 0, 'rev': 'master', 'build': 'yarn install --frozen-lockfile' })
call dein#add('junegunn/fzf')
call dein#add('vim-airline/vim-airline')
call dein#add('vim-airline/vim-airline-themes')
call dein#add('ryanoasis/vim-devicons')
call dein#add('pangloss/vim-javascript')
call dein#add('stevearc/vim-arduino')
call dein#add('ctrlpvim/ctrlp.vim')
"call dein#add('chemzqm/vim-jsx-improve')
call dein#add('cristianoliveira/vim-react-html-snippets')
call dein#add('maxmellon/vim-jsx-pretty')

"<END-- PLUGINS -->
call dein#end()

" Required:
filetype plugin indent on
syntax enable

""Settins set tabstop=4
set shiftwidth=4
set expandtab
set rtp+=~/.fzf

""<-- COLORS -->
let g:sonokai_style = 'andromeda'
let g:sonokai_enable_italic = 1
let g:sonokai_disable_italic_comment = 1
colorscheme sonokai

""<-- COLORS--->

"<START -- RE-MAPPINGS -->
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

"" Fizzy Finder
command! LS call fzf#run(fzf#wrap({'source': 'ls'}))
command! -bang -complete=dir -nargs=? LS
    \ call fzf#run(fzf#wrap({'source': 'ls', 'dir': <q-args>}, <bang>0))

" Clear highlighting on escape in normal mode
nnoremap <esc> :noh<return><esc>
nnoremap <esc>^[ <esc>^[

" Arduino 
nnoremap <buffer> <leader>am :ArduinoVerify<CR>
nnoremap <buffer> <leader>au :ArduinoUpload<CR>
nnoremap <buffer> <leader>ad :ArduinoUploadAndSerial<CR>
nnoremap <buffer> <leader>ab :ArduinoChooseBoard<CR>
nnoremap <buffer> <leader>ap :ArduinoChooseProgrammer<CR>


"<END -- RE-MAPPINGS -->
