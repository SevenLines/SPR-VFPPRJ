LParameters maintbl, listtbl
Local lcidp
Local lcFilt, lcFiltVal, lcFilt1, lcFiltOP, lcIn, lcVKL
Local com

lcFilt = ""
select (maintbl)
scan
 select (maintbl)
 lcidp = idp
 if vkl <> 0
  lcVKL = vkl
  lcIn = " in"
  if lcVKL = 2
   lcIn = " not in"
  endif
  com = "SELECT val, valid FROM "+ listtbl+" WHERE idp="+str(lcidp)+"INTO CURSOR 'workcurs'"
  &com
  lcFiltOP = ""
  do case 
   case lcidp = 1
    lcFiltVal = "kk.aobozn" + lcIn
   case lcidp = 3
    lcFiltVal = "kk.fil" + lcIn
   case lcidp = 4
    lcFiltVal = "kk.kurs" + lcIn
   case lcidp = 5
    lcFiltVal = "shup.afobuch" + lcIn
   case lcidp = 6
    lcFiltVal = "kk.fac" + lcIn
   case lcidp = 19 
    lcFiltVal = "shup.fobuch" + lcIn
   case lcidp = 20
    lcFiltVal = "shup.shifr like"
  endcase 
  select workcurs
  lcFilt1 = ""
  scan
   if inlist(lcidp, 20)
    if (!empty(lcFilt1))
     lcFilt1 = lcFilt1 + " or "
    endif
    lcFilt1 = lcFilt1 + lcFiltVal + "'" + ltrim(rtrim(val)) + "'"
   else
    if (!empty(lcFilt1))
     lcFilt1 = lcFilt1 + ","
    endif
    lcFilt1 = lcFilt1 + ltrim(str(valid))
   endif
  endscan
  select workcurs
  use
  
  if !empty(lcFilt1)
   if inlist(lcidp, 20)
    lcFilt1 = "(" + lcFilt1 + ")"
   else
    lcFilt1 = "(" + lcFilt1 + ")"
    lcFilt1 = "(" + lcFiltVal + lcFilt1 + ")"
   endif

   if empty(lcFilt)
    lcFilt = lcFilt1
   else
    lcFilt = lcFilt + "and" + lcFilt1
   endif
  endif
 endif
endscan

if !empty(lcFilt)
 lcFilt = left(lcFilt,len(lcFilt)-1) + "and(syear="+CurYear+"))"
else
 lcFilt = "(syear="+CurYear+")"
endif

return lcFilt