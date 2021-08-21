" Plugin for handling character auto complete for simple character pairs

" autocomplete pairs
inoremap <silent>" ""<esc>:call HandlePair(0, "\"")<CR>
inoremap <silent>' ''<esc>:call HandlePair(0, "\'")<CR>
inoremap <silent>( ()<esc>:call HandlePair(1, "(")<CR>
inoremap <silent>[ []<esc>:call HandlePair(1, "[")<CR>
inoremap <silent>{ {}<esc>:call HandlePair(1, "{")<CR>

" in visual mode surround text with paired characters
vnoremap <silent><Space>" <esc>:call SurroundText("\"", "\"")<CR>
vnoremap <silent>' <esc>:call SurroundText("\'", "\'")<CR>
vnoremap <silent>( <esc>:call SurroundText("(", ")")<CR>
vnoremap <silent>[ <esc>:call SurroundText("[", "]")<CR>
vnoremap <silent>{ <esc>:call SurroundText("{", "}")<CR>
vnoremap <silent>) <esc>:call SurroundText("(", ")")<CR>
vnoremap <silent>] <esc>:call SurroundText("[", "]")<CR>
vnoremap <silent>} <esc>:call SurroundText("{", "}")<CR>

" special handling for autocomplete pairs by yours truly
function! HandlePair(enter, key) abort
    " handle the next key press
    let nextChar = nr2char(getchar())
    if nextChar == "\<CR>" && a:enter
        :call feedkeys("i\<CR>\<esc>O")        
    elseif nextChar == "\<tab>"
        if col(".") == col("$") - 1
            :call feedkeys("xa")
        else
            :call feedkeys("xi")
        endif
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

function! SurroundText(key, pair) abort
    let start      = getpos("'<")
    let end        = getpos("'>")
    
    :let @t = a:key
    :call cursor(start[1],start[2])
    if start[2] == 1 
        :normal ^
    endif
    :normal "tP
    :let @t = a:pair
    :call cursor(end[1],end[2]+1)
    :normal "tp
endfunction
