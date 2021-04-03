" Plugin for handling character auto complete for simple character pairs

" autocomplete pairs
inoremap <silent>" ""<esc>:call HandlePair(0, "\"")<CR>
inoremap <silent>' ''<esc>:call HandlePair(0, "\'")<CR>
inoremap <silent>( ()<esc>:call HandlePair(1, "(")<CR>
inoremap <silent>[ []<esc>:call HandlePair(1, "[")<CR>
inoremap <silent>{ {}<esc>:call HandlePair(1, "{")<CR>

" special handling for autocomplete pairs by yours truly
function! HandlePair(enter, key) abort
    " handle the next key press
    let nextChar = nr2char(getchar())
    if nextChar == "\<CR>" && a:enter
        :call feedkeys("i\<CR>\<esc>O")        
    elseif nextChar == "\<tab>"
        :call feedkeys("xa")
    elseif nextChar == ";"
        :call feedkeys("A;")
    elseif nextChar == "{" && a:key == "("
        :call feedkeys("A{")
    elseif nextChar == "\<esc>"
        " do nothing, already in normal mode
    else
        :startinsert
        :call feedkeys(nextChar)
    endif 
endfunction
