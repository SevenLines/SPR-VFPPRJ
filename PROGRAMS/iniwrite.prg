Lparameters pfname, pname, pvalue
Local ppos,lcf,lcf1,lfname,lexist
lexist = .F.
lfname = SUBSTR(SYS(2015), 3, 10)
lcf = fopen(pfname,10)
lcf1 = fcreate(lfname,0)
fseek(lcf, 0, 0)
stroka = alltrim(fgets(lcf))
do while !empty(stroka)
 if (upper(pname) == upper(substr(stroka,1,len(pname))))
  fputs(lcf1,upper(pname)+"="+pvalue)
  lexist = .T.
 else
  fputs(lcf1,stroka)
 endif
 stroka = alltrim(fgets(lcf))
enddo
if !lexist
 fputs(lcf1,upper(pname)+"="+pvalue)
endif
fclose(lcf)
fclose(lcf1)
DELETE FILE &pfname
COPY FILE &lfname TO &pfname
DELETE FILE &lfname
return .T.