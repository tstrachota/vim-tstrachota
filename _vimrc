
"line numbering on
set number

"indentation
set autoindent
set expandtab
set softtabstop=4
set shiftwidth=4

"highlight current line
set cursorline
hi CursorLine cterm=NONE ctermbg=gray

"shortcuts for tabs
map + :tabn<CR>
map - :tabp<CR>

"no text wrapping
set nowrap

"moving around vim windows
nnoremap <C-Left> <C-w>h
nnoremap <C-Down> <C-w>j
nnoremap <C-Up> <C-w>k
nnoremap <C-Right> <C-w>l

"disable replace mode on Insert
"remap to toggle normal/insert mode instead
nnoremap <Insert> i
inoremap <Insert> <Esc>i<Right>

"remove last search highlight on space press
map <Space> :noh<cr>

"toggle between paste and insert mode
nnoremap <F2> :set invpaste paste?<CR>
set pastetoggle=<F2>

"pathogen plugin (enables .vim/bundle)
call pathogen#runtime_append_all_bundles()

"tagbar
autocmd BufEnter * nested :call tagbar#autoopen(0)
autocmd FileType rb,js,py,php,sh nested :TagbarOpen
let g:tagbar_width = 40



