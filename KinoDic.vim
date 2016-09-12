function! FindReferenceAPIFromUnity3DThat(word)
    let ref_site = "http://docs.unity3d.com/ScriptReference/30_search.html?q="

    if has("mac")
        exe '!open "' . ref_site . a:word . '"'
    elseif has("win32")
        exe '!start explorer "' . ref_site . a:word . '"'
    endif
endfunction

function! FindReferenceAPIFromUnity3D()
    FindReferenceAPIFromUnity3DThat('<cword>')
endfunction

function! FindReferenceAPIFromMsdnThat(word)
    let ref_site = 'http://www.google.com/search?hl=en&btnI=I\%27m+Feeling+Lucky&q=site\%3Amsdn.microsoft.com\%20'

    if has("mac")
        exe '!open "' . ref_site . a:word . '"'
    elseif has("win32")
        exe '!start explorer "' . ref_site . a:word . '"'
    endif
endfunction

function! FindReferenceAPIFromMsdn()
    FindReferenceAPIFromMsdnThat('<cword>')
endfunction

function! TranslateWordFromEnToKrThat(word)
    let ref_site = 'https://translate.google.co.kr/?hl=ko\#en/ko/'

    if has('mac')
        exe '!open "' . ref_site . a:word . '"'
    elseif has('win32')
        exe '!start explorer "' . ref_site . a:word . '"'
    endif
endfunction

function! TranslateWordFromEnToKr()
    TranslateWordFromEnToKrThat('<cword>')
endfunction

