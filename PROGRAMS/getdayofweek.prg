Lparameters pdate
Local lcdow, RetVal

lcdow = DOW(pdate,2)
do case 
 case lcdow = 1
  RetVal = "�����������"
 case lcdow = 2
  RetVal = "�������"
 case lcdow = 3
  RetVal = "�����"
 case lcdow = 4
  RetVal = "�������"
 case lcdow = 5
  RetVal = "�������"
 case lcdow = 6
  RetVal = "�������"
 case lcdow = 7
  RetVal = "�����������"
 otherwise 
  RetVal = "???"
endcase

return RetVal