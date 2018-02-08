Lparameters pfname, pname
Local lcf
lcf = fopen(pfname,10)
if lcf > 0 
 fseek(lcf, 0, 0)
 stroka = alltrim(fgets(lcf))
 do while !empty(stroka)
  if (upper(pname) == upper(substr(stroka,1,len(pname))))
   fclose(lcf)
   return alltrim(substr(stroka, AT("=",stroka)+1))
  endif
  stroka = alltrim(fgets(lcf))
 enddo
 fclose(lcf)
endif
return ""