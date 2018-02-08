Lparameters q
Local k,asd

k = sqlexec(lcn, q)
if k <= 0
 aerror(asd)
 messagebox(asd[2])
 return .F.
endif