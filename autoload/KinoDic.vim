" KinoDic Plugin
" Vim global plugin for find content where internet in webbrowser
" Last Change: 2016 9 13
" Maintainer: Myonghwa Jung <kino811@gmail.com>
" License: This file is placed in the public domain.

if exists("g:loaded_kinodic")
    finish
endif
let g:loaded_kinodic = 1

let s:save_cpo = &cpo
set cpo&vim

function! s:FindReferenceAPIFromUnity3DThat(word)
    let ref_site = "http://docs.unity3d.com/ScriptReference/30_search.html?q="

    if has("mac")
        exe '!open "' . ref_site . a:word . '"'
    elseif has("win32")
        exe '!start explorer "' . ref_site . a:word . '"'
    endif
endfunction

function! s:FindReferenceAPIFromMsdnThat(word)
    let ref_site = 'http://www.google.com/search?hl=en&btnI=I\%27m+Feeling+Lucky&q=site\%3Amsdn.microsoft.com\%20'

    if has("mac")
        exe '!open "' . ref_site . a:word . '"'
    elseif has("win32")
        exe '!start explorer "' . ref_site . a:word . '"'
    endif
endfunction

function! s:TranslateWordFromEnToKrThat(word)
    let ref_site = 'https://translate.google.co.kr/?hl=ko\#en/ko/'

    if has('mac')
        exe '!open "' . ref_site . a:word . '"'
    elseif has('win32')
        exe '!start explorer "' . ref_site . a:word . '"'
    endif
endfunction

" keymap
noremap <unique> <script> <Plug>KinodicEn2Kor <SID>En2Kor
if !hasmapto('<Plug>KinodicEn2Kor')
    map <unique> <Leader>kd <Plug>KinodicEn2Kor
endif
noremap <SID>En2Kor :call <SID>TranslateWordFromEnToKrThat(expand("<cword>"))<CR>

" menu
noremenu <script> Plugin.KinoDic.En2Kor\ English to Korean <SID>En2Kor

" command
if !exists(":KinodicEn2Kor")
    command -nargs=0 KinodicEn2Kor :call s:TranslateWordFromEnToKrThat(<cword>)
endif

let &cpo = s:svae_cpo
unlet s:save_cpo
