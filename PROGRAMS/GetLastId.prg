Local lccur, q, k
Local retVal

lccur = sys(2015)
q = "SELECT @@identity id_"
k = sqlexec(lcn, q, lccur)
if k <= 0
 aerror(asd)
 messagebox(asd[2])
 return .F.
endif
select (lccur)
go top
retVal = id_
use
return retVal
