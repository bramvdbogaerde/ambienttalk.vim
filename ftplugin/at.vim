
function! RunAT() 
   let l:cmd = g:iat_binary_location . ' ' . expand('%')

    " Give our result buffer a meaningful name
   let l:name = '__IAT__' . ' ' . expand('%')

   if bufwinnr(l:name) == -1
        " Open a new split
      execute 'vsplit ' . l:name
   else
      " Focus the existing window
      execute bufwinnr(l:name) . 'wincmd w'
   endif

   " Clear out existing content
   normal! gg"_dG

   set buftype=nofile

   execute l:cmd
endfunction

nnoremap <buffer> <localleader>r :call RunAT
