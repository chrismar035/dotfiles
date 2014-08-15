au BufRead,BufNewFile */nginx/sites-*/* setfiletype conf
au BufRead,BufNewFile .bash_aliases call SetFileTypeSH("bash")
