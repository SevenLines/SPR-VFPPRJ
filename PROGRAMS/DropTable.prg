Lparameters pTable
Local com
select (pTable)
use
if file(pTable+'.dbf')
 com = "delete file " + pTable + '.dbf'
 &com
endif

