" Make external commands work through a pipe instead of a pseudo-tty
"set noguipty

" You can also specify a different font, overriding the default font
"if has('gui_gtk2')
"  set guifont=Bitstream\ Vera\ Sans\ Mono\ 12
"else
"  set guifont=-misc-fixed-medium-r-normal--14-130-75-75-c-70-iso8859-1
"endif

" If you want to run gvim with a dark background, try using a different
" colorscheme or running 'gvim -reverse'.
" http://www.cs.cmu.edu/~maverick/VimColorSchemeTest/ has examples and
" downloads for the colorschemes on vim.org
"
" ------- zenburn settings
"colorscheme zenburn
"hi CursorLine guibg=#333
"hi Search guibg=yellow guifg=#000 gui=bold
"hi IncSearch guibg=yellow guifg=#000 gui=bold
"hi Todo  guifg=cyan guibg=#333 gui=bold
"


" Stop rails.vim from fucking with my expandtab settings.
" I don't care if everyone else likes spaces, TABs all the way baby!
autocmd User Rails      set noexpandtab


" allow backspacing over everything in insert mode
set backspace=indent,eol,start 

set smarttab
set shiftround

" Set the tag file search order
set tags=./tags;

"  ----- MOLOKAI --------- settings
"let s:molokai_original=1
hi IncSearch guibg=cyan guifg=#000 gui=bold
hi Search guibg=cyan guifg=#000 gui=bold
hi Visual guibg=cyan guifg=#000 gui=bold
hi Label gui=bold,underline
hi Comment guifg=#75715E
set cursorline


