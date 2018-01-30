set number
" 突出显示当前列
"set cursorcolumn
" 突出显示当前行
set cursorline
" 不要使用vi的键盘模式
set nocompatible
" 在处理未保存或只读文件的时候，弹出确认
set confirm

set laststatus=2

set showmatch

set hlsearch

syntax enable

filetype off

let mapleader = "\<Space>"

" 制表符  
set tabstop=2
set smartindent "打开自动缩进  
set expandtab "用多个空格代替 tab 键  
set smarttab  "开启时，在行首按TAB将加入sw个空格，否则加入ts个空格
set shiftwidth=2  "换行自动缩进4个空格 
set softtabstop=2
set cindent   

set encoding=utf-8
set termencoding=utf-8

"自动切换当前目录为当前文件所在的目录
set autochdir

let g:syntastic_javascript_checkers = ['eslint']

"vimrc文件修改之后自动加载
augroup reload_vim_config
    autocmd!
    autocmd BufWritePost $MYVIMRC source $MYVIMRC
augroup END

"可使切换文件时，修改的文件被自动保存
set autowriteall

"主题设置"
set background=dark
"let g:solarized_termcolors=256
colorscheme solarized

" ====== 代码折叠 ======
set foldenable
" 折叠方法
" manual    手工折叠
" indent    使用缩进表示折叠
" expr      使用表达式定义折叠
" syntax    使用语法定义折叠
" diff      对没有更改的文本进行折叠
" marker    使用标记进行折叠, 默认标记是 {{{ 和 }}}
set foldmethod=manual

let g:templates_directory = '~/.vim/pack/packages/start/vim-template/templates'

" ====== Vim-JavaScript ======
let g:javascript_plugin_jsdoc = 1
let g:javascript_plugin_ngdoc = 1
let g:javascript_plugin_flow = 1
let javascript_enable_domhtmlcss = 1

" ====== autoformat 自动格式化 ======
au BufWrite * :Autoformat
let g:autoformat_verbosemode=1

" ====== LeaderF 文件搜索 ======
map <C-l-f> :LeaderfFile <CR>

" ====== CtrlP 文件搜索 ======
let g:ctrlp_map = '<C-p>'
let g:ctrlp_cmd = 'CtrlP'
map <C-p-m> :CtrlPMRU<CR> "模糊搜索最近打开的文件
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_switch_buffer = 'et'
set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " MacOSX/Linux
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn)$',
  \ 'file': '\v\.(exe|so|dll)$',
  \ 'link': 'some_bad_symbolic_links',
  \ }

" ====== NERDTree 显示文件树 ====== "
map <C-S-n> :NERDTreeToggle<CR>
map <C-m> :NERDTreeMirror<CR>
let NERDTreeShowBookmarks=1
let NERDTreeShowLineNumbers=1
let NERDTreeAutoCenter=1
let g:NERDTreeIndicatorMapCustom = {
    \ "Modified"  : "✹",
    \ "Staged"    : "✚",
    \ "Untracked" : "✭",
    \ "Renamed"   : "➜",
    \ "Unmerged"  : "═",
    \ "Deleted"   : "✖",
    \ "Dirty"     : "✗",
    \ "Clean"     : "✔︎",
    \ "Unknown"   : "?"
    \ }
 autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
if has('gui_running')
	autocmd vimenter * NERDTree
endif

" ====== ale 补全插件 ====== "
let g:ale_fix_on_save = 1
let g:ale_completion_enabled = 1
let g:ale_sign_column_always = 1
let g:ale_statusline_format = ['✗ %d', '⚡ %d', '✔ OK']

" ====== emment ======
let g:user_emmet_install_global = 0
autocmd FileType html,css EmmetInstall
let g:user_emmet_leader_key='<C-Z>'

" ====== vim-multiple-cursors ======
let g:multi_cursor_use_default_mapping=0
let g:multi_cursor_start_key='<F6>'

" ====== python-mode ======
let g:pymode_python = 'python3'

" Override go-to.definition key shortcut to Ctrl-]
let g:pymode_rope_goto_definition_bind = "<C-]>"

" Override run current python file key shortcut to Ctrl-Shift-e
let g:pymode_run_bind = "<C-S-e>"

" Override view python doc key shortcut to Ctrl-Shift-d
let g:pymode_doc_bind = "<C-S-d>"

" ====== tagbar ======
nmap <F8> :TagbarToggle<CR>
" for ruby, delete if you do not need
let g:tagbar_type_ruby = {
    \ 'kinds' : [
        \ 'm:modules',
        \ 'c:classes',
        \ 'd:describes',
        \ 'C:contexts',
        \ 'f:methods',
        \ 'F:singleton methods'
    \ ]
\ }

" ====== 设置状态栏显示的内容 ====== "
set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [POS=%l,%v][%p%%]\ %{strftime(\"%d/%m/%y\ -\ %H:%M\")}\ %{ALEGetStatusLine()}
"对C/C++使用Clang进行语法检查
let g:ale_linters = {'c': 'clang'}
let g:ale_linters = {'c++': 'clang++'}

" ====== tern ======
let g:tern_show_signature_in_pum = 1

" ===== ultisnips ======
let g:UltiSnipsExpandTrigger = '<D-e>'
let g:UltiSnipsJumpForwardTrigger="<c-i>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
let g:UltiSnipsUsePythonVersion = 3
let g:UltiSnipsSnippetsDir = '/Users/shiheng/.vim/pack/packages/start/vim-snippets/UltiSnips'

" ====== YouCompleteMe 代码提示 ====== "
let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
let g:ycm_seed_identifiers_with_syntax = 1 "开启语义补全
let g:ycm_key_list_stop_completion = ['<CR>']
let g:ycm_server_keep_logfiles = 1
let g:ycm_complete_in_comments = 1
let g:ycm_server_log_level = 'debug'
let g:ycm_global_ycm_extra_conf='~/.ycm_extra_conf.py'  "设置全局配置文件的路径
let g:ycm_seed_identifiers_with_syntax=1    " 语法关键字补全
let g:ycm_confirm_extra_conf=0  " 打开vim时不再询问是否加载ycm_extra_conf.py配置
" 补全功能在注释中同样有效
let g:ycm_complete_in_comments=1
"在字符串输入中也能补全
let g:ycm_complete_in_strings = 1
let g:ycm_cache_omnifunc = 1
let g:ycm_use_ultisnips_completer = 1
" YCM 补全菜单配色
highlight Pmenu ctermfg=2 ctermbg=3 guifg=#005f87 guibg=#EEE8D5 " 菜单
highlight PmenuSel ctermfg=2 ctermbg=3 guifg=#AFD700 guibg=#106900 " 选中项
" 只能是 #include 或已打开的文件
nnoremap <C-g-l> :YcmCompleter GoToDeclaration<CR>
nnoremap <C-g-f> :YcmCompleter GoToDefinition<CR>
nnoremap <C-g-g> :YcmCompleter GoToDefinitionElseDeclaration<CR>
nmap <F4> :YcmDiags<CR>
" 比较喜欢用tab来选择补全...
function! MyTabFunction ()
    let line = getline('.')
    let substr = strpart(line, -1, col('.')+1)
    let substr = matchstr(substr, "[^ \t]*$")
    if strlen(substr) == 0
        return "\<tab>"
    endif
    return pumvisible() ? "\<c-n>" : "\<c-x>\<c-o>"
endfunction
inoremap <tab> <c-r>=MyTabFunction()<cr>

set completeopt=longest,menu    "让Vim的补全菜单行为与一般IDE一致(参考VimTip1228)

if has("autocmd")
    set viminfo='10,\"100,:20,%,n~/.viminfo  
    "au BufReadPost * if line("'\"") > 0|if line("'\"") <= line("{1}quot;)|exe("norm '\"")|else|exe "norm {1}quot;|endif|endif  
    "au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif