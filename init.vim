set autochdir
set nocompatible              " be iMproved, required
filetype on                  " required
set listchars=tab:\|\  "agrega lineas verticales para cada espacio de identacion
set list "agrega lineas verticales para cada espacio de identacion
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
"Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
" Plugin 'L9'
" Git plugin not hosted on GitHub
Plugin 'git://git.wincent.com/command-t.git'
"git repos on your local machine (i.e. when working on your own plugin)
"Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Install L9 and avoid a Naming conflict if you've already installed a
" different version somewhere else.
" Plugin 'ascenator/L9', {'name': 'newL9'}

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
set number
set cursorline
set clipboard=unnamedplus
set rnu
let g:airline_powerline_fonts = 1 
set laststatus=2 
source $HOME/.config/nvim/themes/airline.vim

let g:airline#extensions#tabline#buffer_idx_mode = 1
nmap <leader>1 <Plug>AirlineSelectTab1
nmap <leader>2 <Plug>AirlineSelectTab2
nmap <leader>3 <Plug>AirlineSelectTab3et g:airline#extensions#tabline#enabled = 1

Plugin 'vimlab/split-term.vim'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'metalelf0/base16-black-metal-scheme'
Plugin 'vim-ctrlspace/vim-ctrlspace'
Plugin 'morhetz/gruvbox'
Plugin 'lambdalisue/fern.vim'
Plugin 'ryanoasis/vim-devicons'
Plugin 'lambdalisue/fern-renderer-nerdfont.vim'
Plugin 'lambdalisue/nerdfont.vim'
Plugin 'lambdalisue/fern-git-status.vim'
Plugin 'easymotion/vim-easymotion'
Plugin 'mhinz/vim-signify'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-rhubarb'
Plugin 'junegunn/gv.vim'
Plugin 'mhinz/vim-startify'
Plugin 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plugin 'junegunn/fzf.vim'
Plugin 'neoclide/coc.nvim', {'branch': 'release'}
Plugin 'pangloss/vim-javascript'
Plugin 'alvan/vim-closetag'
Plugin 'mxw/vim-jsx'
"Plugin 'the_silver_searcher'
let g:javascript_plugin_jsdoc = 1
let g:javascript_plugin_ngdoc = 1
let g:javascript_plugin_flow = 1
let g:coc_global_extensions = [
  \ 'coc-tsserver'
  \ ]
let g:fern_git_status#disable_ignored    = 1
let g:fern_git_status#disable_untracked  = 1
let g:fern_git_status#disable_submodules = 1
let g:loaded_fern_hijack = 1


" .............................................................................
" lambdalisue/fern.vim
" .............................................................................
" Custom settings and mappings.
let g:fern#disable_default_mappings = 0
" Disable netrw.
let g:loaded_netrw  = 1
let g:loaded_netrwPlugin = 1
let g:loaded_netrwSettings = 1
let g:loaded_netrwFileHandlers = 1

augroup my-fern-hijack
  autocmd!
  autocmd BufEnter * ++nested call s:hijack_directory()
augroup END

function! s:hijack_directory() abort
  let path = expand('%:p')
  if !isdirectory(path)
    return
  endif
  bwipeout %
  execute printf('Fern %s', fnameescape(path))
endfunction

" Custom settings and mappings.
let g:fern#disable_default_mappings = 1

"noremap <silent> <Leader>f :Fern . -drawer -reveal=% -toggle -width=35<CR><C-w>=

function! FernInit() abort
  nmap <buffer><expr>
        \ <Plug>(fern-my-open-expand-collapse)
        \ fern#smart#leaf(
        \   "\<Plug>(fern-action-open:select)",
        \   "\<Plug>(fern-action-expand)",
        \   "\<Plug>(fern-action-collapse)",
        \ )
 nmap <buffer> <CR> <Plug>(fern-my-open-expand-collapse)
" nmap <buffer> n <Plug>(fern-action-new-path)
 nmap <buffer> m <Plug>(fern-action-mark-toggle)
 nmap <buffer><nowait> h <Plug>(fern-action-leave)
 nmap <buffer><nowait> l <Plug>(fern-action-enter)
 nmap <buffer><nowait> mv <Plug>(fern-action-copy)
 nmap <buffer><nowait> nf <Plug>(fern-action-new-file)
 nmap <buffer><nowait> nd <Plug>(fern-action-new-dir) 
 nmap <buffer> H <Plug>(fern-action-hidden-toggle)
 nmap <buffer><nowait>p <Plug>(fern-action-clipboard-paste)
 nmap <buffer><nowait>yy <Plug>(fern-action-clipboard-copy)
 nmap <buffer><nowait>D <Plug>(fern-action-trash)
endfunction

augroup FernGroup
  autocmd!
  autocmd FileType fern call FernInit()
augroup END

set hidden
set encoding=utf-8
let g:CtrlSpaceDefaultMappingKey = "<C-space> "
set rtp+=~/.vim/bundle/powerline/powerline/bindings/vim

syntax on
set noerrorbells
set sw=2
set expandtab
set smartindent
set numberwidth=1
set nowrap
set noswapfile
set nobackup
set incsearch
set ignorecase
set splitbelow
set splitright

set colorcolumn=120

highlight ColoColumn ctermbg=0 guibg=lightgrey

let mapleader = " "

"set termguicolors
set background=dark
let ayucolor="dark"
let g:gruvbox_contrast_dark="hard"
" let g:despacio_Sunset = 1
let g:despacio_Twilight = 1
" let g:despacio_Midnight = 1
" let g:despacio_Pitch = 1
colorscheme gruvbox

nmap <F5> :source ~/.config/nvim/init.vim<CR> 
vmap <F5> :source ~/.config/nvim/init.vim<CR>
nmap <F6> :!node % <CR>
"compile and upload a platformio code to device
nmap <F9> :!pio run -t upload <CR>
"ope serial platformio moniton on a terminal
nmap <F10> :Term platformio device monitor -p /dev/ttyACM0 -b 9600 <CR>

noremap <up> <nop>
noremap <down> <nop>
noremap <left> <nop>
noremap <right> <nop>

nnoremap <leader>w :w<CR>
nnoremap <silent> <right> :vertical resize +5<CR>
nnoremap <silent> <left> :vertical resize -5<CR>
nnoremap <silent> <up> :resize +5<CR>
nnoremap <silent> <down> :resize -5<CR>
nnoremap <leader>e :e $MYVIMRC<CR>

vnoremap <c-t> :split<CR>:ter<CR>:resize 15<CR>
nnoremap <c-t> :split<CR>:ter<CR>:resize 15<CR>

" Moverse al buffer siguiente con <líder> + l 
nnoremap <leader>l :bnext<CR>

" Moverse al buffer anterior con <líder> + h 
nnoremap <leader>h :bprevious<CR>

" Cerrar el buffer actual con <líder> + q
nnoremap <leader>q :bdelete<CR>

"crear una nueva tab
nnoremap <leader>t :tabe<CR>

"hacer un split vertical
nnoremap <leader>vs :vsp<CR>

"hacer un split horizontal
nnoremap <leader>sp :sp<CR>

"abrir ventana vertical nueva
nnoremap <leader>vn :vnew<CR>

"abrir ventana horizontal nueva
nnoremap <leader>hn :new<CR>
"toggle Fern file manager
nnoremap <leader>tf :Fern %:h -drawer -toggle<CR>
"change betwin Window
nnoremap <Leader>c <C-w><C-w>
"move down on windows
nnoremap <A-j> <C-W>j 
"move above on windows
nnoremap <A-k> <C-W>k 
"move right on windows
nnoremap <A-l> <C-W>l
"move left on windows
nnoremap <A-h> <C-W>h
"enable touchpad
nnoremap <Leader>m :!sudo modprobe -r psmouse<CR><CR>:echo "touchpad disabled!"<CR>
"Able touchpad
nnoremap <Leader>M :!sudo modprobe psmouse<CR><CR>:echo "touchpad enabled!"<CR>

" open new split panes to right and below
set splitright
set splitbelow
" turn terminal to normal mode with escape
tnoremap <Esc> <C-\><C-n>
" start terminal in insert mode
au BufEnter * if &buftype == 'terminal' | :startinsert | endif
" open terminal on ctrl+n
function! OpenTerminal()
  split term://zsh 
  resize 10
endfunction
nnoremap <c-n> :call OpenTerminal()<CR>

"to close a terminal but first pres esc
nmap<f12> <C-\><C-n>:q!<CR>
"remap $ to go at teh end of the line
map <S-h> <ESC>0
map <S-l> <ESC>$

" <Leader>f{char} to move to {char}
map  <Leader>f <Plug>(easymotion-bd-f)
nmap <Leader>f <Plug>(easymotion-overwin-f)

" s{char}{char} to move to {char}{char}
nmap s <Plug>(easymotion-overwin-f2)

" Move to line
map <Leader>li <Plug>(easymotion-bd-jk)
nmap <Leader>li <Plug>(easymotion-overwin-line)
" enable the touchpad when Vim is closed
autocmd VimLeave * silent !sudo modprobe psmouse
" Move to word
"map  <Leader>w <Plug>(easymotion-bd-w)
"nmap <Leader>w <Plug>(easymotion-overwin-w)


"open Startyfy
nnoremap <leader>os :Startify<CR>
nnoremap <leader>SD :SDelete<CR>
noremap <leader>ss :SSave<CR>" guardar sesion
noremap <leader>sc :SClose<CR>" Cerrar una sesion completa (se guardan los cambios)
"changes the working directory to the project root when you open a file.
let g:startify_change_to_vcs_root = 1


" 'Most Recent Files' number
let g:startify_files_number           = 18

" Update session automatically as you exit vim
" let g:startify_session_persistence    = 1
"permite cambiar el directorio principal let g:startify_change_to_dir       = 1 Simplify the startify list to just recent files and sessions let g:startify_lists = [
let g:startify_lists = [
          \ { 'type': 'sessions',  'header': ['   Sessions']       },
          \ { 'type': 'bookmarks', 'header': ['   Bookmarks']      },
          \ { 'type': 'files',     'header': ['   Files']            },
          \ { 'type': 'dir',       'header': ['   Current Directory '. getcwd()] },
          \ ]
let g:startify_bookmarks = [
            \ { 'd': '~/Documentos' },
            \ { 'a': '~/Arduino' },
            \ { 'e': '~/Escritorio/notes-app' },
            \ '~/Documentos',
            \ ]
" Fancy custom header
let g:startify_custom_header = [
\'  ,,,,,,,_,,,,,,,,,,,,,,,,,,,______,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,_,,,,,,,,,,,,, ',
\'  ,,,,,,|,|,,,,,,,,,,,,,,,,,(_____,\,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,(_),,,,,,,,,,,, ',
\'  ,,____|,|__,,_,,,_,_,,,_,,,_____),)___,___,,,____,,____,_____,____,,_,____,,,____, ',
\'  ,/,___),,_,\|,|,|,|,|,|,|,|,____/,___),,_,\,/,_,,|/,___|____,|,,,,\|,|,,_,\,/,_,,3 ',
\'  (,(___|,|,|,|,|_|,|,|_|,|,|,|,,,|,|,,|,|_|,(,(_|,|,|,,,/,___,|,|,|,|,|,|,|,(,(_|,| ',
\'  ,\____)_|,|_|____/,\__,,|,|_|,,,|_|,,,\___/,\___,|_|,,,\_____|_|_|_|_|_|,|_|\___,| ',
\'  ,,,,,,,,,,,,,,,,,,(____/,,,,,,,,,,,,,,,,,,,(_____|,,,,,,,,,,,,,,,,,,,,,,,,,(_____| ',
\ ]               



""COC

" TextEdit might fail if hidden is not set.
set hidden

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
"nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>fs  <Plug>(coc-format-selected)
nmap <leader>fs  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a <Plug>(coc-codeaction-selected)
nmap <leader>a <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
"nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
"nmap <leader>qf  <Plug>(coc-fix-current)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Remap <C-f> and <C-b> for scroll float windows/popups.
if has('nvim-0.4.0') || has('patch-8.2.0750')
  nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
  inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
  vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
endif

" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of language server.
"nmap <silent> <C-s> <Plug>(coc-range-select)
"xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings for CoCList
" Show all diagnostics.
"nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
"nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent><nowait> <space>co :<C-u>CocList commands<cr>
nnoremap <leader>ht :CocCommand template.template<CR>
" Find symbol of current document.
"nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
"nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
"nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
"nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
"nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>

"The silver Searcher
let g:ag_working_path_mode="r" "You can configure ag.vim to always start searching from your project root instead of the cwd
"let g:ag_prg="</home/zagan/Documentos/Programacion/javascript/freeboard-master> --vimgrep"
""launch the searcher silver
nnoremap <leader>7 :Ag<CR>
"delete a word
map <S-d> <ESC>cW
