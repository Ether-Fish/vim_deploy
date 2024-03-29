"设置编码
set enc=utf8
set fencs=utf8,gbk,gb2312,gb18030

"相对位置
"set relativenumber

"显示行号
set nu
set number

"显示当前行
set cursorline

"显示括号匹配
set showmatch

"设置缩进

"设置Tab长度为4空格"
set tabstop=4
"设置自动缩进长度为4空格
set shiftwidth=4
"继承前一行的缩进方式，适用于多行注释"
set autoindent

"设置 leader键
let mapleader =","

"设置搜索
set hlsearch  "高亮搜索
exec "nohlsearch"  
set incsearch "搜索与高亮同时
set smartcase "大写搜索区分

"菜单命令行Tab键选择
set wildmenu

" 取消vi一致性
set nocompatible

"快速source
map <leader>s :source $MYVIMRC<CR>

"快速跳转
noremap J 5j
noremap K 5k

"split the window
map dh :set nosplitright<CR>:vsplit<CR>
map dj :set splitbelow<CR>:split<CR>
map dl :set splitright<CR>:vsplit<CR>
map dk :set nosplitbelow<CR>:split<CR>

map <leader>h <C-w>h
map <leader>j <C-w>j
map <leader>k <C-w>k
map <leader>l <C-w>l

map <up> :res -5<CR>
map <down> :res +5<CR>
map <left> :vertical resize +5<CR>
map <right> :vertical resize -5<CR>

" quick quit
map Q :q<CR>

" tabe
map tn :tabe<CR>
map t- :-tabnext<CR>
map t+ :+tabnext<CR>
"==============================================================
call plug#begin('~/.vim/plugged')
"括号替换匹配、增加
Plug 'tpope/vim-surround'

"自动补全
"Plug 'valloric/youcompleteme'

"自动补全
Plug 'neoclide/coc.nvim', {'branch': 'release'}


"代码片段
Plug 'honza/vim-snippets'                               
Plug 'sirver/ultisnips'
Plug 'shougo/neocomplete.vim'
"Plug 'garbas/vim-snipmate'

"interface
Plug 'vim-airline/vim-airline'                          
Plug 'vim-airline/vim-airline-themes'

"integrations
Plug 'scrooloose/nerdtree'

"Color scheme
Plug 'morhetz/gruvbox'
"set guioptions=                 
"去掉两边的scrollbar
"set guifont=Monaco:h17

"indetention                                            
Plug 'yggdroot/indentline'
"let g:indentLine_enabled = 0

"alignmen
Plug 'godlygeek/tabular'

" display tags
Plug 'majutsushi/tagbar'
nmap <F8> :TagbarToggle<CR>

"synatx checking
Plug 'scrooloose/syntastic'

"quick select
Plug 'gcmt/wildfire.vim'

"quick comment
Plug 'joom/vim-commentary'

call plug#end()




"===================================================
"NerdTree                                                  
"open when vim start up                                    
"autocmd vimenter * NERDTree                               
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif                                                                                                      
"close when it is the only window                          
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif       

"open nerdtree with <c-t>                                  
map <C-t> :NERDTreeToggle<CR>                       


"===================================================
"gruvbox should not put in the vim-plug
set bg=dark
"设置背景为黑色
colorscheme gruvbox
"设置主题为 gruvbox


"===================================================
"indentline
let g:indentLine_noConcealCursor = 1
let g:indentLine_color_term = 0
let g:indentLine_char = '¦'


"===================================================
" UltiSnips
" 设置新建为水平分页
let g:UltiSnipsEditSplit = "vertical" 
let g:UltiSnipsSnippetDirectories = ["~/.vim/plugged/vim-snippets/UltiSnips"]
" 设置的唯一代码片段来源目录
"let g:UltiSnipsSnippetStorageDirectoryForUltiSnipsEdit = ""
" 设置Trigger键
let g:UltiSnipsExpandTrigger = "<c-j>"
let g:UltiSnipsListSnippets  = "<c-l>"     
let g:UltiSnipsJumpForwardTrigger = "<c-j>"
let g:UltiSnipsJumpBackwardTrigger = "<c-k>"
"===================================================
" coc-nvim 官方配置
" May need for vim (not neovim) since coc.nvim calculate byte offset by count
" utf-8 byte sequence.
set encoding=utf-8
" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: There's always complete item selected by default, you may want to enable
" no select by `"suggest.noselect": true` in your configuration file.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

" Make <CR> to accept selected completion item or notify coc.nvim to format
" <C-g>u breaks current undo, please make your own choice.
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

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
nnoremap <silent> K :call ShowDocumentation()<CR>

function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Run the Code Lens action on the current line.
nmap <leader>cl  <Plug>(coc-codelens-action)

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
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocActionAsync('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocActionAsync('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings for CoCList
" Show all diagnostics.
nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>
