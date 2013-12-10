" custom filetypes
if exists("did_load_filetypes")
    finish
endif

augroup filetypedetect
    autocmd! BufRead,BufNewFile *.ino setfiletype arduino
    autocmd! BufRead,BufNewFile *.pde setfiletype arduino
augroup END "
