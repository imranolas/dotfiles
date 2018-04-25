" Set leader to space
let mapleader=" "
nnoremap <Space> <nop>

" unmap F1 help
nmap <F1> <nop>
imap <F1> <nop>

" Map semicolon to colon
noremap ; :

" fzf
nnoremap <silent> <Leader>o :GFiles<CR>

" Agerium
nnoremap <Leader>f :call Agerium()<CR>

" List buffers
nnoremap <silent> <leader>b :Buffers<CR>

" List buffer commits
nnoremap <silent> <leader>c :BCommits<CR>

" List git status files
nnoremap <silent> <leader>c :GFiles?<CR>

" Make the dot command work as expected in visual mode (via
" https://www.reddit.com/r/vim/comments/3y2mgt/do_you_have_any_minor_customizationsmappings_that/cya0x04)
vnoremap . :norm.<CR>

" Allows you to visually select a section and then hit @ to run a macro on all lines
" https://medium.com/@schtoeffel/you-don-t-need-more-than-one-cursor-in-vim-2c44117d51db#.3dcn9prw6
xnoremap @ :<C-u>call ExecuteMacroOverVisualRange()<CR>

" Have the indent commands re-highlight the last visual selection to make
" multiple indentations easier
vnoremap > >gv
vnoremap < <gv

" Hover definition
nnoremap <silent> K :call LanguageClient_textDocument_hover()<CR>
nnoremap <silent> <leader>d :call LanguageClient_textDocument_definition()<CR>
nnoremap <silent> <leader>r :call LanguageClient_textDocument_rename()<CR>
nnoremap <silent> <leader>s :call LanguageClient_textDocument_documentSymbol()<CR>

" Make Ctrl-c behave exactly like Escape (because it matters to completions)
inoremap <c-c> <ESC>