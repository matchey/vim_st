"
" @brief vim script to show RUN
"
" @author Noriaki Machinaka
"
" @copyright (c): 2016 Noriaki Machinaka
"
" @license : GPL Software License Agreement

"
"
function! CppMake()
  let @r=@%
  execute "normal :!g++\<Space>-o\<Space>\./obj/\<C-r>r\<BS>\<BS>\<BS>\<BS>\<Space>\<C-r>r\<CR>"
endfunction

" Command enable
command! CppMake :call CppMake()


