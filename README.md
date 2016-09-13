KinoDic
=======

Vim Plugin.

Functions
---------

### English to Korean

`let ref_site = 'https://translate.google.co.kr/?hl=ko\#en/ko/'`

### Find Reference Unity3D

`let ref_site = "http://docs.unity3d.com/ScriptReference/30_search.html?q="`

### Find Reference MSDN

`let ref_site = 'http://www.google.com/search?hl=en&btnI=I\%27m+Feeling+Lucky&q=site\%3Amsdn.microsoft.com\%20'`

How to Use
----------

default keymaps:

```vim
" find word under cursor.
map <unique> <Leader>kde <Plug>KinodicEn2korCur
map <unique> <leader>kdu <plug>KinodicUnity3dCur
map <unique> <leader>kdm <plug>KinodicMsdnCur
```

commands:

```vim
:KinodicEn2korCur
:KinodicUnity3dCur
:KinodicMsdnCur

" [word] [word] ... is [sentence]
:Kinodic (|dicID|) [word] [word] ...
```
