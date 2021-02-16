
nnoremap <buffer> <localleader>r :call RunAT()<cr>

if exists('*RunAt') 
   finish
endif

function! RunAT() 
   let l:cmd = g:iat_binary_location . ' ' . expand('%')
   if exists("g:jobid") 
      echo "already got job"
      "If we already have an existing running session, shut it down and run it
      "again 
      call chansend(g:jobid, ":q\n")
      let l:winnr = win_id2win(g:winid)
      execute l:winnr . 'wincmd c'
      unlet g:winid
      unlet g:jobid
   endif

    " Give our result buffer a meaningful name
   let l:name = '__IAT__' 

   " Open a new split
   execute 'vsplit ' . l:name

   let g:winid = win_getid()

   "Make the file non saveable 
   set buftype=nofile

   "Setup escaping from terminal in natural vim way
   tnoremap <Esc> <C-\><C-n>

   "Finally run the terminal in the new buffer
   let l:jobid = termopen(l:cmd)

   "Remember the job id globally
   let g:jobid = l:jobid 
   call feedkeys('i')
endfunction
