filetype on
filetype plugin on
filetype indent on
syntax on
set number
set relativenumber
set nobackup
set tabstop=2
set scrolloff=10
set incsearch
set ignorecase
set smartcase
set showmode
set showmatch
set hlsearch
set wildmenu
autocmd BufEnter *.{js,jsx,ts,tsx,vue} :syntax sync fromstart
autocmd BufLeave *.{js,jsx,ts,tsx,vue} :syntax sync clear
" Plugins ----------------------------------------- {{{
	call plug#begin('~/.vim/plugged')
		Plug 'dense-analysis/ale'
		Plug 'preservim/nerdtree'
		Plug 'dracula/vim', { 'as': 'dracula' }
		Plug 'vim-airline/vim-airline'
		Plug 'vim-airline/vim-airline-themes'
		Plug 'leafgarland/typescript-vim'
		Plug 'pangloss/vim-javascript'
		Plug 'MaxMEllon/vim-jsx-pretty'
		Plug 'peitalin/vim-jsx-typescript'
		Plug 'styled-components/vim-styled-components'
		Plug 'neoclide/coc.nvim', {'branch': 'release'}
		let g:coc_global_extensions = [
			\ 'coc-tsserver'
			\ ]
	call plug#end()
	colorscheme dracula
	let g:airline_theme='dracula'
	let g:airline_powerline_fonts=1	
" }}}
"  Mappings --------------------------------------- {{{
	inoremap jk <esc>
	inoremap <silent><expr> <TAB>
		\ coc#pum#visible() ? coc#pum#next(1) :
		\	CheckBackspace() ? "\<Tab>" :
		\ coc#refresh()
	inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
		\: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

	function CheckBackspace() abort
		let col = col('.') - 1
		return !col || getline('.')[col -1] =~# '\s'
	endfunction

	if has('nvim')
		inoremap <silent><expr> <c-space> coc#refresh()
	else
		inoremap <silent><expr> <c-@> coc#refresh()
	endif

	" GoTo code navigation
	nmap <silent> gd <Plug>(coc-definition)
	nmap <silent> gy <Plug>(coc-type-definition)
	nmap <silent> gi <Plug>(coc-implemintation)
	nmap <silent> gr <Plug>(coc-references)

	nnoremap <leader-e> :NERDTreeToggle<cr>
	nnoremap <silent> K :call CocAction('doHover')<CR>
"  }}}
if isdirectory('./node_modules') && isdirectory('./node_modules/prettier')
	let g:coc_global_extensions += ['coc-prettier']
endif
if isdirectory('./node_modules') && isdirectory('./node_modules/eslint')
	let g:coc_global_extensions += ['coc-eslint']
endif

