function! RunAT() 
   let l:cmd = g:iat_binary_location . ' ' . expand('%')
   if exists("s:jobid") 
      "If we already have an existing running session, shut it down and run it
      "again 
      jobstop(s:jobid)
      unlet s:jobid
   endif

    " Give our result buffer a meaningful name
   let l:name = '__IAT__' . ' ' . expand('%')

   " Open a new split
   execute 'vsplit ' . l:name

   "Make the file non saveable 
   set buftype=nofile

   "Finally run the terminal in the new buffer
   termopen(l:cmd)
endfunction

nnoremap <buffer> <localleader>r :call RunAT
