Lparameters foxtbl, foxfld, sqltbl, sqlfldval, sqlfldid, sqlcondition 
Local lcoldsel
Local q, k, fldval, insvalue
Local i, j, lcval1, lcval2
DECLARE lcvars[1]
DECLARE lcelems[1]


lcoldsel = select()
select (foxtbl)
if getfldstate(foxfld) <> 1
 fldval = foxtbl + '.' + foxfld
 q = "SELECT " + sqlfldid + " as id_ FROM " + sqltbl + " WHERE " + sqlcondition
 k = sqlexec(lcn, q, 'temp')
 if k <= 0 
  aerror(asd)
  messagebox(asd[2])
  messagebox(q)
  return .F.
 endif
 select temp
 go top
 if !eof()  && ������ ��� ����
  lcid = str(id_)
  use
  q = "UPDATE " + sqltbl + " SET " + sqlfldval + "='" +rtrim(&fldval) + "' WHERE " + sqlfldid + "=" + lcid
  k = sqlexec(lcn, q)
  if k <= 0
   aerror(asd)
   messagebox(asd[2])
   messagebox(q)
   return .F.
  endif
 else && ������ ���
  use
   lcVal1 = ""
   lcVal2 = ""
   StringToArray(sqlCondition, "and", @lcvars)
   for i = 1 to ALEN(lcvars)
    StringToArray(lcvars[i], "=", @lcelems)
    lcVal1 = lcVal1 + lcelems[1] + ","
    lcVal2 = lcVal2 + lcelems[2] + ","
   endfor
   q = "INSERT INTO " + sqltbl + "("+lcVal1+sqlfldval+") VALUES(" +lcVal2+ "'"+rtrim(&fldval) + "')"
   k = sqlexec(lcn, q)
   if k <= 0
    aerror(asd)
    messagebox(asd[2])
    messagebox(q)
    return .F.
   endif
 endif
endif

select (lcoldsel)