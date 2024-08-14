set viminfofile=NONE
syntax on
set cursorcolumn
"set cursorline
set laststatus=2
set statusline=\ %<\ %n,%B%M%R%h%w%=\ %y\ %0(%{&fileformat}\ %{&encoding}\ %c:%l\ %)
set hlsearch
set incsearch
set autoindent "redhat
set showmatch "redhat
"set number "redhat
"set mouse=a "redhat
"set ai	"redhat
"set autowrite "redhat
set t_Co=256 "redhat
colorscheme desert "delek "industry "murphy
hi statusline guibg=Cyan ctermfg=103 guifg=Black ctermbg=0
hi IncSearch    cterm=bold ctermfg=129 ctermbg=8
hi Search       cterm=bold ctermfg=148 ctermbg=8
if &diff
  	colorscheme blue
	hi Normal	guifg=yellow	guibg=darkBlue	ctermfg=yellow	ctermbg=none
	hi statusline guibg=Cyan ctermfg=103 guifg=Black ctermbg=0
endif
