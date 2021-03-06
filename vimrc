syntax enable
syntax on
filetype plugin on

"set foldmethod=indent
set incsearch
set ruler
set number
set cursorline
set cursorcolumn 
set nocp

set clipboard=unnamed

"set mouse=v

set t_Co=256
colorscheme molokai 

"Tlist setting
"let Tlist_Ctags_Cmd='/home/bwu/bin/bin/ctags'
let Tlist_Show_One_File=0
let Tlist_Sort_Type="name"
let Tlist_Use_Right_Window=0
"let Tlist_Compart_Format=1
let Tlist_Exist_OnlyWindow=1
let Tlist_File_Fold_Auto_Close=1
let Tlist_Enable_Fold_Column=1
let Tlist_Show_Menu=1
let Tlist_MaxSubMenu_Items=50
let Tlist_Max_Tag_Length=20
let Tlist_Use_SingleClick=1
let Tlist_Auto_Open=0
let Tlist_Close_On_Select=0
"let Tlist_GainFocus_On_ToggleOpen=0
"let Tlist_Process_File_Always=1
let Tlist_WinHeight=100
"let Tlist_WinWidth=40
let Tlist_WinWidth=40
let Tlist_Auto_Update=1
"let Tlist_WinWidth=28
"let Tlist_Use_Horiz_Window=0
"let Tlist_Exit_OnlyWindow=1
nmap <F1> :Tlist<CR>

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
"always show status
set laststatus=2

"set winmanager
let g:winManagerWindowLayout='FileExplorer|TagList'
nmap wm :WMToggle<cr>
let g:winManagerWidth=40

"set autotab OmniCppComplete
set completeopt=menu,longest,menuone
let OmniCpp_NamespaceSearch = 2
let OmniCpp_GlobalScopeSearch = 1
let OmniCpp_ShowAccess = 1
let OmniCpp_ShowPrototypeInAbbr = 1 
let OmniCpp_MayCompleteDot = 1   
let OmniCpp_MayCompleteArrow = 1 
let OmniCpp_MayCompleteScope = 1 
let OmniCpp_DefaultNamespaces = ["std", "_GLIBCXX_STD"]
let OmniCpp_SelectFirstItem = 2
let OmniCpp_DisplayMode=1

au CursorMovedI,InsertLeave * if pumvisible() == 0|silent! pclose|endif


"set cscope
nmap <C-]>s :cs find s <C-R>=expand("<cword>")<CR><CR>
nmap <C-]>g :cs find g <C-R>=expand("<cword>")<CR><CR>
nmap <C-]>d :cs find d <C-R>=expand("<cword>")<CR><CR> 
nmap <C-]>c :cs find c <C-R>=expand("<cword>")<CR><CR> 
nmap <C-]>t :cs find t <C-R>=expand("<cword>")<CR><CR>
nmap <C-]>e :cs find e <C-R>=expand("<cword>")<CR><CR>
nmap <C-]>f :cs find f <C-R>=expand("<cfile>")<CR><CR>
nmap <C-]>i :cs find i <C-R>=expand("<cfile>")<CR><CR>

let g:tag_root_path="/local/binwu3/taghome/"
let g:tag_dir=""

function! AutoLoadCTagsAndCScope()
	let max = 5
    "let dir=substitute(system("pwd"), "\n", "/", "g")
    let dir=g:tag_root_path . g:tag_dir . "/"
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



let NERDTreeShowHidden=0 


"status banner
"always show status banner
set laststatus=2 

highlight StatusLine cterm=bold ctermfg=yellow ctermbg=blue

"get current path and change $HOME to "~"
function! CurDir()
    let curdir = substitute(getcwd(), $HOME, "~", "g")
    return curdir
endfunction
set statusline=[%n]\ %f%m%r%h\ \|\ \ pwd:\ %{CurDir()}\ \|%=\|\ %l,%c\ %p%%\ \ 

"SrcExpl
" // The switch of the Source Explorer 
nmap <F2> :SrcExplToggle<CR> 
 
" // Set the height of Source Explorer window 
let g:SrcExpl_winHeight = 10 

" // Set 100 ms for refreshing the Source Explorer 
let g:SrcExpl_refreshTime = 100 

" // In order to avoid conflicts, the Source Explorer should know what plugins 
" // except itself are using buffers. And you need add their buffer names into 
" // below listaccording to the command ":buffers!" 
let g:SrcExpl_pluginList = [ 
      \ "__Tag_List__", 
      \ "_NERD_tree_" 
      \ ] 

" // Enable/Disable the local definition searching, and note that this is not 
" // guaranteed to work, the Source Explorer doesn't check the syntax for now. 
" // It only searches for a match with the keyword according to command 'gd' 
"let g:SrcExpl_searchLocalDef = 1

" // Do not let the Source Explorer update the tags file when opening 
let g:SrcExpl_isUpdateTags = 1 

" // Use 'Exuberant Ctags' with '--sort=foldcase -R .' or '-L cscope.files' to 
" // create/update a tags file 
"let g:SrcExpl_updateTagsCmd = "ctags -R --c++-kinds=+p --fields=+iaS --extra=+q --sort=foldcase ."

" // Set "<F12>" key for updating the tags file artificially 
"let g:SrcExpl_updateTagsKey = "<F12>"

" // Set "<F3>" key for displaying the previous definition in the jump list 
let g:SrcExpl_prevDefKey = "<F3>"

" // Set "<F4>" key for displaying the next definition in the jump list 
let g:SrcExpl_nextDefKey = "<F4>"
