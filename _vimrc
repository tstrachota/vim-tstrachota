
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

"<Esc> and then <num> switches to the nth tab
map <Esc>1 1gt
map <Esc>2 2gt
map <Esc>3 3gt
map <Esc>4 4gt
map <Esc>5 5gt
map <Esc>6 6gt
map <Esc>7 7gt
map <Esc>8 8gt
map <Esc>9 9gt

"enter adds new line without entering insert mode
map <CR> o<Esc>

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
autocmd BufEnter *.py,*.rb,*.php,*.sh,*.js nested :call tagbar#autoopen(0)
let g:tagbar_width = 40

"tagbar and session compatibility fix
"it was not possible to restore tagbar buffers after session load
"and as a result empty buffers remained there
"
"we close all tagbar buffers and empty buffers after the session is restored
"new tagbars are opened automatically due to autoopen settings above
function! DeleteBuffers()
    let toclose = []
    let [i, n] = [1, bufnr('$')]
    while i <= n
        if bufexists(i) && (bufname(i) == '' || bufname(i) == '__Tagbar__' )
            call add(toclose, i)
        endif
        let i += 1
    endwhile
    if len(toclose) > 0
        exe 'bdelete' join(toclose, ' ')
    endif
endfunction

function! MyRestoreSession()
    OpenSession
    call DeleteBuffers()
endfunction

command! -nargs=0 RestoreSession         call MyRestoreSession()

