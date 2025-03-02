finish
vim9script noclear

var id: number
var winid: number

highlight ColorF gui=standout

def HighlightClear(): void
  if id > 0
    id = id->matchdelete(winid)
  endif
enddef

augroup fFtTHighlight | autocmd!
  autocmd CursorMoved,ModeChanged,TextChanged,WinEnter,WinLeave,CmdWinLeave,SafeState * HighlightClear()
augroup END



enum Type
  f, t, F, T, 
  semicolon,  # ;
  comma       # ,
endenum

class Action
  var type: Type
  var char: number
  public static var last_action: Action = null
  def new(this.type, this.char)
  enddef
  def newSemicolon()
    this.type = Type.semicolon
  enddef
  def newComma()
    this.type = Type.comma
  enddef
endclass

def SelectPosition(type: Type): dict<number>
  var [_, lnum, col, _] = getpos('.')
  var char_list: list<number> = '.'->getline()->str2list()
  var count_map: dict<number> = {} # key: char, value: count
  var result: dict<number> = {}    # key: char, value: position_index
  var range: list<number>
  if type ==# Type.F || type ==# Type.T
    # left
    range = range(0, col - 1)->reverse()
  else
    # right
    range = range(col, char_list->len() - 1)
  endif
  for index: number in range
    var char: number = char_list->get(index)
    count_map[char] = count_map->get(char, 0) + 1
    if count_map->get(char) ==# v:count1
      result[char] = index
    endif
  endfor
  return result
enddef
def Press(type: Type): void
  var [_, lnum, _, _] = getpos('.')
  if type ==# Type.f || type ==# Type.F || type ==# Type.t || type ==# Type.T
    var char = getchar()
    var col = TargetPosition(Action.new(type, char))
    cursor(lnum, col + 1)
  elseif type ==# Type.comma
    TargetPosition(Action.newComma())
  elseif type ==# Type.semicolon
    TargetPosition(Action.newSemicolon())
  endif
enddef
def TargetPosition(action: Action): number
  var [_, lnum, col, _] = getpos('.')
  var char_list: list<number> = '.'->getline()->str2list()
  var range: list<number>
  if action.type ==# Type.f
    var count: number = 0
    for index: number in range(col, char_list->len() - 1)
      var char: number = char_list->get(index)
      if char ==# action.char
        count += 1
        if count ==# v:count1
          return index
        endif
      endif
    endfor
  endif
  return -1
enddef

def HighlightPrint(col_index_list: list<number>): void
  var [_, lnum, col, _] = getpos('.')
  var pos = col_index_list->mapnew((_, col_index) => [lnum, col_index + 1])
  HighlightClear()
  winid = win_getid()
  id = matchaddpos('ColorF', pos, 1001)
  redraw
enddef

def TestFf(type: Type): void
  HighlightPrint(SelectPosition(type)->values())
  Press(type)
enddef
noremap <Plug>(test-f) <ScriptCmd>TestFf(Type.f)<CR>
nnoremap f <Plug>(test-f)

# noremap <Plug>(test-f) <ScriptCmd>TestFf(Type.f)<CR>
# noremap <Plug>(test-t) <ScriptCmd>TestFf(Type.t)<CR>
# noremap <Plug>(test-F) <ScriptCmd>TestFf(Type.F)<CR>
# noremap <Plug>(test-T) <ScriptCmd>TestFf(Type.T)<CR>
# noremap <Plug>(test-;) <ScriptCmd>TestFf(Type.semicolon)<CR>
# noremap <Plug>(test-,) <ScriptCmd>TestFf(Type.comma)<CR>
# nnoremap f <Plug>(test-f)f
# nnoremap t <Plug>(test-t)t
# nnoremap F <Plug>(test-F)F
# nnoremap T <Plug>(test-T)T
# nnoremap ; <Plug>(test-;)
# nnoremap , <Plug>(test-,)
