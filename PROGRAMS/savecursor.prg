Lparameters pVFPTable, pSQLTable, pVFPid, pSQLid, pVFPFields, pSQLFields, pDeletedField
Local lcCurRec, lcSelect
Local lcrn, lcrnold, lcid, lcNumFields, lcval1, lcval2, lccur, lcnewid, i
Local q, k

DIMENSION lcaFSource[1]
DIMENSION lcaFDest[1]

lcSelect = select()
select (pVFPTable)
* получаем список полей
StringToArray(pVFPFields, ",", @lcaFSource)
StringToArray(pSQLFields, ",", @lcaFDest)
lcNumFields = ALEN(lcaFSource)
if lcNumFields <> ALEN(lcaFDest)
 messagebox("Кол-во полей неоднозначно")
 SET DELETED ON
 select (lcSelect)
 return .F.
endif
for i=1 to lcNumFields
 if type(lcaFSource[i]) = "U"
  messagebox("нет поля с именем '" + lcaFSource[i] + "'")
  SET DELETED ON
  select (lcSelect)
  return .F.
 endif
 if empty(GetSQLValue(lcaFSource[i]))
  messagebox("не могу конвертировать тип поля '" + lcaFSource[i] + "'")
  SET DELETED ON
  select (lcSelect)
  return .F.
 endif
endfor

lccur = sys(2015)
SET DELETED OFF
lcCurRec = recno()
lcrnold = 0
lcrn = getnextmodified(lcrnold)
do while  lcrn <> 0
 lcrnold = lcrn
 go lcrn
 lcid = " WHERE " + pSQLid + "=" + ltrim(str(&pVFPid))
 if deleted() && запись удалялась
  if getfldstate(0) <= 2
   if !empty(pDeletedField)
    q = "UPDATE " + pSQLTable + " SET deleted = 1" + lcid
   else
    q = "DELETE FROM " + pSQLTable + lcid
   endif
   k = sqlexec(lcn, q)
   if k <= 0
    aerror(asd)
    messagebox(asd[2])
    messagebox(q)
    return .F.
   endif
  endif
 else 
  if getfldstate(0) > 2 && запись добавлялась
   lcval1 = "(" + pSQLFields + ")"
*   lcval1 = "(" + lcaFSource[1]
   lcval2 = "(" + GetSQLValue(lcaFSource[1])
   for i = 2 to lcNumFields
*    lcval1 = lcval1 + "," + lcaFSource[i]
    lcval2 = lcval2 + "," + GetSQLValue(lcaFSource[i])
   endfor
*   lcval1 = lcval1 + ")"
   lcval2 = lcval2 + ")"
   q = "INSERT INTO " + pSQLTable + lcval1 + " VALUES " + lcval2
   k = sqlexec(lcn, q)
   if k <= 0
    aerror(asd)
    messagebox(asd[2])
    messagebox(q)
    return .F.
   endif
   q = "SELECT @@identity as id_"
   k = sqlexec(lcn, q, lccur)
   k = sqlexec(lcn, q)
   if k <= 0
    aerror(asd)
    messagebox(asd[2])
    messagebox(q)
    return .F.
   endif
   select (lccur)
   lcnewid = id_
   use
   select (pVFPTable)
   REPLACE &pSQLid WITH lcnewid
  else && запись изменялась
   lcval1 = ""
   for i = 1 to lcNumFields
    if getfldstate(lcaFSource[i]) <> 1
     lcval1 = lcval1 + lcaFDest[i] + "=" + GetSQLValue(lcaFSource[i]) + ","
    endif
   endfor
   if !empty(lcval1)
    lcval1 = LEFT(lcval1, LEN(lcval1)-1)
    q = "UPDATE " + pSQLTable + " SET " + lcval1 + lcid
    k = sqlexec(lcn, q)
    if k <= 0
     aerror(asd)
     messagebox(asd[2])
     messagebox(q)
     return .F.
    endif
   endif 
  endif
 endif

 lcrn = getnextmodified(lcrnold)
enddo

if lcCurRec < reccount()
 go lcCurRec
else
 go bottom
endif 

TABLEUPDATE(.T.)
SET DELETED ON
select (lcSelect)
return .T.