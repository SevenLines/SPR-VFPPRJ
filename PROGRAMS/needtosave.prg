Lparameters pTblAlias

select (pTblAlias)
if getnextmodified(0) <> 0
 if messagebox("������� ���������. ���������?", 4) = 6
  return .T.
 endif
endif
return .F.