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
  com = "SELECT valid FROM "+ listtbl+" WHERE idp="+str(lcidp)+"INTO CURSOR 'workcurs'"
  &com
  lcFiltOP = ""
  do case 
   case lcidp = 1
    lcFiltVal = "kk.aobozn" + lcIn
   case lcidp = 3
    lcFiltVal = "kk.fil" + lcIn
   case lcidp = 4
    lcFiltVal = "kk.kurs" + lcIn
   case lcidp = 19
    lcFiltVal = "shup.fobuch" + lcIn
   case lcidp = 6
    lcFiltVal = "kk.fac" + lcIn
  endcase 
  select workcurs
  lcFilt1 = ""
  scan
   lcFilt1 = lcFilt1+ltrim(str(valid))+","
  endscan
  select workcurs
  use
  
  if !empty(lcFilt1)
   lcFilt1 = "("+left(lcFilt1,len(lcFilt1)-1)+")"

   if empty(lcFilt)
    lcFilt = "(" + lcFiltVal + lcFilt1 + ")"
   else
    lcFilt = lcFilt + "and(" + lcFiltVal+ lcFilt1 + ")"
   endif
  endif
 endif
endscan

if !empty(lcFilt)
 lcFilt = lcFilt + "and(uws.vklrup = 1 AND pp.vklrup = 1)"
else
 lcFilt = "(uws.vklrup = 1 AND pp.vklrup = 1)"
endif

return lcFilt