function! neoformat#formatters#cpp#enabled() abort
   return [ 'astyle', 'uncrustify', 'clangformat']
endfunction

function! neoformat#formatters#cpp#uncrustify() abort
    return {
           \ 'exe': 'uncrustify',
           \ 'args': ['-q', '-l CPP'],
           \ 'stdin': 1,
           \ }
endfunction

function! neoformat#formatters#cpp#clangformat() abort
    return neoformat#formatters#c#clangformat()
endfunction

function! neoformat#formatters#cpp#astyle() abort
    return {
           \ 'exe': 'astyle',
           \ 'args': ['--style=allman', '--indent=tab=4', '--pad-comma', '--pad-oper', '--unpad-paren', '--break-blocks', '--squeeze-lines=1', '--align-method-colon', '--max-code-length=120', '--break-after-logical', '--indent-classes', '--indent-switches', '--indent-namespaces', '--indent-modifiers'],
           \ 'stdin': 1,
           \ }
endfunction

