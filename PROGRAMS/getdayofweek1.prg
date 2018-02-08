Lparameters pdate
Local lcdow, RetVal

lcdow = DOW(pdate,2)
do case 
 case lcdow = 1
  RetVal = "ом"
 case lcdow = 2
  RetVal = "бр"
 case lcdow = 3
  RetVal = "яп"
 case lcdow = 4
  RetVal = "вр"
 case lcdow = 5
  RetVal = "ор"
 case lcdow = 6
  RetVal = "яа"
 case lcdow = 7
  RetVal = "бя"
 otherwise 
  RetVal = "???"
endcase

return RetVal