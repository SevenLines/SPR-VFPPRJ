Lparameters pWord, pFirst

Local lcselect
Local retVal

lcselect = select()
select comshort
locate for trim(lower(FullName)) == lower(trim(pWord)) and iif(pFirst, isFirst, .T.)
if found()
  retVal = rtrim(ShortName)
  if isupper(left(pWord,1))
    retVal = upper(left(retVal,1)) + substr(retVal,2)
  else
  endif
 else
  retVal = ""
endif
select (lcselect)
return retVal
