Lparameters pshup
Local q, k
Local lcsem, lcnumsem, lcnumses
Local lcnpp, lcalldays, lcspclntionCondition

CREATE TABLE typgrz (npp N(4), kurs N(4), vr N(4), days N(4))

*получаем данные дл€ графика
 * специализаци€ (если есть)
q = "SELECT TOP 1 id_25 FROM spclntion WHERE shup = " + str(pshup)
k = sqlexec(lcn, q, 'spclntion')
if k <= 0
 aerror(asd)
 messagebox(asd[2])
 return .F.
endif
lcspclntionCondition = "(0)"
select spclntion
go top
if !eof()
 lcspclntionCondition = "(0," + str(id_25) + ")"
endif
 * кол-во часов лекций, семинаров, лабораторных
q = "SELECT uvs.sem , sum(uvs.h) as h FROM uchplan u JOIN up_vr_sem uvs ON u.id_10 = uvs.up WHERE uvs.vr in(1,2,3) AND u.shifr = " + str(pshup) + " AND u.spclntion in" + lcspclntionCondition + " GROUP BY uvs.sem"
k = sqlexec(lcn, q, 'numh')
if k <= 0
 aerror(asd)
 messagebox(asd[2])
 return .F.
endif
 * кол-во экзаменов и зачетов
q = "SELECT uks.vk, uks.sem, count(uks.up) as numvk FROM uchplan u JOIN up_k_sem uks ON u.id_10 = uks.up WHERE uks.dopinfo < 128 AND uks.vk in(1,2) AND u.shifr = "  + str(pshup) + " AND u.spclntion in" + lcspclntionCondition + " GROUP BY uks.sem, uks.vk"
k = sqlexec(lcn, q, 'numvk') 
if k <= 0
 aerror(asd)
 messagebox(asd[2])
 return .F.
endif
 * практики 
q = "SELECT id_16, prakt, sem, week FROM planprakt WHERE shifr = " + str(pshup) + " AND spclntion in" + lcspclntionCondition + " and InGraph = 1 ORDER BY id_16"
k = sqlexec(lcn, q, 'pp')
if k <= 0
 aerror(asd)
 messagebox(asd[2])
 return .F.
endif
 * ќпции типового графика
q = "SELECT id_32, kurs, dfpe2, dfpe3, dfpz2, dfpz3, empty1, empty2, empty3, hdstud1, hdstud2, wkan FROM settgrz WHERE shup = " + str(pshup)
k = sqlexec(lcn, q, 'parlist') 
if k <= 0
 aerror(asd)
 messagebox(asd[2])
 return .F.
endif
q = "SELECT srobuch FROM shup WHERE id_14 = " +  str(pshup)
k = sqlexec(lcn, q, 'tmpcurs') 
if k <= 0
 aerror(asd)
 messagebox(asd[2])
 return .F.
endif
select tmpcurs
lcnumsem = srobuch * 2
use
***

Local lcdayfprepe2, lcdayfprepe3, lcdayforpassz2, lcdayforpassz3, lcempty1, lcempty2, lcemty3, lchdstud1, lchdstud2, lcwkan
Local lcdays

for lcsem = 1 to lcnumsem

 * определ€ем параметры
 select parlist
 locate for kurs = (lcsem + 1)/ 2
 lcalldays = 0
 lcnumses = 0
 lcnpp = 0
 if found()
  lcdfprepe2 = dfpe2
  lcdfprepe3 = dfpe3
  lcdfpassz2 = dfpz2
  lcdfpassz3 = dfpz3
  lcempty1 = empty1
  lcempty2 = empty2
  lcempty3 = empty3
  lchdstud1 = hdstud1
  lchdstud2 = hdstud2
  lcwkan = wkan
 else
  lcdfprepe2 = 1
  lcdfprepe3 = 1
  lcdfpassz2 = 1
  lcdfpassz3 = 1
  lcempty1 = 11
  lcempty2 = 10
  lcempty3 = 11
  lchdstud1 = 10
  lchdstud2 = 10
  lcwkan = 9
  q = "INSERT INTO settgrz (kurs,shup)VALUES ("+str((lcsem + 1)/ 2)+","+str(pshup)+")"
  k = sqlexec(lcn, q)
  if k <= 0
   aerror(asd)
   messagebox(asd[2])
   return .F.
  endif
 endif
 

 * 1-€ сесси€
  * теоретические зан€ти€ 
 select numh
 locate for sem = lcsem
 if found()
  lcdays = round(h / lchdstud1, 0)
  select typgrz
  if lcdays > 0
   lcnpp = lcnpp + 1
   lcnumses = lcnumses + 1
   lcalldays = lcalldays + lcdays
   APPEND BLANK
   REPLACE npp WITH lcnpp, kurs WITH (lcsem+1)/2, vr WITH 2, days WITH lcdays
  endif
 endif

 * 2-€ сесси€
  * теоретические зан€ти€
 lcdays = 0
 select numh
 locate for sem = lcsem + 1
 if found()
  lcdays = round(h / lchdstud2, 0)
 endif
  * зачеты
 select numvk
 locate for sem = lcsem AND vk = 1
 if found()
  lcdays = lcdays + lcdfpassz2*numvk
 endif
  * экзамены
 locate for sem = lcsem AND vk = 2
 if found()
  lcdays = lcdays + (lcdfprepe2 + 1)*numvk
 endif
 if lcdays > 0
  lcnpp = lcnpp + 1
  lcnumses = lcnumses + 1
  lcalldays = lcalldays + lcdays
  select typgrz
  APPEND BLANK
  REPLACE npp WITH lcnpp, kurs WITH (lcsem+1)/2, vr WITH 3, days WITH lcdays
 endif

 * 3-€ сесси€
 lcsem = lcsem + 1
 lcdays = 0
 select numvk
  *зачеты
 locate for sem = lcsem AND vk = 1
 if found()
  lcdays = numvk*lcdfpassz3
 endif
 locate for sem = lcsem AND vk = 2
 if found()
  lcdays = lcdays + numvk*(lcdfprepe3 + 1)
 endif
 if lcdays > 0
  lcnpp = lcnpp + 1
  lcnumses = lcnumses + 1
  lcalldays = lcalldays + lcdays
  select typgrz
  APPEND BLANK
  REPLACE npp WITH lcnpp, kurs WITH lcsem/2, vr WITH 4, days WITH lcdays  
 endif

 * практики
 select pp
 go top
 locate for sem = lcsem / 2
 do while found()
  lcnpp = lcnpp + 1
  lcalldays = lcalldays + pp.week*7
  select typgrz
  APPEND BLANK
  REPLACE npp WITH lcnpp, kurs WITH lcsem/2, vr WITH 128 + pp.prakt, days WITH pp.week*7 
  select pp
  continue
 enddo

 * каникулы
 select typgrz
 lcnpp = lcnpp + 1 
 lcalldays = lcalldays + lcwkan*7
 APPEND BLANK 
 REPLACE npp WITH lcnpp, kurs WITH lcsem/2, vr WITH 5, days WITH lcwkan*7

 * теперь добавл€ем пустоты
 lcrest = 52*7 - lcalldays
 if lcrest < 0
  messagebox("«апланировано зан€тий больше чем на год")
 else
  select typgrz 
  if lcnumses = 0
   *единсвенна€ пустота
   UPDATE typgrz SET npp = npp + 1 WHERE npp >= 1 AND kurs = lcsem/2
   APPEND BLANK
   REPLACE npp WITH 1, kurs WITH lcsem/2, vr WITH 1, days WITH lcrest
  endif
  if lcnumses >= 1
   *1-€ пустота
   lcdays = round(lcrest/lcnumses, 0)
   UPDATE typgrz SET npp = npp + 1 WHERE npp >= 1 AND kurs = lcsem/2
   APPEND BLANK
   if lcnumses = 1
    REPLACE npp WITH 1, kurs WITH lcsem/2, vr WITH 1, days WITH lcrest
   else
    REPLACE npp WITH 1, kurs WITH lcsem/2, vr WITH 1, days WITH lcdays
   endif
   if lcnumses >= 2
    *2-€ пустота
    lcrest = lcrest - lcdays
    UPDATE typgrz SET npp = npp + 1 WHERE npp >= 3 AND kurs = lcsem/2
    APPEND BLANK
    if lcnumses = 2
     REPLACE npp WITH 3, kurs WITH lcsem/2, vr WITH 1, days WITH lcrest
    else
     REPLACE npp WITH 3, kurs WITH lcsem/2, vr WITH 1, days WITH lcdays
    endif
    if lcnumses = 3 
     *3-€ пустота
     lcrest = lcrest - lcdays
     UPDATE typgrz SET npp = npp + 1 WHERE npp >= 5 AND kurs = lcsem/2
     APPEND BLANK
     REPLACE npp WITH 5, kurs WITH lcsem/2, vr WITH 1, days WITH lcrest
    endif
   endif
  endif 
 endif

endfor

select numh
use
select pp
use
select numvk
use
select parlist
use
