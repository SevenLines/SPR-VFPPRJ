LParameters Letter

if inlist(Letter, 'à','å','¸','è','î','ó','û','ı','ş','ÿ')
 return 1
endif 
if inlist(Letter, 'ü','ú','é')
 return 2
endif 
if inlist(Letter, ' ',',','-',')','(')
 return -1
endif
if inlist(Letter, '.')
 return -2
endif
return 3