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
  f('f'),
  t('t'),
  F('F'),
  T('T'), 
  semicolon(';'),
  comma(',')

  var key: string
  static var _dict: dict<Type> = {}
  static def Get(key: string): Type
    if _dict->empty()
      for type in Type.values
        _dict[type.key] = type
      endfor
    endif
    return _dict->get(key, null)
  enddef
  def ToString(): string
    return this.key
  enddef
endenum

class Action
  var type: Type
  var char: number
  public static var last_action: Action = null
  def new(this.type, this.char)
  enddef
  def newChar(type: Type, char: string)
    this.type = type
    this.char = char[0]->str2list()[0]
  enddef
  def newSemicolon()
    this.type = Type.semicolon
  enddef
  def newComma()
    this.type = Type.comma
  enddef
endclass

# @return dict<number> key: char_number, value: position_index
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
  var mode = mode(true)
  if type ==# Type.f
   # echo type.ToString() .. ': '
    var char = getchar()
    var col = TargetPosition(Action.new(type, char))
    var line = getline('.')
    if mode ==# 'n'
      keepjump cursor(lnum, col + 1)
    elseif mode ==# 'no'
      normal! v
      keepjump cursor(lnum, col + 1)
    endif

  elseif type ==# Type.comma
    TargetPosition(Action.newComma())
  elseif type ==# Type.semicolon
    TargetPosition(Action.newSemicolon())
  endif
enddef
def TargetPosition(action: Action, result: dict<number> = {}): number
  var [_, lnum, col, _] = getpos('.')
  var char_list: list<number> = '.'->getline()->str2list()
  var range: list<number>
  if !result->empty()
    if result->has_key(action.char)   
      return result[action.char]
    else
      return -1
    endif
  endif
  if action.type ==# Type.f
    var count: number = 0
    for index: number in range(col, char_list->len() - 1)
      var char: number = char_list->get(index)
      if char ==# action.char
        ++count
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
def Repeat(type: Type): string
  return ''
enddef
def Test(): string
  echo 'bb'
  return ''
enddef
# 点操作时, 不会打印bb
noremap f <Plug>(press)<Plug>(test-f)

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
