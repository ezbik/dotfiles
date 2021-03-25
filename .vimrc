

scriptencoding utf-8

set encoding=utf-8

" %s/PASS/\=system("generate_random_password")/
" :r ! date +\%F

" let g:is_bash      = 1

" fix ugly all-in-red bash syntax highlight
let sh_minlines = 2500

"setlocal cm=blowfish

set title
"set hlsearch            " switch on search pattern highlighting.
" Don't highlight search terms
set nohlsearch

" show spaces,tabs,newlines
"set list
"set lcs=tab:»·
"set lcs+=trail:·
"set lcs+=eol:$
"set listchars+=nbsp:↔
"set listchars=eol:¬,tab:>·,trail:~,extends:>,precedes:<,space:␣

if has("patch-7.4.710")
    set listchars=eol:¬,tab:>·,trail:~,extends:>,precedes:<,space:␣
else
    " doesnt have space
    set listchars=eol:¬,tab:>·,trail:~,extends:>,precedes:<
endif

"disable recording
map q <Nop>

cab Wq wq

syntax on

"set back
set noeb
set vb t_vb=
set noautoindent
"colorscheme  slate
"colorscheme  morning
"colorscheme  simple256
"colorscheme  peachpuff
colorscheme  default

set modeline

set langmap=йq,цw,уe,кr,еt,нy,гu,шi,щo,зp,х[,ъ],фa,ыs,вd,аf,пg,рh,оj,лk,дl,э',яz,чx,сc,мv,иb,тn,ьm,ю.,ё`,ЯZ,СC,ВD,Ж:,ОJ,ФA,ПG,ЯZ,ШI,МV,КR,ЗP,ЩO
" Set shiftwidth to control how many columns text is indented with >> https://vim.fandom.com/wiki/Shifting_blocks_visually
set shiftwidth=4
" Set softtabstop to control how many columns vim uses when you hit Tab in insert mode.
"set softtabstop=4
" Set tabstop to tell vim how many columns a tab counts for. 
set tabstop=4

" When expandtab is set, hitting Tab in insert mode will produce the appropriate number of spaces.
set expandtab
" use :retab to change TAB to spaces in a text file


" Tell vim to remember certain things when we exit
"  '10 : marks will be remembered for up to 10 previously edited files
"  "100 : will save up to 100 lines for each register
"  :20 : up to 20 lines of command-line history will be remembered
"  % : saves and restores the buffer list
"  n... : where to save the viminfo files
set viminfo='10,\"100,:20,%,n~/.viminfo

" when we reload, tell vim to restore the cursor to the saved position
augroup JumpCursorOnEdit
 au!
 autocmd BufReadPost *
 \ if expand("<afile>:p:h") !=? $TEMP |
 \ if line("'\"") > 1 && line("'\"") <= line("$") |
 \ let JumpCursorOnEdit_foo = line("'\"") |
 \ let b:doopenfold = 1 |
 \ if (foldlevel(JumpCursorOnEdit_foo) > foldlevel(JumpCursorOnEdit_foo - 1)) |
 \ let JumpCursorOnEdit_foo = JumpCursorOnEdit_foo - 1 |
 \ let b:doopenfold = 2 |
 \ endif |
 \ exe JumpCursorOnEdit_foo |
 \ endif |
 \ endif
 " Need to postpone using "zv" until after reading the modelines.
 autocmd BufWinEnter *
 \ if exists("b:doopenfold") |
 \ exe "normal zv" |
 \ if(b:doopenfold > 1) |
 \ exe "+".1 |
 \ endif |
 \ unlet b:doopenfold |
 \ endif
augroup END


"autocmd BufNewFile,BufRead *.json set ft=javascript




hi MatchParen cterm=none ctermbg=none ctermfg=darkgreen


autocmd FileType * setlocal iskeyword-=.

" insert date/time by pressing F5 in no-insert mode
nnoremap <F5> "=strftime("%F")<CR>P
" insert date/time by pressing F5 in    insert mode
inoremap <F5> <C-R>=strftime("%F")<CR>

" surround selected text with {{ .. }}
vmap <F6> :s/\%V\(.*\)\%V/{{\1}}/g<CR>

" InsertComment or RemoveComment in visual/normal mode.
map  ,ic :norm 0i#<CR>
map  ,rc :s/^\( *\)##*/\1/<CR>

" InsertIntendation
map ,ii :norm 0i<TAB><CR>
map ,ri :s/^ *//<CR>

" Insert bash shebang
map ,ib <Esc>1GO#!/bin/bash<CR>PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin<CR># vim: filetype=bash<CR><Esc>:filetype detect<CR>

" Insert Quote >
map ,iq :norm 0i> <CR>

" Insert PATH=xxx
map ,ip <Esc>1GO<CR>PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin<CR><Esc>


"!chmod +x %

"the length vim waits before mapped key sequence to complete
set timeoutlen=3000

let g:sh_no_error=1

"autocmd bufnewfile *.sh r ~/bash_header.txt

" Splitting out long lines into multiple lines
" set tw=115

" moving in long lines with Control-UP/DOWN
"map <C-Up> g<Up>
"map <C-Down> g<Down>
"imap <C-Up> <C-[> g<Up> i
"imap <C-Down> <C-[> g<Down> i

imap <silent> <Down> <C-o>gj
imap <silent> <Up> <C-o>gk
nmap <silent> <Down> gj
nmap <silent> <Up> gk

"The Best Way to Encrypt with vim
set cm=blowfish2

" disable mouse clicks & scroll
set mouse-=a


au BufRead,BufNewFile /etc/nginx/*,/usr/local/nginx/conf/* if &ft == '' | setfiletype nginx | endif
"au      BufRead,BufNewFile *.pp if &ft == '' | setfiletype puppet | endif
au      BufRead,BufNewFile *.pp set ft=puppet 
autocmd BufNewFile,BufRead *.jinja2,*.j2,*.jinja,*.tera set ft=jinja
autocmd BufNewFile,BufRead *.md set filetype=markdown

