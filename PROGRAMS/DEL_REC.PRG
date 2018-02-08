PROCEDURE del_rec
 Lparameters del_id, mcur

 Local lccur
 
 lccur = sys(2015)
 select * from (mcur) into cursor (lccur) where parent = del_id
 select (lccur)
 scan all
  del_rec(id_10, mcur)
 endscan
 select (lccur)
 use
 select (mcur)
 delete for id_10 = del_id 
ENDPROC

