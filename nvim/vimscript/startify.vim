function! s:gitModified()
    let files = systemlist('git ls-files -m 2>/dev/null')
    return map(files, "{'line': v:val, 'path': v:val}")
endfunction

" same as above, but show untracked files, honouring .gitignore
function! s:gitUntracked()
    let files = systemlist('git ls-files -o --exclude-standard 2>/dev/null')
    return map(files, "{'line': v:val, 'path': v:val}")
endfunction

let g:startify_lists = [
        \ { 'type': 'files',     'header': ['   MRU']            },
        \ { 'type': 'dir',       'header': ['   MRU '. getcwd()] },
        \ { 'type': 'sessions',  'header': ['   Sessions']       },
        \ { 'type': 'bookmarks', 'header': ['   Bookmarks']      },
        \ { 'type': function('s:gitModified'),  'header': ['   git modified']},
        \ { 'type': function('s:gitUntracked'), 'header': ['   git untracked']},
        \ { 'type': 'commands',  'header': ['   Commands']       },
        \ ]

let g:startify_bookmarks = [{'t': '~/Dropbox/Apps/Simpletask/todo.txt'}]

" let g:startify_files_number = 10
" let g:startify_update_oldfiles = 0
" let g:startify_session_autoload = 0
" let g:startify_session_before_save = [ 'silent! tabdo NERDTreeClose' ]
" let g:startify_session_persistence = 0
" let g:startify_session_delete_buffers = 1
" let g:startify_change_to_dir = 1
let g:startify_change_to_vcs_root = 1

