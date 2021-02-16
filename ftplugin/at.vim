
nnoremap <buffer> <localleader>r :call RunAT()<cr>

if exists('*RunAt') 
   finish
endif

function! RunAT() 
   let l:cmd = g:iat_binary_location . ' ' . expand('%')
   if exists("b:jobid") 
      "If we already have an existing running session, shut it down and run it
      "again 
      jobstop(s:jobid)
      unlet b:jobid
   endif

    " Give our result buffer a meaningful name
   let l:name = '__IAT__' . ' ' . expand('%')

   " Open a new split
   execute 'vsplit ' . l:name

   "Make the file non saveable 
   set buftype=nofile

   "Setup escaping from terminal in natural vim way
   tnoremap <Esc> <C-\><C-n>

   "Finally run the terminal in the new buffer
   let b:jobid = call termopen(l:cmd)
endfunction
