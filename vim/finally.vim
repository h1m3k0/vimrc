try
  if has('termguicolors')
    if has('g:colorscheme')
      execute 'colorscheme ' . g:colorscheme
    else
      colorscheme everforest
    endif
  else
    colorscheme onedark
  endif
catch
endtry

call FinallySetting()