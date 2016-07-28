" ----------------------------------------------------------------------------
"  Language Specific
" ----------------------------------------------------------------------------

if exists("did_load_filetypes")
    " Bail
    finish
endif

augroup filetypedetect
    autocmd! BufRead,BufNewFile *.ino setfiletype arduino
    autocmd! BufRead,BufNewFile *.pde setfiletype arduino
augroup END

"autocmd FileType java
"        \ set tags=.tags;\,~/projects/external/jdk/.tags |
"        \ set omnifunc=javacomplete#Complete |
"        \ set completefunc=javacomplete#CompleteParamsInfo |
"        \ inoremap <C-@> <C-X><C-P>
"autocmd FileType groovy
"        \ set tags=.tags;\,~/projects/external/jdk/.tags |
"        \ inoremap <C-@> <C-X><C-P>

autocmd FileType crontab setlocal nowritebackup
