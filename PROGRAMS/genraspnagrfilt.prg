LParameters maintbl, listtbl, preplisttbl, audlisttbl
Local lcidp
Local lcFilt, lcFiltVal, lcFilt1, lcFiltOP, lcIn, lcVKL
Local com

lcFilt = ""
lcFiltVal = ""
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
    lcFiltOP = "r.op" + lcIn + "(select t.op from vw_pkglist t where t.syear="+ CurYear+" and t.aobozn in"
   case lcidp = 2
    lcFiltVal = "r.kaf" + lcIn
   case lcidp = 3
    lcFiltVal = "isnull(kk.fil,pl.fil)" + lcIn
   case lcidp = 4
    lcFiltVal = "isnull(kk.kurs,ceiling((pl.semestr+1)/2))" + lcIn
   case lcidp = 5
    lcFiltVal = "isnull(pl.fobuch,shup.afobuch)" + lcIn
   case lcidp = 6
    lcFiltVal = "kk.fac" + lcIn
    lcFiltOP = "r.op" + lcIn + "(select t.op from vw_pkglist t where t.syear="+ CurYear+" and t.fac in"
   case lcidp = 7
    lcFiltVal = "r.kont" + lcIn
    lcFiltOP = "r.op" + lcIn + "(select t.op from vw_pkglist t where t.syear="+ CurYear+" and t.kont in"
   case lcidp = 8
    lcFiltVal = "r.kontid" + lcIn
   case lcidp = 9
    lcFiltVal = "r.sem" + lcIn
   case lcidp = 10
    lcFiltVal = "nt.vacabul < 3 and r.pred" + lcIn
   case lcidp = 11
    lcFiltVal = "vnt.id_41" + lcIn
   case lcidp = 12
    lcFiltVal = "r.prep" + lcIn
   case lcidp = 13  
    lcFiltVal = "r.aud" + lcIn
   case lcidp = 14
    lcFiltVal = "isnull(pl.stud,isnull(kgr.students,kk.stud))" + iif(lcVKL=1,">=","<")
   case lcidp = 15
    lcFiltVal = "isnull(pl.stud,isnull(kgr.students,kk.stud))" + iif(lcVKL=1,"<=",">")
   case lcidp = 16
    lcFiltVal = "r.nagrtype" + lcIn
   case lcidp = 17
    lcFiltVal = "r.dbeg" + iif(lcVKL=1,">=","<")
   case lcidp = 18
    lcFiltVal = "r.dbeg+r.days-1" + iif(lcVKL=1,"<=",">")
   case lcidp = 19
    lcFiltVal = "shup.fobuch" + lcIn 
  endcase 
  select workcurs
  lcFilt1 = ""
  scan
   lcFilt1 = lcFilt1+ltrim(str(valid))+","
   if inlist(lcidp, 12, 13) && списки преподвателей и аудиторий
    if lcidp = 12 && преподаватели
     com =  "SELECT DISTINCT idp FROM "+preplisttbl+" WHERE valid=workcurs.valid INTO CURSOR 'workcurs2'"
    endif
    if lcidp = 13 && аудитории
     com = "SELECT DISTINCT idp FROM "+audlisttbl+" WHERE valid=workcurs.valid INTO CURSOR 'workcurs2'"
    endif
    &com
    select workcurs2
    scan
     lcFilt1 = lcFilt1+ltrim(str(idp))+","
    endscan
    use
    select workcurs
   endif
  endscan
  select workcurs
  use
  
  if !empty(lcFilt1)
   lcFilt1 = "("+left(lcFilt1,len(lcFilt1)-1)+")"

   if !empty(lcFiltOP) && контингент споточенность
    if lcVKL = 1
     lcFiltVal = "(" + lcFiltOP +lcFilt1+") or " + lcFIltVal + lcFilt1 + ")"
    else
     lcFiltVal = "(" + lcFiltOP +lcFilt1+") and (r.op>0 or " + lcFIltVal + lcFilt1 + "))"
    endif
   else
    lcFiltVal = "(" + lcFiltVal + lcFilt1 + ")"
   endif
   
   if empty(lcFilt)
    lcFilt = lcFiltVal 
   else
    lcFilt = lcFilt + "and" + lcFiltVal
   endif
  endif
 endif
endscan

if !empty(lcFilt)
 lcFilt = left(lcFilt,len(lcFilt)-1) + "and(r.syear="+CurYear+"))"
else
 lcFilt = "(r.syear="+CurYear+")"
endif
return lcFilt