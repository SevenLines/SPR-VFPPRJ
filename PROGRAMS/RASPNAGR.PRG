Local q, k
Local i

q = "EXEC getnagruz"
k = sqlexec(lcn, q, 'workcurs')
if k <= 0
 aerror(asd)
 messagebox(asd[2])
 return .F.
endif


select workcurs
go top
if eof()
 select workcurs
 use
 messagebox("Сначала необходимо рассчитать нагрузку")
else
 * расставляем группы, где нет подгрупп
 q = "SELECT id_7, kont FROM kontgrp WHERE depth = 1"
 k = sqlexec(lcn, q, 'kontgrp')
 if k <= 0
  aerror(asd)
  messagebox(asd[2])
  return .F.
 endif
 select workcurs
 scan
  if edplan = 1 AND id_7 = 0
   select kontgrp
   locate for kont = workcurs.kont
   if found()
    select workcurs 
    REPLACE id_7 WITH kontgrp.id_7
   else
    messagebox("Непредвиденная ошибка")
    select workcurs
   endif
  endif
 endscan 
 select kontgrp 
 use
 * добавляем данные по споточенным контингентам
 q = "SELECT n.*, pl.*, nt.edplan FROM nagruz n LEFT JOIN potoklist pl ON n.op = pl.op  LEFT JOIN normtime nt ON n.nt = nt.id_40 WHERE nt.edplan in (1, 2, 3) AND n.op <> 0"
 k = sqlexec(lcn, q, 'potoklist')
 if k <= 0
  aerror(asd)
  messagebox(asd[2])
  return .F.
 endif
 select potoklist
 scan
  do case
   case edplan = 1 && на подгруппы
    select workcurs
    for i = 1 to potoklist.pgroups
     APPEND BLANK
     if potoklist.sem % 2 = 1
      REPLACE up WITH potoklist.op, kont WITH potoklist.kont, op WITH potoklist.op, nt WITH potoklist.nt, ed_vr WITH potoklist.ed_vro, per WITH potoklist.pero, kontu WITH potoklist.konto, h WITH potoklist.ho, onagr WITH potoklist.onagro, allnagr WITH potoklist.allnagr, pred WITH potoklist.pred, kaf WITH potoklist.kaf, sem WITH 1, kurs WITH (potoklist.sem + 1)/2, fil WITH potoklist.fil, fobuch WITH potoklist.fobuch 
     else
      REPLACE up WITH potoklist.op, kont WITH potoklist.kont, op WITH potoklist.op, nt WITH potoklist.nt, ed_vr WITH potoklist.ed_vrv, per WITH potoklist.perv, kontu WITH potoklist.kontv, h WITH potoklist.hv, onagr WITH potoklist.onagrv, allnagr WITH potoklist.allnagr, pred WITH potoklist.pred, kaf WITH potoklist.kaf, sem WITH 2, kurs WITH potoklist.sem /2, fil WITH potoklist.fil, fobuch WITH potoklist.fobuch 
     endif
     *** REPLACE ????
    endfor
   case edplan = 2 && на группы
    select workcurs
    for i = 1 to potoklist.groups
     APPEND BLANK
     if potoklist.sem % 2 = 1
      REPLACE up WITH potoklist.op, kont WITH potoklist.kont, op WITH potoklist.op, nt WITH potoklist.nt, ed_vr WITH potoklist.ed_vro, per WITH potoklist.pero, kontu WITH potoklist.konto, h WITH potoklist.ho, onagr WITH potoklist.onagro, allnagr WITH potoklist.allnagr, pred WITH potoklist.pred, kaf WITH potoklist.kaf, sem WITH 1, kurs WITH (potoklist.sem + 1)/2, fil WITH potoklist.fil, fobuch WITH potoklist.fobuch 
     else
      REPLACE up WITH potoklist.op, kont WITH potoklist.kont, op WITH potoklist.op, nt WITH potoklist.nt, ed_vr WITH potoklist.ed_vrv, per WITH potoklist.perv, kontu WITH potoklist.kontv, h WITH potoklist.hv, onagr WITH potoklist.onagrv, allnagr WITH potoklist.allnagr, pred WITH potoklist.pred, kaf WITH potoklist.kaf, sem WITH 2, kurs WITH potoklist.sem /2, fil WITH potoklist.fil, fobuch WITH potoklist.fobuch 
     endif
     *** REPLACE ????
    endfor
   case edplan = 3 && на поток
    select workcurs
    APPEND BLANK
     if potoklist.sem % 2 = 1
      REPLACE up WITH potoklist.op, kont WITH potoklist.kont, op WITH potoklist.op, nt WITH potoklist.nt, ed_vr WITH potoklist.ed_vro, per WITH potoklist.pero, kontu WITH potoklist.konto, h WITH potoklist.ho, onagr WITH potoklist.onagro, allnagr WITH potoklist.allnagr, pred WITH potoklist.pred, kaf WITH potoklist.kaf, sem WITH 1, kurs WITH (potoklist.sem + 1)/2, fil WITH potoklist.fil, fobuch WITH potoklist.fobuch 
     else
      REPLACE up WITH potoklist.op, kont WITH potoklist.kont, op WITH potoklist.op, nt WITH potoklist.nt, ed_vr WITH potoklist.ed_vrv, per WITH potoklist.perv, kontu WITH potoklist.kontv, h WITH potoklist.hv, onagr WITH potoklist.onagrv, allnagr WITH potoklist.allnagr, pred WITH potoklist.pred, kaf WITH potoklist.kaf, sem WITH 2, kurs WITH potoklist.sem /2, fil WITH potoklist.fil, fobuch WITH potoklist.fobuch 
     endif
     *** REPLACE ????
  endcase
 endscan 
endif
select potoklist
use

* добавление данных по календарным срокам
q = "SELECT * FROM rabgraph"
k = sqlexec(lcn, q, 'rabgraph')
if k <= 0
 aerror(asd)
 messagebox(asd[2])
 return .F.
endif
SELECT DISTINCT kont, kontid FROM rabgraph INTO CURSOR 'kontlist'
select kontlist
scan
 SELECT * FROM rabgraph WHERE kont = kontlist.kont AND kontid = kontlist.kontid INTO CURSOR 'wc1'
 select wc1 
 locate for vr = 1
* ???? 
endscan


* сохранение в базу