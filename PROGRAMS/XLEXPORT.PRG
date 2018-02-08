Lparameters ptempname, pxlsfname, pdbffname, pfldlist, pstartrow

Local i, com, xl
Local tempf, lcnumrecs, lcnumflds

tempf = 'temp'
do while file(tempf+'.xls')
 tempf = tempf+'_'
enddo
i = 1
do while AT(",", pfldlist, i) <> 0
 i = i + 1
enddo
lcnumflds = i 

select (pdbffname)
lcnumrecs = reccount()
com = "EXPORT TO (tempf) TYPE XLS FIELDS "+pfldlist
&com
xl = createobject('excel.application')
xl.workbooks.open(fullpath(ptempname))
xl.application.range(xl.application.cells(PStartRow+1, 1), xl.application.cells(PStartRow+lcNumRecs-1, 1)).EntireRow.insert
xl.workbooks.open(fullpath(tempf))
xl.application.range(xl.application.cells(2,1), xl.application.cells(lcnumrecs + 1, lcnumflds)).copy
xl.application.Workbooks(1).Activate
WITH xl.application
 .cells(pstartrow, 1).select
 .activesheet.paste
  WITH .selection
   .borders(7).weight = 2
   .borders(8).weight = 2
   .borders(9).weight = 2
   .borders(10).weight = 2
   .borders(11).weight = 2
   .borders(12).weight = 2
  ENDWITH
 .CutCopyMode = .F.
 .activeworkbook.saveas(pxlsfname,-4143)
 .activeworkbook.close
 .activeworkbook.close
ENDWITH
release xl

if file(tempf+'.xls')
 delete file (tempf+'.xls')
endif


