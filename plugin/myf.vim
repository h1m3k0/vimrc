vim9script noclear

var id: number
var winid: number
var is_dot_repeat: bool = true

highlight ColorF gui=standout
if prop_type_get('myf_prop_normal')->empty()
  prop_type_add('myf_prop_normal', {})
endif
if prop_type_get('myf_prop_target')->empty()
  prop_type_add('myf_prop_target', { highlight: 'IncSearch' })
endif
if prop_type_get('myf_prop_comment')->empty()
  prop_type_add('myf_prop_comment', { highlight: 'Comment' })
endif
def HighlightClear(): void
  # if id > 0
  #   id = id->matchdelete(winid)
  # endif
  popup_clear()
enddef

augroup fFtTHighlight | autocmd!
  autocmd CursorMoved,ModeChanged,TextChanged,WinEnter,WinLeave,CmdWinLeave,SafeState * HighlightClear()
  autocmd CursorMoved,ModeChanged,TextChanged,WinEnter,WinLeave,CmdWinLeave,SafeState * highlight ColorF gui=standout
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
  public static var last_o_action: Action = null
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
  var [_, lnum, col, _] = getcharpos('.')
  var char_list: list<number> = '.'->getline()->str2list()
  var count_map: dict<number> = {} # key: char, value: count
  var result: dict<number> = {}    # key: char, value: position_index
  var range: list<number>
  if type ==# Type.F || type ==# Type.T
    # left
    range = range(0, col - 2)->reverse()
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


def Press(type: Type, position: dict<number>): void
  var [_, lnum, _, _] = getcharpos('.')
  var mode = mode(true)
  if type ==# Type.f
          if mode ==# 'n'
                  var char = getchar()
                  var col = TargetPosition(Action.new(type, char))
                  if col !=# -1
                    keepjump setcursorcharpos(lnum, col + 1)
                    Action.last_action = Action.new(type, char)
                  endif
          elseif mode ==# 'no'
                  var char: number
                  if is_dot_repeat
                    char = Action.last_o_action.char
                  else
                    is_dot_repeat = true
                    char = getchar()
                  endif
                  var col = TargetPosition(Action.new(type, char))
                  if col !=# -1
                    Action.last_action = Action.new(type, char)
                    Action.last_o_action = Action.new(type, char)
                    normal! v
                    keepjump setcursorcharpos(lnum, col + 1)
                  else
                    try
                      undojoin
                    catch
                    endtry
                  endif
          endif
  elseif type ==# Type.F
          if mode ==# 'n'
                  var char = getchar()
                  var col = TargetPosition(Action.new(type, char), position)
                  if col !=# -1
                    keepjump setcursorcharpos(lnum, col + 1)
                    Action.last_action = Action.new(type, char)
                  endif
          elseif mode ==# 'no'
                  var char: number
                  if is_dot_repeat
                    char = Action.last_o_action.char
                  else
                    is_dot_repeat = true
                    char = getchar()
                  endif
                  var col = TargetPosition(Action.new(type, char), position)
                  if col !=# -1
                    Action.last_action = Action.new(type, char)
                    Action.last_o_action = Action.new(type, char)
                    # normal! v # 向左删不能用v
                    keepjump setcursorcharpos(lnum, col + 1)
                  else
                    try
                      undojoin
                    catch
                    endtry
                  endif
          endif
  elseif type ==# Type.comma
    TargetPosition(Action.newComma())
  elseif type ==# Type.semicolon
    TargetPosition(Action.newSemicolon())
  endif
enddef


def TargetPosition(action: Action, result: dict<number> = {}): number
  var [_, lnum, col, _] = getcharpos('.')
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
def PrintBackground(type: Type, position: dict<number>): void
  var win_view = winsaveview()
  var [_, lnum, col, _] = getpos('.')
  # current 当前的字符
  # current_add 当前字符为中文时, 
  #   popup_create需要在当前字符结尾处展开(计算当前字符宽度)
  var current = getline('.')[getcharpos('.')[2] - 1]
  var current_add = strwidth(current) - 1
  # f的时候
  if type ==# Type.f || type ==# Type.t
      for [key, value] in position -> items()
        var byte_position = strlen(getline('.')[0 : value - 1])
        # wincol()                                   当前光标在window中的列号
        # virtcol([lnum, col])                       当前光标的列号
        # wincol() - virtcol([lnum, col])            window左边的宽度
        # win_view.leftcol                           当前显示的最左的字符的列号
        # virtcol([lnum, value])                     目标列号
        # virtcol([lnum, value]) - win_view.leftcol  最左到目标的距离(需要小于宽度(减去最左多余的宽度))
        if wincol() - virtcol([lnum, col]) + virtcol([lnum, byte_position]) - win_view.leftcol <# winwidth(0)
          popup_create(key->str2nr()->nr2char(), {
            col: 'cursor+' .. (1 + current_add + virtcol([lnum, byte_position]) - virtcol([lnum, col]))->string(),
            line: 'cursor',
            highlight: 'ColorF',
            posinvert: false,
            flip: false,
            fixed: true,
            wrap: false,
            moved: 'any'
          })
        endif
      endfor
  endif
  # F的情况
  if type ==# Type.F || type ==# Type.T
      for [key, value] in position -> items()
        var byte_position = strlen(getline('.')[0 : value - 1])
        # 当前列号要大于最左列号
        if win_view.leftcol <=# virtcol([lnum, byte_position])
          popup_create(key->str2nr()->nr2char(), {
            col: 'cursor-' .. -(1 + current_add + virtcol([lnum, byte_position]) - virtcol([lnum, col])),
            line: 'cursor',
            highlight: 'ColorF',
            posinvert: false,
            flip: false,
            fixed: true,
            wrap: false,
            moved: 'any'
          })
        endif
      endfor
  endif
  redraw
enddef

def TestFf(type: Type): void
  var position = SelectPosition(type)
  if !is_dot_repeat
    PrintBackground(type, position)
  endif
  Press(type, position)
enddef
def Repeat(type: Type): string
  return ''
enddef
def IsNotDotRepeat(): string
  is_dot_repeat = false
  return ''
enddef
# 点操作时, 不会打印bb
noremap <Plug>(test-f) <ScriptCmd>TestFf(Type.f)<CR>
noremap <Plug>(test-F) <ScriptCmd>TestFf(Type.F)<CR>
noremap <expr><silent> <Plug>(is-not-dot-repeat) <SID>IsNotDotRepeat()
noremap f <Plug>(is-not-dot-repeat)<Plug>(test-f)
noremap F <Plug>(is-not-dot-repeat)<Plug>(test-F)

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
