Local lccur, q, k
Local retVal

retVal = CTOD("01.09."+CurYear)
lccur = sys(2015)
q = "SELECT dbegsyear FROM yearoptions WHERE syear=" + CurYear
k = sqlexec(lcn, q, lccur)
if k <= 0
 aerror(asd)
 messagebox(asd[2])
 return retVal
endif
select (lccur)
go top
if !empty(dbegsyear)
 retVal = TTOD(dbegsyear)
endif

use
return retVal