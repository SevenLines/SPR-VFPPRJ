Function GetFontSize(CellWidth, CellHeight, TextLength, DefaultValue, WidthKoeff)
 Local retval, i, lcselect
 if empty(DefaultValue)
  DefaultValue = 8
 endif
 if TextLength = 0
  return DefaultValue
 endif
 if empty(WidthKoeff)
  WidthKoeff = 100
 endif
 lcselect = select()
 RetVal = DefaultValue
 select fontdef
 go bottom
 for i = reccount() to 1 step -1
  if (floor(CellHeight/StrHeight)*(CellWidth/WidthKoeff)*SimbInStr >= TextLength);
  			or (FntSize = DefaultValue)
   RetVal = FntSize
   exit
  endif
  skip -1
 endfor
 select (lcselect)
 return RetVal
EndFunc