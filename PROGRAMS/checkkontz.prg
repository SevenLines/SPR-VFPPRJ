Local q, k
Local miststr

q = "EXEC up_kont 2, " + CurYear
k = sqlexec(lcn, q, 'up_kont')
if k <= 0
 aerror(asd)
 messagebox(asd[2])
 return .F.
endif

miststr = ""
select up_kont
scan
 if isnull(id_1)
  miststr = miststr + "���� " + ltrim(str(shkurs)) + " �� " + rtrim(shifr) + "(���) ���. � ���, �� �� ������ � ������������"  + chr(13)
 endif
endscan
use

if !empty(miststr)
 messagebox(miststr)
 return .F.
endif

return .T.