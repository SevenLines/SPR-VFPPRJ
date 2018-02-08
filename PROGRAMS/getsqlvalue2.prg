LParameters pValue
Local lcType, RetVal

RetVal = ""
lcType = TYPE('pValue')
do case
case lcType = 'C'
  RetVal = "'"+ trim(pValue) + "'"
 case lcType = 'N'
  RetVal = ltrim(str(pValue,10,3))
 case lcType = 'L' 
  if pValue
   RetVal = "1"
  else 
   RetVal = "0"
  endif
 case lcType = 'D'
  *RetVal = "convert(smalldatetime,'" + ltrim(str(day(pValue))) + "."+ltrim(str(month(pValue)))+"."+ltrim(str(year(pValue)))+"',104)"
  RetVal = "'" + ltrim(str(year(pValue))) + Replace(str(month(pValue), 2), ' ', '0') + Replace(str(day(pValue), 2), ' ', '0') + "'"
 case lcType = 'M' 
  RetVal = "'"+ trim(pValue) + "'"  
endcase
if (isnull(RetVal))
 RetVal = "null"
endif

return RetVal