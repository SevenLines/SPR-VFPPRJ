LParameters Letter

if inlist(Letter, '�','�','�','�','�','�','�','�','�','�')
 return 1
endif 
if inlist(Letter, '�','�','�')
 return 2
endif 
if inlist(Letter, ' ',',','-',')','(')
 return -1
endif
if inlist(Letter, '.')
 return -2
endif
return 3