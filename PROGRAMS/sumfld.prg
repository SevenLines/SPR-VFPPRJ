PROCEDURE sumfld
 lparameters foxfld, foxtbl, spcfld
 local k1, prnt, dpth, n_v, lcrecno, lcspc
 select (foxtbl)
 if (cursorgetprop("buffering", foxtbl)<> 5 or getfldstate(foxfld, foxtbl) <> 1)
  lcrecno = recno()
  dpth = depth
  for k1 = dpth to 2 step -1
   select (foxtbl)
   prnt = parent
   n_v = 0
   if !empty(spcfld)
    lcspc = &spcfld
   endif
   scan for parent = prnt 
    if !empty(spcfld)
     if &spcfld = lcspc
      n_v = n_v + &foxfld
     endif
    else 
     n_v = n_v + &foxfld
    endif
   endscan
   select (foxtbl)
   locate for id_10 = prnt 
   if found()
    if !empty(spcfld)
     if &spcfld = lcspc 
      REPLACE (foxfld) WITH n_v
     endif
    else
     REPLACE (foxfld) WITH n_v
    endif
   else
    messagebox("�������������� ������ � ��������� �������")
   endif
  endfor
  GO lcrecno
 endif
ENDPROC 