Lparameters cprompt, cfname, cfext
Local filename
Local isopen
Local com

if !directory(ReportPath)
 ReportPath = SysPath + "Reports"
endif

com = "SET DEFAULT TO " + '"' + ReportPath + '"'
&com
filename = putfile(cprompt, cfname, cfext)
if !empty(filename)
 ReportPath = LEFT(filename, RAT("\", filename))
 if file(filename)
  isopen = .F.
  on error isopen = .T.
   delete file (filename)
  on error
 else 
  isopen = .F.
 endif
 if !isopen 
  return filename
 else
  messagebox('Скорее всего файл уже открыт, попробуйте закрыть его и повторить попытку') 
  return ""
 endif
else
 return ""
endif