Lparameters pshup

Local q, k
Local lcdayforprepo, lcdayforprepov, lczkan
Local lcsem, lcnumsem
Local lcnpp, lcdayekz, lcrest , lcalldays, lcdays

* ������� ������� ������ ��� (����� ������ ������� ������� typgrd)

CREATE TABLE typgrd (npp N(4), kurs N(4), vr N(4), days N(4))

*** �������� ������ ��� �������
q = "SELECT sem, w FROM up_w_sem WHERE shup = " +  str(pshup) 
k = sqlexec(lcn, q, 'uws')
if k <= 0
 aerror(asd)
 messagebox(asd[2])
 return .F.
endif
q = "SELECT prakt, sem, week, min(structidx) structidx "+;
	"FROM planprakt "+;
	"WHERE shifr="+str(pshup)+" "+;
		"and InGraph = 1 "+;
	"GROUP BY prakt, sem, week"
k = sqlexec(lcn, q, 'tmpcurs')
if k <= 0
 aerror(asd)
 messagebox(asd[2])
 return .F.
endif

SELECT * FROM tmpcurs INTO CURSOR 'pp' ORDER BY structidx
select tmpcurs
use

q = "SELECT sum(t1.numekz) numekz, t1.sem "+;
	"FROM "+;
	"( "+;
		"SELECT count(uks.vk) as numekz, uks.sem "+;
		"FROM uchplan u "+;
			"JOIN up_k_sem uks ON u.id_10 = uks.up "+;
		"WHERE u.spclntion=0 and uks.dopinfo < 128 AND uks.vk = 2 AND u.shifr="+str(pshup)+" "+;
		"GROUP BY uks.sem, uks.vk, u.spclntion "+;
		"UNION "+;
		"SELECT max(t.numekz) numekz, t.sem "+;
		"FROM (select count(uks.vk) as numekz, uks.sem, u.spclntion "+;
				"from uchplan u "+;
				"join up_k_sem uks ON u.id_10 = uks.up "+;
			"where uks.dopinfo < 128 AND uks.vk = 2 AND u.shifr="+str(pshup)+" and u.spclntion>0 "+;
			"group by uks.sem, uks.vk, u.spclntion) t "+;
		"GROUP BY t.sem "+;
	") t1 "+;
	"GROUP BY t1.sem"
k = sqlexec(lcn, q, 'numekz')
if k <= 0
 aerror(asd)
 messagebox(asd[2])
 return .F.
endif

q = "SELECT kurs, dfpo, dfpv, zkan FROM settgrd WHERE shup = " + str(pshup)
k = sqlexec(lcn, q, 'parlist')
if k <= 0
 aerror(asd)
 messagebox(asd[2])
 return .F.
endif
select parlist
q = "SELECT srobuch FROM shup WHERE id_14 = " + str(pshup)
k = sqlexec(lcn, q, 'tmpcurs')
if k <= 0
 aerror(asd)
 messagebox(asd[2])
 return .F.
endif
select tmpcurs
lcnumsem = srobuch*2
use
***
for lcsem = 1 to lcnumsem

 * ���������� ���������
 select parlist
 locate for kurs = (lcsem + 1)/2
 if found()
  lczkan = zkan
  lcdayforprepo = dfpo
  lcdayforprepv = dfpv
 else
  lczkan = 2
  lcdayforprepo = 1
  lcdayforprepv = 1
  q = "INSERT INTO settgrd (kurs, dfpo, dfpv, zkan, shup) VALUES ("+str((lcsem + 1)/2)+",1,1,2,"+str(pshup)+")"
  k = sqlexec(lcn, q)
  if k <= 0
   aerror(asd)
   messagebox(asd[2])
   return .F.
  endif
 endif

 lcalldays = 0
 * ������� �������
 * ������������� ��������
 lcnpp = 0
 select uws
 locate for sem = lcsem
 if found()
  lcdays = uws.w*7
  if lcdays > 0
   lcnpp = lcnpp + 1
   select typgrd
   APPEND BLANK
   REPLACE npp WITH lcnpp, kurs WITH (lcsem+1)/2, vr WITH 1, days WITH lcdays
  endif
  lcalldays = lcdays
 endif
 * ������
 select numekz
 locate for sem = lcsem
 if found()
  lcdayekz = numekz.numekz*(lcdayforprepo+1)
  * ���������� 
  lcrest = lcdayekz % 7
  if (lcrest >= 0)AND(lcrest < 3)
   lcdayekz = lcdayekz - lcrest
  endif
  if lcrest > 3
   lcdayekz = lcdayekz + 7 - lcrest
  endif
  if lcdayekz > 0
   lcnpp = lcnpp + 1
   select typgrd
   APPEND BLANK
   REPLACE npp WITH lcnpp, kurs WITH (lcsem+1)/2, vr WITH 2, days WITH lcdayekz
  endif
  lcalldays = lcalldays + lcdayekz
 endif
 * ��������
 select pp
 go top
 locate for sem = lcsem
 do while found()
  lcdays = pp.week*7
  if lcdays > 0
   lcnpp = lcnpp + 1
   select typgrd
   APPEND BLANK
   REPLACE npp WITH lcnpp, kurs WITH (lcsem+1)/2, vr WITH 128 + pp.prakt, days WITH lcdays
  endif 
  lcalldays = lcalldays + lcdays
  select pp
  continue
 enddo
 * ������ ��������
 lcdays = 7*lczkan 
 if lcdays > 0
  lcnpp = lcnpp + 1
  select typgrd
  APPEND BLANK
  REPLACE npp WITH lcnpp, kurs WITH (lcsem+1)/2, vr WITH 3, days WITH lcdays
 endif
 lcalldays = lcalldays + lcdays
 
 * �������� �������
 lcsem = lcsem + 1
 * ������������� ��������
 select uws
 locate for sem = lcsem
 if found()
  lcdays = uws.w*7
  if lcdays > 0
   lcnpp = lcnpp + 1
   select typgrd
   APPEND BLANK
   REPLACE npp WITH lcnpp, kurs WITH lcsem/2, vr WITH 4, days WITH lcdays
  endif
  lcalldays = lcalldays + lcdays
 endif
 * ������
 select numekz
 locate for sem = lcsem
 if found()
  lcdayekz = numekz.numekz*(lcdayforprepv + 1)
  * ���������� 
  lcrest = lcdayekz % 7
  if (lcrest >= 0)AND(lcrest < 3)
   lcdayekz = lcdayekz - lcrest
  endif
  if lcrest > 3
   lcdayekz = lcdayekz + 7 - lcrest
  endif
  if lcdayekz > 0
   lcnpp = lcnpp + 1
   select typgrd
   APPEND BLANK
   REPLACE npp WITH lcnpp, kurs WITH lcsem/2, vr WITH 5, days WITH lcdayekz
  endif
  lcalldays = lcalldays + lcdayekz
 endif
 * ���������
 select pp
 go top
 locate for sem = lcsem
 do while found()
  lcdays = pp.week*7 
  if lcdays > 0
   lcnpp = lcnpp + 1
   select typgrd
   APPEND BLANK
   REPLACE npp WITH lcnpp, kurs WITH lcsem/2, vr WITH 128 + pp.prakt, days WITH lcdays
  endif
  lcalldays = lcalldays + lcdays
  select pp
  continue
 enddo
 * ��������
 lcdays = 52*7 - lcalldays
 lcnpp = lcnpp + 1
 select typgrd
 APPEND BLANK
 if lcdays > 0
  REPLACE npp WITH lcnpp, kurs WITH lcsem/2, vr WITH 6, days WITH lcdays
 else
  REPLACE npp WITH lcnpp, kurs WITH lcsem/2, vr WITH 6, days WITH 0  
 endif
endfor

select uws
use
select pp
use
select numekz
use
select parlist 
use
