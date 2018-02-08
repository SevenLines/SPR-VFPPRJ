Lparameters strMain,strFind,strReplace
Local lcstr, PosOfComma, RetVal
lcstr = strMain
PosOfComma = AT(strFind,lcstr)
RetVal = ""

do while(PosOfComma != 0)
 RetVal = RetVal + LEFT(lcstr,PosOfComma - 1) + strReplace
 lcstr = SUBSTR(lcstr,PosOfComma+LEN(strFind))
 PosOfComma = AT(strFind,lcstr)
enddo 

RetVal = RetVal + lcstr
return RetVal
