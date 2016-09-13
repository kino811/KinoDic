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
map <unique> <Leader>kde <Plug>KinodicEn2Kor
map <unique> <leader>kdu <plug>KinodicUnity3d
map <unique> <leader>kdm <plug>KinodicMsdn
```

commands:

```vim
:KinodicUnity3d
:KinodicEn2Kor
:KinodicMsdn
```
