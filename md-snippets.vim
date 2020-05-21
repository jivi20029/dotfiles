"autocmd Filetype markdown map <leader>w yiWi[<esc>Ea](<esc>pa)
autocmd Filetype markdown inoremap ,f <Esc>/<++><CR>:nohlsearch<CR>c4l
autocmd Filetype markdown inoremap ,n ---<Enter><Enter>
autocmd Filetype markdown inoremap ,b ****<++><Esc>F*hi
autocmd Filetype markdown inoremap ,s ~~~~<++><Esc>F~hi
autocmd Filetype markdown inoremap ,i **<++><Esc>F*i
autocmd Filetype markdown inoremap ,d ``<++><Esc>F`i
autocmd Filetype markdown inoremap ,c ```<Enter><++><Enter>```<Enter><Enter><++><Esc>4kA
autocmd Filetype markdown inoremap ,h ====<Space><++><Esc>F=hi
autocmd Filetype markdown inoremap ,p ![](<++>) <++><Esc>F[a
autocmd Filetype markdown inoremap ,a [](<++>) <++><Esc>F[a
autocmd Filetype markdown inoremap ,1 #<Space><Enter><++><Esc>kA
autocmd Filetype markdown inoremap ,2 ##<Space><Enter><++><Esc>kA
autocmd Filetype markdown inoremap ,3 ###<Space><Enter><++><Esc>kA
autocmd Filetype markdown inoremap ,4 ####<Space><Enter><++><Esc>kA
autocmd Filetype markdown inoremap ,l --------<Enter>
autocmd Filetype markdown inoremap ,j &#160; &#160; &#160; &#160;

autocmd Filetype markdown nnoremap ,i viwc*<Esc>pa*<Esc>
autocmd Filetype markdown vnoremap ,i c*<Esc>pa*<Esc>

autocmd Filetype markdown nnoremap ,b viwc**<Esc>pa**<Esc>
autocmd Filetype markdown vnoremap ,b c**<Esc>pa**<Esc>

autocmd Filetype markdown nnoremap ,1 viwc# <Esc>p
autocmd Filetype markdown vnoremap ,1 c# <Esc>p

autocmd Filetype markdown nnoremap ,2 viwc## <Esc>p
autocmd Filetype markdown vnoremap ,2 c## <Esc>p

autocmd Filetype markdown nnoremap ,3 viwc### <Esc>p
autocmd Filetype markdown vnoremap ,3 c### <Esc>p

autocmd Filetype markdown nnoremap ,4 viwc#### <Esc>p
autocmd Filetype markdown vnoremap ,4 c#### <Esc>p



" ===
" === markdown preview 
" ===
autocmd Filetype markdown nmap <silent> <F9> <Plug>MarkdownPreview
autocmd Filetype markdown imap <silent> <F9> <Plug>MarkdownPreview
autocmd Filetype markdown nmap <silent> <F10> <Plug>StopMarkdownPreview
autocmd Filetype markdown imap <silent> <F10> <Plug>StopMarkdownPreview


" ===
" === md-paste-image
" ===
autocmd FileType markdown nmap <buffer><silent> im :call mdip#MarkdownClipboardImage()<CR>
let g:mdip_imgdir = '.'
" let g:mdip_imgname = 'image'


" ===
" === vim-table-mode
" ===
function! s:isAtStartOfLine(mapping)
  let text_before_cursor = getline('.')[0 : col('.')-1]
  let mapping_pattern = '\V' . escape(a:mapping, '\')
  let comment_pattern = '\V' . escape(substitute(&l:commentstring, '%s.*$', '', ''), '\')
  return (text_before_cursor =~? '^' . ('\v(' . comment_pattern . '\v)?') . '\s*\v' . mapping_pattern . '\v$')
endfunction

inoreabbrev <expr> <bar><bar>
          \ <SID>isAtStartOfLine('\|\|') ?
          \ '<c-o>:TableModeEnable<cr><bar><space><bar><left><left>' : '<bar><bar>'
inoreabbrev <expr> __
          \ <SID>isAtStartOfLine('__') ?
          \ '<c-o>:silent! TableModeDisable<cr>' : '__'

