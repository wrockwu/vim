" All system-wide defaults are set in $VIMRUNTIME/debian.vim (usually just
" /usr/share/vim/vimcurrent/debian.vim) and sourced by the call to :runtime
" you can find below.  If you wish to change any of those settings, you should
" do it in this file (/etc/vim/vimrc), since debian.vim will be overwritten
" everytime an upgrade of the vim packages is performed.  It is recommended to
" make changes after sourcing debian.vim since it alters the value of the
" 'compatible' option.

" This line should not be removed as it ensures that various options are
" properly set to work with the Vim-related packages available in Debian.
runtime! debian.vim

" Uncomment the next line to make Vim more Vi-compatible
" NOTE: debian.vim sets 'nocompatible'.  Setting 'compatible' changes numerous
" options, so any other options should be set AFTER setting 'compatible'.
"set compatible

" Vim5 and later versions support syntax highlighting. Uncommenting the next
" line enables syntax highlighting by default.
if has("syntax")
  syntax on
endif

"----------------------------------
"added by Robin Van
"set color schema
colorscheme ron

set nocompatible 
set fenc=utf-8
set hls
set ruler
set number

set textwidth=150
set columns=150
set fo+=Mm




"end by Robin Van
"----------------------------------

" If using a dark background within the editing area and syntax highlighting
" turn on this option as well
"set background=dark

" Uncomment the following to have Vim jump to the last position when
" reopening a file
"if has("autocmd")
"  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
"endif

" Uncomment the following to have Vim load indentation rules and plugins
" according to the detected filetype.
"if has("autocmd")
"  filetype plugin indent on
"endif

" The following are commented out as they cause vim to behave a lot
" differently from regular Vi. They are highly recommended though.
"set showcmd		" Show (partial) command in status line.
"set showmatch		" Show matching brackets.
"set ignorecase		" Do case insensitive matching
"set smartcase		" Do smart case matching
"set incsearch		" Incremental search
"set autowrite		" Automatically save before commands like :next and :make
"set hidden             " Hide buffers when they are abandoned
"set mouse=a		" Enable mouse usage (all modes)

" Source a global configuration file if available
if filereadable("/etc/vim/vimrc.local")
  source /etc/vim/vimrc.local
endif



"no swap file
setlocal noswapfile
set bufhidden=hide
"mouse support
if has('mouse')
	set mouse=a
endif
"open script auto
source /etc/vim/plugin/NERD_tree.vim
"source ~/.vim/plugin/echofunc.vim
"NERDTree
"echofunc
"NERDTree setting
"map <silent> <leader>tr :NERDTree<cr>

"Tlist setting
let Tlist_Ctags_Cmd='/usr/bin/ctags'
let Tlist_Show_One_File=0

"Ctags Setting -- enable auto change dir
"set tags=work/kunlun_1.2.0/kernel/android-2.6.29/tags
set tags=tags;
set autochdir

let Tlist_Sort_Type="name"
let Tlist_Use_Right_Window=0
let Tlist_Compart_Format=1
let Tlist_Exist_OnlyWindow=1
let Tlist_File_Fold_Auto_Close=0
let Tlist_Enable_Fold_Column=1
let Tlist_Show_Menu=1
let Tlist_MaxSubMenu_Items=10
let Tlist_Max_Tag_Length=20
let Tlist_Use_SingleClick=0
let Tlist_Auto_Open=0
let Tlist_Close_On_Select=0
let Tlist_File_Fold_Auto_Close=1
let Tlist_GainFocus_On_ToggleOpen=0
let Tlist_Process_File_Always=1
let Tlist_WinHeight=10
"let Tlist_WinWidth=18
let Tlist_WinWidth=28
let Tlist_Use_Horiz_Window=0
nnoremap <silent> <F8> :TlistToggle<CR

"format auto
set formatoptions=tcrqn
"ji cheng qian hang suo jin
set autoindent
"set for C suo jin
set smartindent
set cindent
"set Tab equal 4
set tabstop=4
set softtabstop=4
set shiftwidth=4
"set noexpandtab
set expandtab
set nowrap
set smarttab
"set match
set showmatch
set matchtime=5
"set ignorecase
"set nohlsearch
set hlsearch
set incsearch
"set status
set statusline=%F%m%r%h%w%=\[POS=%l,%v][%p%%]\%{strftime(\"%d/%m/%y\ -\ %H:%M\")}
"always show status
set laststatus=2


"set winmanager
let g:winManagerWindowLayout='FileExplorer|BufExplorer|TagList'
let g:persistentBehaviour=0
let g:winManagerWidth=20
let g:defaultExplorer=1
nmap <silent> <leader>fir :FirstExplorerWindow<cr>
nmap <silent> <leader>bot :BottomExplorerWindow<cr>
nmap <silent> <leader>wm :WMToggle<cr>
"set bufexplorer
let g:bufExplorerSplitRight=1

function! AutoLoadCTagsAndCScope()
	let max = 5
	let dir = './'
	let i = 0
	let break = 0
	while isdirectory(dir) && i < max
		if filereadable(dir . 'cscope.out') 
			execute 'cs add ' . dir . 'cscope.out'
			let break = 1
		endif
		if filereadable(dir . 'tags')
			execute 'set tags =' . dir . 'tags'
			let break = 1
		endif
		if break == 1
			execute 'lcd ' . dir
			break
		endif
		let dir = dir . '../'
		let i = i + 1
	endwhile
endf
nmap <F7> :call AutoLoadCTagsAndCScope()<CR>
"call AutoLoadCTagsAndCScope()

