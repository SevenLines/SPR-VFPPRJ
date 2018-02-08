LParameters pTblAlias
Local com, numflds
Local i

numflds = AFIELDS(aFlds, pTblAlias)

for i = 1 to numflds
 if aFlds[i, 2] = 'I' or aFlds[i, 2] = 'N'
  com = "ALTER TABLE " + pTblAlias + " ALTER COLUMN " + aFlds[i, 1] + " C(10)"
  &com
  com = "UPDATE " + pTblAlias + " SET " + aFlds[i,1] + "=ltrim("+aFlds[i, 1]+")"
  &com
  com = "UPDATE " + pTblAlias + " SET " + aFlds[i,1] + "='' WHERE "+aFlds[i, 1]+"='0'"
  &com
 endif
endfor