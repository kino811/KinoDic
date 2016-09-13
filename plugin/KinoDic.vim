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

let s:dic = {}
let s:dic.refSite = ""
function! s:dic.Translate(sentence) dict
    if self.refSite == ""
        echo "dic is null"
        return
    endif

    if has('mac')
        exe '!open "' . self.refSite . a:sentence . '"'
    elseif has('win32')
        exe '!start explorer "' . self.refSite . a:sentence . '"'
    endif
endfunction

let s:enToKorDic = copy(s:dic)
let s:enToKorDic.refSite = 'https://translate.google.co.kr/?hl=ko\#en/ko/'

let s:unity3dDic = copy(s:dic)
let s:unity3dDic.refSite = 'http://docs.unity3d.com/ScriptReference/30_search.html?q='

let s:msdnDic = copy(s:dic)
let s:msdnDic.refSite = 'http://www.google.com/search?hl=en&btnI=I\%27m+Feeling+Lucky&q=site\%3Amsdn.microsoft.com\%20'

let s:dicsMap = {}
let s:dicsMap.en2kor = s:enToKorDic
let s:dicsMap.unity3d = s:unity3dDic
let s:dicsMap.msdn = s:msdnDic

function! s:KinoDicCommander(dicID, ...)
    let selectedDic = get(s:dicsMap, a:dicID, s:dic)
    let sentence = join(a:000)
    call selectedDic.Translate(sentence)
endfunction

" keymap {{{
noremap <unique> <script> <Plug>KinodicEn2korCur <SID>En2korCur
if !hasmapto('<Plug>KinodicEn2korCur')
    map <unique> <Leader>kde <Plug>KinodicEn2korCur
endif
noremap <SID>En2korCur :call <SID>KinoDicCommander("en2kor", expand("<cword>"))<CR>

noremap <unique> <script> <Plug>KinodicUnity3dCur <SID>Unity3dCur
if !hasmapto('<plug>KinodicUnity3dCur')
    map <unique> <leader>kdu <plug>KinodicUnity3dCur
endif
noremap <SID>Unity3dCur :call <SID>KinoDicCommander("unity3d", expand("<cword>"))<CR>

noremap <unique> <script> <plug>KinodicMsdnCur <sid>MsdnCur
if !hasmapto('<plug>KinodicMsdnCur')
    map <unique> <leader>kdm <plug>KinodicMsdnCur
endif
noremap <sid>MsdnCur :call <sid>KinoDicCommander("msdn", expand("<cword>"))<cr>
" keymap }}}

" menu {{{
noremenu <script> Plugin.KinoDic.English\ to\ Korean <plug>En2korCur
noremenu <script> Plugin.KinoDic.Reference\ Unity3d <plug>Unity3dCur
noremenu <script> Plugin.KinoDic.Reference\ MSDN <plug>MsdnCur
" menu }}}

" command {{{ 
if !exists(":KinodicEn2korCur")
    command -nargs=0 KinodicEn2korCur :call s:KinoDicCommander("en2kor", expand("<cword>"))
endif

if !exists(":KinodicUnity3dCur")
    command -nargs=0 KinodicUnity3dCur :call s:KinoDicCommander("unity3d", expand("<cword>"))
endif

if !exists(":KinodicMsdnCur")
    command -nargs=0 KinodicMsdnCur :call s:KinoDicCommander("msdn", expand("<cword>"))
endif

if !exists(":Kinodic")
    command -nargs=+ Kinodic :call s:KinoDicCommander(<f-args>)
endif
" command }}}

let &cpo = s:save_cpo
unlet s:save_cpo
