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
          if mode ==# 'n'
                  var char = getchar()
                  var col = TargetPosition(Action.new(type, char))
                  if col !=# -1
                    keepjump cursor(lnum, col + 1)
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
                    keepjump cursor(lnum, col + 1)
                  else
                    try
                      undojoin
                    catch
                    endtry
                  endif
          endif
    # var char = getchar()
    # var col = TargetPosition(Action.new(type, char))
    # if col !=# -1
    #   var line = getline('.')
    #   if mode ==# 'n'
    #     keepjump cursor(lnum, col + 1)
    #     Action.last_action = Action.newChar(type, char)
    #   elseif mode ==# 'no'
    #       normal! v
    #       keepjump cursor(lnum, col + 1)
    #       is_dot_repeat = true
    #       Action.last_action = Action.newChar(type, char)
    #       Action.last_o_action = Action.newChar(type, char)
    #     endif
    #   endif
    # endif
  elseif type ==# Type.F
    getchar()
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
def PrintBackground(position: dict<number>): void
  var win_view = winsaveview()
  var [_, lnum, col, _] = getpos('.')
  # f的时候
  # for [key, value] in position -> items()
  #   # wincol() 当前光标在window中的列号
  #   # virtcol([lnum, col]) 当前光标的列号
  #   # wincol() - virtcol([lnum, col]) window左边的宽度
  #   # win_view.leftcol 当前显示的最左的字符的列号
  #   # virtcol([lnum, value]) 目标列号
  #   # virtcol([lnum, value]) - win_view.leftcol 最左到目标的距离(需要小于宽度(减去最左多余的宽度))
  #   if wincol() - virtcol([lnum, col]) + virtcol([lnum, value]) - win_view.leftcol <# winwidth(0)
  #     popup_create(key->str2nr()->nr2char(), {
  #       col: 'cursor+' .. (1 + virtcol([lnum, value]) - virtcol([lnum, col]))->string(),
  #       line: 'cursor',
  #       highlight: 'ColorF',
  #       posinvert: false,
  #       flip: false,
  #       fixed: true,
  #       wrap: false,
  #       moved: 'any'
  #     })
  #   endif
  # endfor
  # F的情况
  for [key, value] in position -> items()
    # 当前列号要大于最左列号
    if win_view.leftcol <=# virtcol([lnum, value]) 
      popup_create(key->str2nr()->nr2char(), {
        col: 'cursor-' .. -(1 + virtcol([lnum, value]) - virtcol([lnum, col])),
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
  # var line = getline('.')
  # var prop_list = prop_list(lnum)->reverse()->sort((x, y) => {
  #   if x.col ># y.col
  #     return 1
  #   elseif x.col <# y.col
  #     return -1
  #   else
  #     var xType = prop_type_get(x.type)
  #     var yType = prop_type_get(y.type)
  #     if xType.priority ># yType.priority
  #       return -1
  #     else
  #       return 1
  #     endif
  #   endif
  #   })
  # var str: string = ''
  # var props: list<dict<any>> = []
  # if prop_list->empty()
  #   str = line
  #   props = [{col: 1, type: 'myf_prop_normal'}]
  # else
  #   for index in range(0, prop_list->len() - 1)
  #     var prop1: dict<any> = {type: 'myf_prop_normal', col: str->len() + 1}
  #     var prop2: dict<any> = {type: 'myf_prop_comment'}
  #     str ..= line[(index ==# 0 ? 0 : (prop_list[index - 1].col) - 1) : (prop_list[index].col - 2)]
  #     prop1.length = str->len() + 1 - prop1.col
  #     prop2.col = str->len() + 1
  #     str ..= prop_list[index].text
  #     prop2.length = str->len() + 1 - prop2.col
  #       props->add(prop1)
  #       props->add(prop2)
  #   endfor
  #   var prop_last = {type: 'myf_prop_normal', col: str->len() + 1}
  #   str ..=  line[(prop_list[prop_list->len() - 1].col - 1) : (line->len() - 1)]
  #   prop_last.length = str->len() + 1 - prop_last.col
  #   props->add(prop_last)
  # endif
  # popup_create([ {text: str, props: props} ], { col: 'cursor',
  # # 'cursor-' .. (col - 1),
  # line: 'cursor',
  # # border: []
  # fixed: true,
  # wrap: false,
  # })
  redraw
enddef

def TestFf(type: Type): void
  var position = SelectPosition(type)
  if !is_dot_repeat
    PrintBackground(position)
  endif
  Press(type)
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
