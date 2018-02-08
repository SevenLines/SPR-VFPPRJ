procedure makenum
 lparameters num
 local lstr
 lstr = ltrim(str(num))
 if len(lstr) < 2
  lstr = '0'+lstr
 endif
 return lstr
endproc