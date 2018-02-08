Local lccur, q, k
Local retVal

retVal = 0
lccur = sys(2015)
q = "SELECT id_0 FROM sysoptions"
k = sqlexec(lcn, q, lccur)
if k <= 0
 aerror(asd)
 messagebox(asd[2])
 return retVal
endif
select (lccur)
go top
retVal = id_0

use
return retVal