let s:root = fnamemodify(expand('<sfile>'), ':p:h:h')
execute 'set runtimepath+='.s:root.'/eclim,'.s:root.'/eclim/after'

let g:NUMBER_TYPE = 0
let g:STRING_TYPE = 1
let g:FUNCREF_TYPE = 2
let g:LIST_TYPE = 3
let g:DICT_TYPE = 4
let g:FLOAT_TYPE = 5

call eclim#LoadVimSettings()

runtime! eclim/plugin/*.vim
runtime! eclim/after/plugin/*.vim

command StartEclim execute '!' . s:root . '/eclipse/eclimd -b 2>/dev/null'
