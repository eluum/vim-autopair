" Plugin for handling character auto complete for simple character pairs

" autocomplete pairs
inoremap <silent>" ""<esc>:call HandlePair(0)<CR>
inoremap <silent>' ''<esc>:call HandlePair(0)<CR>
inoremap <silent>( ()<esc>:call HandlePair(1)<CR>
inoremap <silent>[ []<esc>:call HandlePair(1)<CR>
inoremap <silent>{ {}<esc>:call HandlePair(1)<CR>

" special handling for autocomplete pairs by yours truly
function! HandlePair(enter)
    " handle the next key press
    let nextChar = nr2char(getchar())
    if nextChar == "\<CR>" && a:enter
        :call feedkeys("i\<CR>\<esc>O")        
    elseif nextChar == "\<tab>"
        :call feedkeys("xa")
    else
        :startinsert
        :call feedkeys(nextChar)
    endif 
endfunction

