SET SYSMENU TO
SET SYSMENU AUTOMATIC

DEFINE PAD _0sy1227ra OF _MSYSMENU PROMPT "�� �� ���" COLOR SCHEME 3
DEFINE PAD _0sy1227rb OF _MSYSMENU PROMPT "�� �� ���" COLOR SCHEME 3 
DEFINE PAD _0sy1227rc OF _MSYSMENU PROMPT "����������" COLOR SCHEME 3 
DEFINE PAD _0sy1227rd OF _MSYSMENU PROMPT "��������" COLOR SCHEME 3 
DEFINE PAD _0sy1227re OF _MSYSMENU PROMPT "������ � ����������" COLOR SCHEME 3 
DEFINE PAD _0sy1227rf OF _MSYSMENU PROMPT "������ ����������" COLOR SCHEME 3 
DEFINE PAD _0sy1227rg OF _MSYSMENU PROMPT "������" COLOR SCHEME 3 
DEFINE PAD _0sy1227rh OF _MSYSMENU PROMPT "�����" COLOR SCHEME 3 
ON PAD _0sy1227ra OF _MSYSMENU ACTIVATE POPUP �������
ON PAD _0sy1227rb OF _MSYSMENU ACTIVATE POPUP �������
ON PAD _0sy1227rc OF _MSYSMENU ACTIVATE POPUP ����
ON PAD _0sy1227rd OF _MSYSMENU ACTIVATE POPUP ��������
ON PAD _0sy1227re OF _MSYSMENU ACTIVATE POPUP ��������
ON PAD _0sy1227rf OF _MSYSMENU ACTIVATE POPUP �������
ON PAD _0sy1227rg OF _MSYSMENU ACTIVATE POPUP ������
ON SELECTION PAD _0sy1227rh OF _MSYSMENU ;
	DO _0sy1227rs ;
	IN LOCFILE("SPR\PROGRAMS\MAINMENU" ,"MPX;MPR|FXP;PRG" ,"WHERE is MAINMENU?")

* ---- ������� ����� �� ������� ����� �������� ---- * 
DEFINE POPUP ������� MARGIN RELATIVE SHADOW COLOR SCHEME 4 
DEFINE BAR 1 OF ������� PROMPT "������� ����" SKIP FOR OnlyRasp <> '0'
DEFINE BAR 2 OF ������� PROMPT "������� ��" SKIP FOR OnlyRasp <> '0'
DEFINE BAR 3 OF ������� PROMPT "���� �������" SKIP FOR OnlyRasp <> '0'
DEFINE BAR 4 OF ������� PROMPT "������� ������" SKIP FOR OnlyRasp <> '0'
ON BAR 1 OF ������� ACTIVATE POPUP �� 
ON BAR 2 OF ������� ACTIVATE POPUP ��� 
ON BAR 3 OF ������� ACTIVATE POPUP ���� 
ON BAR 4 OF ������� ACTIVATE POPUP ������� 
* --- ������� ���� (���) ---*
DEFINE POPUP �� MARGIN RELATIVE SHADOW COLOR SCHEME 4
DEFINE BAR 1 OF �� PROMPT "�������" 
DEFINE BAR 2 OF �� PROMPT "�����"
DEFINE BAR 3 OF �� PROMPT "�������������" 
DEFINE BAR 4 OF �� PROMPT "���������"
DEFINE BAR 5 OF �� PROMPT "��������"
DEFINE BAR 6 OF �� PROMPT "������ �������"
DEFINE BAR 7 OF �� PROMPT "������� ������"
DEFINE BAR 8 OF �� PROMPT "������"
DEFINE BAR 9 OF �� PROMPT "�������"
DEFINE BAR 10 OF �� PROMPT "�����������"
ON SELECTION BAR 1 OF �� do form chooseup with 1
ON SELECTION BAR 2 OF �� do form createshup 
ON BAR 3 OF �� ACTIVATE POPUP ����������
ON SELECTION BAR 4 OF �� do form zagup with 1
ON SELECTION BAR 5 OF �� do form attrup with 1
ON SELECTION BAR 6 OF �� do form praktgrid with 1
ON SELECTION BAR 7 OF �� do form typgraph with 1
ON SELECTION BAR 8 OF �� do form printupd
ON SELECTION BAR 9 OF �� do form delshup with 1
ON SELECTION BAR 10 OF �� do form copyuppart with 1
* - �������������� �� (���) - *
DEFINE POPUP ���������� MARGIN RELATIVE SHADOW COLOR SCHEME 4
DEFINE BAR 1 OF ���������� PROMPT "�������"
DEFINE BAR 2 OF ���������� PROMPT "���������"
ON SELECTION BAR 1 OF ���������� do form upgrid
ON SELECTION BAR 2 OF ���������� do form editup
* --- ������� ������� ���� (���) --- *
DEFINE POPUP ��� MARGIN RELATIVE SHADOW COLOR SCHEME 4
DEFINE BAR 1 OF ��� PROMPT "�������������"
DEFINE BAR 2 OF ��� PROMPT "������"
ON SELECTION BAR 1 OF ��� do form rupgrid
ON SELECTION BAR 2 OF ��� do form printrup
* --- ������� ���� ������� (���) --- *
DEFINE POPUP ���� MARGIN RELATIVE SHADOW COLOR SCHEME 4
DEFINE BAR 1 OF ���� PROMPT "��������������"
DEFINE BAR 2 OF ���� PROMPT "������"
ON SELECTION BAR 1 OF ���� do form ruppgrid1 with 1
ON SELECTION BAR 2 OF ���� do form printrupp with 1
* --- ������� ������ �������� �������� (���) --- *
DEFINE POPUP ������� MARGIN RELATIVE SHADOW COLOR SCHEME 4
DEFINE BAR 1 OF ������� PROMPT "�������"
DEFINE BAR 2 OF ������� PROMPT "�������������"
DEFINE BAR 3 OF ������� PROMPT "������"
ON SELECTION BAR 1 OF ������� do form rgraphdgrid with 1 
ON SELECTION BAR 2 OF ������� do form rgraphdgrid with 2 
ON SELECTION BAR 3 OF ������� do form printrabgrd

* ---- ������� ����� �� ������� ����� �������� ---- * 
DEFINE POPUP ������� MARGIN RELATIVE SHADOW COLOR SCHEME 4
DEFINE BAR 1 OF ������� PROMPT "������� ����" SKIP FOR OnlyRasp <> '0'
DEFINE BAR 2 OF ������� PROMPT "������� ��" SKIP FOR OnlyRasp <> '0'
DEFINE BAR 3 OF ������� PROMPT "���� �������" SKIP FOR OnlyRasp <> '0'
DEFINE BAR 4 OF ������� PROMPT "������� ������" SKIP FOR OnlyRasp <> '0'
ON BAR 1 OF ������� ACTIVATE POPUP ���
ON BAR 2 OF ������� ACTIVATE POPUP ����
ON BAR 3 OF ������� ACTIVATE POPUP ����� 
ON BAR 4 OF ������� ACTIVATE POPUP ��������
* --- ������� ���� (���) ---*
DEFINE POPUP ��� MARGIN RELATIVE SHADOW COLOR SCHEME 4
DEFINE BAR 1 OF ��� PROMPT "�������"
DEFINE BAR 2 OF ��� PROMPT "�����"
DEFINE BAR 3 OF ��� PROMPT "�������������"
DEFINE BAR 4 OF ��� PROMPT "���������"
DEFINE BAR 5 OF ��� PROMPT "��������"
DEFINE BAR 6 OF ��� PROMPT "������ �������"
DEFINE BAR 7 OF ��� PROMPT "������� ������"
DEFINE BAR 8 OF ��� PROMPT "������"
DEFINE BAR 9 OF ��� PROMPT "�������"
DEFINE BAR 10 OF ��� PROMPT "�����������"
ON SELECTION BAR 1 OF ��� do form chooseup with 2
ON SELECTION BAR 2 OF ��� do form createshupz
ON SELECTION BAR 3 OF ��� do form upzgrid
ON SELECTION BAR 4 OF ��� do form zagup with 2
ON SELECTION BAR 5 OF ��� do form attrup with 2
ON SELECTION BAR 6 OF ��� do form praktgrid with 2
ON SELECTION BAR 7 OF ��� do form typgraph with 2 
ON SELECTION BAR 8 OF ��� do form printupz
ON SELECTION BAR 9 OF ��� do form delshup with 2
ON SELECTION BAR 10 OF ��� do form copyuppart with 2
* --- ������� ������� ���� (���) --- *
DEFINE POPUP ���� MARGIN RELATIVE SHADOW COLOR SCHEME 4
DEFINE BAR 1 OF ���� PROMPT "�������������"
DEFINE BAR 2 OF ���� PROMPT "������"
ON SELECTION BAR 1 OF ���� do form rupzgrid
ON SELECTION BAR 2 OF ���� do form printrupz
* --- ������� ���� ������� (���) --- *
DEFINE POPUP ����� MARGIN RELATIVE SHADOW COLOR SCHEME 4
DEFINE BAR 1 OF ����� PROMPT "�������������"
DEFINE BAR 2 OF ����� PROMPT "������"
ON SELECTION BAR 1 OF ����� do form ruppgrid1 with 2
ON SELECTION BAR 2 OF ����� do form printrupp with 2
* --- ������� ������ �������� �������� (���) --- *
DEFINE POPUP �������� MARGIN RELATIVE SHADOW COLOR SCHEME 4
DEFINE BAR 1 OF �������� PROMPT "�������"
DEFINE BAR 2 OF �������� PROMPT "�������������"
DEFINE BAR 3 OF �������� PROMPT "������"
ON SELECTION BAR 1 OF �������� do form rgraphzgrid with 1 
ON SELECTION BAR 2 OF �������� do form rgraphzgrid with 2 
ON SELECTION BAR 3 OF �������� do form printrabgrz

* ---- ���������� ---- *
DEFINE POPUP ���� MARGIN RELATIVE SHADOW COLOR SCHEME 4
DEFINE BAR 1 OF ���� PROMPT "���� �����������"  
DEFINE BAR 2 OF ���� PROMPT "����������� � ���������������� �����������"  
ON BAR 1 OF ���� ACTIVATE POPUP ��������
ON BAR 2 OF ���� ACTIVATE POPUP �����
* --- ���� ����������� --- *
DEFINE POPUP �������� MARGIN RELATIVE SHADOW COLOR SCHEME 4
DEFINE BAR 1 OF �������� PROMPT "�������"
DEFINE BAR 2 OF �������� PROMPT "���������" 
DEFINE BAR 3 OF �������� PROMPT "������" 
ON SELECTION BAR 1 OF �������� do form kontgrid1
ON SELECTION BAR 2 OF �������� do form editkont
ON SELECTION BAR 3 OF �������� do form printkont
* --- ����������� � ���������������� ����������� --- *
DEFINE POPUP ����� MARGIN RELATIVE SHADOW COLOR SCHEME 4
DEFINE BAR 1 OF ����� PROMPT "�������" SKIP FOR OnlyRasp <> '0'
DEFINE BAR 2 OF ����� PROMPT "��������"
DEFINE BAR 3 OF ����� PROMPT "������������� ����������� �� ���. � ���."
DEFINE BAR 4 OF ����� PROMPT "������"
*DEFINE BAR 4 OF ����� PROMPT "������� (������)"
ON SELECTION BAR 1 OF ����� do form obkont1
ON SELECTION BAR 2 OF ����� do form obkontres1 with 2
ON SELECTION BAR 3 OF ����� do form obkontgrpres 
ON SELECTION BAR 4 OF ����� do form printobkont
*ON SELECTION BAR 4 OF ����� do form obkont

* ---- �������� ---- *
DEFINE POPUP �������� MARGIN RELATIVE SHADOW COLOR SCHEME 4
DEFINE BAR 1 OF �������� PROMPT "����� �������" 
DEFINE BAR 2 OF �������� PROMPT "������" SKIP FOR OnlyRasp <> '0'
DEFINE BAR 3 OF �������� PROMPT "��������" SKIP FOR OnlyRasp <> '0'
DEFINE BAR 4 OF �������� PROMPT "������" SKIP FOR OnlyRasp <> '0'
ON SELECTION BAR 1 OF �������� do form ntgrid
ON SELECTION BAR 2 OF �������� do form calcnagr
ON SELECTION BAR 3 OF �������� do form nagruzka
ON SELECTION BAR 4 OF �������� do form printnagr1

* ---- ������ � ���������� ---- *
DEFINE POPUP �������� MARGIN RELATIVE SHADOW COLOR SCHEME 4
DEFINE BAR 1 OF �������� PROMPT "������������ ������ �� �������������" SKIP FOR OnlyRasp <> '0'
DEFINE BAR 2 OF �������� PROMPT "����������"
DEFINE BAR 3 OF �������� PROMPT "�������������"
DEFINE BAR 4 OF �������� PROMPT "������"
DEFINE BAR 5 OF �������� PROMPT "���������"
ON SELECTION BAR 1 OF �������� do genrn IN LOCFILE("SPR\PROGRAMS\MAINMENU" ,"MPX;MPR|FXP;PRG" ,"WHERE is MAINMENU?")
ON SELECTION BAR 2 OF �������� do form pargridraspnagr with 1
ON SELECTION BAR 3 OF �������� do form raspnagrgrid 
ON SELECTION BAR 4 OF �������� do form printraspnagr
ON BAR 5 OF �������� ACTIVATE POPUP ���������
* --- ��������� --- *
DEFINE POPUP ��������� MARGIN RELATIVE SHADOW COLOR SCHEME 4
DEFINE BAR 1 OF ��������� PROMPT "��������������"
DEFINE BAR 2 OF ��������� PROMPT "���������"
DEFINE BAR 3 OF ��������� PROMPT "�����������"
ON SELECTION BAR 1 OF ��������� do form wishprep
ON SELECTION BAR 2 OF ��������� do form wishaud
ON SELECTION BAR 3 OF ��������� do form wishkont


DEFINE POPUP ������� MARGIN RELATIVE SHADOW COLOR SCHEME 4
DEFINE BAR 1 OF ������� PROMPT "����� ���"
DEFINE BAR 2 OF ������� PROMPT "����� ���"
DEFINE BAR 3 OF ������� PROMPT "������ ���"
DEFINE BAR 4 OF ������� PROMPT "�������� ��������������"
DEFINE BAR 5 OF ������� PROMPT "�������� ���������"
DEFINE BAR 6 OF ������� PROMPT "��������� ����������"
ON SELECTION BAR 1 OF ������� do form printsetrasp with 1
ON SELECTION BAR 2 OF ������� do form printsetraspz
ON SELECTION BAR 3 OF ������� do form printsessia
ON SELECTION BAR 4 OF ������� do form printkartprep
ON SELECTION BAR 5 OF ������� do form printkartaud
ON SELECTION BAR 6 OF ������� do form printraspislog

* ---- ������ ---- *
DEFINE POPUP ������ MARGIN RELATIVE SHADOW COLOR SCHEME 4
DEFINE BAR 1 OF ������ PROMPT "�������"
DEFINE BAR 2 OF ������ PROMPT "��������"
DEFINE BAR 3 OF ������ PROMPT "�������" SKIP FOR OnlyRasp <> '0'
DEFINE BAR 4 OF ������ PROMPT "������/������� ��" SKIP FOR OnlyRasp <> '0'
ON BAR 1 OF ������ ACTIVATE POPUP �������
ON BAR 2 OF ������ ACTIVATE POPUP ���������
ON SELECTION BAR 3 OF ������ do form datautils
ON BAR 4 OF ������ ACTIVATE POPUP ��������
* --- ������� --- *
DEFINE POPUP ������� MARGIN RELATIVE SHADOW COLOR SCHEME 4
DEFINE BAR 1 OF ������� PROMPT "����������" SKIP FOR OnlyRasp <> '0'
DEFINE BAR 2 OF ������� PROMPT "�������" SKIP FOR OnlyRasp <> '0'
DEFINE BAR 3 OF ������� PROMPT "��������" SKIP FOR OnlyRasp <> '0'
DEFINE BAR 4 OF ������� PROMPT "����� ��������" SKIP FOR OnlyRasp <> '0'
DEFINE BAR 5 OF ������� PROMPT "�������" SKIP FOR OnlyRasp <> '0'
DEFINE BAR 6 OF ������� PROMPT "����������" SKIP FOR OnlyRasp <> '0'
DEFINE BAR 7 OF ������� PROMPT "����������� �������" SKIP FOR OnlyRasp <> '0'
DEFINE BAR 8 OF ������� PROMPT "�������������" 
DEFINE BAR 9 OF ������� PROMPT "��������������� ��� ������������� ��������"
DEFINE BAR 10 OF ������� PROMPT "����������� �������������� ���������� � ����������" SKIP FOR OnlyRasp <> '0'
DEFINE BAR 11 OF ������� PROMPT "������������� ��������� �� ��������"
DEFINE BAR 12 OF ������� PROMPT "���������"
DEFINE BAR 13 OF ������� PROMPT "����������"
DEFINE BAR 14 OF ������� PROMPT "���������� �������"
ON SELECTION BAR 1 OF ������� do form editpred &&editvac with "�������������� ������� ���������", "�������", "vacpred", "id_15", "pred"
ON SELECTION BAR 2 OF ������� do form editvac with "�������������� ������� ������", "�������", "vackaf", "id_17", "kaf"
ON SELECTION BAR 3 OF ������� do form editvacprakt && editvac with "�������������� ������� �������", "��������", "vacprakt", "id_24", "prakt"
*ON SELECTION BAR 4 OF ������� do form editvac with "�������������� ������� ���� ��������", "����� ��������", "vacfobuch", "id_3", "fobuch"
ON SELECTION BAR 4 OF ������� do form editvacfobuch
*ON SELECTION BAR 5 OF ������� do form editvac with "�������������� ������� ��������", "������", "vacfil", "id_4", "fil"
ON SELECTION BAR 5 OF ������� do form editvacfil
ON SELECTION BAR 6 OF ������� do form editvac with "�������������� ������� �����������", "���������", "vacfac", "id_5", "fac"
ON SELECTION BAR 7 OF ������� do form editvac with "�������������� ������� ����������� �������", "�����������", "vacaobozn", "id_6", "aobozn"
ON SELECTION BAR 8 OF ������� do form prepgrid &&editvac with "�������������� ������� ��������������", "�������������", "prepods", "id_61", "preps"
ON SELECTION BAR 9 OF ������� do form rnprepods
ON SELECTION BAR 10 OF ������� do form raspprep
ON SELECTION BAR 11 OF ������� do form rnaud
ON SELECTION BAR 12 OF ������� do form audgrid &&editvac with "�������������� ������� ���������", "���������", "auditories", "id_60", "obozn"
ON SELECTION BAR 13 OF ������� do form editvac with "�������������� ������� �����������", "���������", "vacdisp", "id_75", "disp"
ON SELECTION BAR 14 OF ������� do form editvacpara
* --- ��������� --- *
DEFINE POPUP ��������� MARGIN RELATIVE SHADOW COLOR SCHEME 4
DEFINE BAR 1 OF ��������� PROMPT "���� ������ �������� ����" SKIP FOR OnlyRasp <> '0'
DEFINE BAR 3 OF ��������� PROMPT "������� ���������" SKIP FOR OnlyRasp <> '0'
DEFINE BAR 4 OF ��������� PROMPT "������ � ������ ���� �������" SKIP FOR OnlyRasp <> '0'
DEFINE BAR 5 OF ��������� PROMPT "������� �����������"
ON SELECTION BAR 1 OF ��������� do form editbegyear
ON SELECTION BAR 3 OF ��������� do form edituchzav
ON SELECTION BAR 4 OF ��������� do form editkafopts
ON BAR 5 OF ��������� ACTIVATE POPUP ������������������
* --- ������/������� ��*
DEFINE POPUP �������� MARGIN RELATIVE SHADOW COLOR SCHEME 4
DEFINE BAR 1 OF �������� PROMPT "������� � ������ ��� �������"
DEFINE BAR 2 OF �������� PROMPT "������ � ���� ������"
ON SELECTION BAR 1 OF �������� do form importdata
ON SELECTION BAR 2 OF �������� do form exportdata
* -- ������� ����������� -- *
DEFINE POPUP ������������������ MARGIN RELATIVE SHADOW COLOR SCHEME 4
DEFINE BAR 1 OF ������������������ PROMPT "���������"
DEFINE BAR 2 OF ������������������ PROMPT "�������������"
DEFINE BAR 3 OF ������������������ PROMPT "����������"
ON SELECTION BAR 1 OF ������������������ do form resgrid with 1
ON SELECTION BAR 2 OF ������������������ do form resgrid with 2
ON SELECTION BAR 3 OF ������������������ do form resgrid with 3

PROCEDURE _0sy1227rs
 iniwrite(IniPath,"Reports",ReportPath)
 if type('lcn')='N'
  if lcn  > 0 
   q = "UPDATE sysoptions SET upd="+str(cur_upd)+", upz="+str(cur_upz)
   k = sqlexec(lcn, q)
   if k <= 0
    aerror(asd)
    messagebox(asd[2])
   endif
   
   sqldisconnect(lcn)
  endif
 endif
 release UPtbrDesktop
 release lcn
 release all
 set sysmenu to default
* _screen.closable = .T.
 clear events
 IF _VFP.StartMode = 0  
  * ��������� ������ ��� ������ �������  
  ON SHUTDOWN
 ELSE  
  QUIT
  * ��������� ������ ��� �������� ����������  
 ENDIF
ENDPROC

PROCEDURE genrn
 Local q, k
 
 if messagebox("�� ������������� ������ ������������ ������ � ����������?" ,4)=6
  q = "EXEC genraspnagr1 " + CurYear
  WAIT WINDOW "��� �������� ����� ����������� ���������� �������..." NOWAIT 
  k = sqlexec(lcn, q)
  if k <= 0
   aerror(asd)
   messagebox(asd[2])
   return .F.
  endif

  do form raspnagrgrid
 endif 
ENDPROC

PROCEDURE facres
 LParameters pView
 
 Local pMainSQL, pLGSQL, pRGSQL, pLGView, pRGView, pscSQLTable, pscVFPid, pscSQLid, pscVFPFields, pscSQLFields,	pLabelCaption, pFormCaption

 if pView = 1
  pMainSQL = "select id_5 id_,fac from vacfac order by fac"
  pLGSQL = "SELECT a.obozn,f.*,k.korp "+;
			"FROM audfac f "+;
			 "LEFT JOIN auditories a ON f.aud=a.id_60 "+;
			 "LEFT JOIN vackorp k ON k.id_67=a.korp "+;
			"WHERE f.fac=$fac "+;
			"ORDER BY k.korp,a.obozn"
  pRGSQL = "SELECT a.id_60 aud,a.obozn,$fac fac,k.korp "+;
			"FROM auditories a "+;
			 "LEFT JOIN audfac f ON f.aud=a.id_60 and f.fac=$fac "+;
			 "LEFT JOIN vackorp k ON k.id_67=a.korp "+;
			"WHERE f.fac is NULL "+;
			"ORDER BY k.korp,a.obozn"
  pLGView = "obozn,���������,100;korp,������,50"
  pRGView = "obozn,���������,100;korp,������,50"
  pscSQLTable = "audfac"
  pscVFPid = "id_76"
  pscSQLid = "id_76"
  pscVFPFields = "fac,aud"
  pscSQLFields = "fac,aud"
  pLabelCaption = "���������"
  pFormCaption = ""
 endif
 if pView = 2
  pMainSQL = "select id_5 id_,fac from vacfac order by fac"
  pLGSQL = "SELECT p.preps,f.* "+;
			"FROM prepfac f "+;
			 "LEFT JOIN prepods p ON f.prep=p.id_61 "+;
			"WHERE f.fac=$fac "+;
			"ORDER BY p.preps"
  pRGSQL = "SELECT p.id_61 prep,p.preps,$fac fac "+;
			"FROM prepods p "+;
			 "LEFT JOIN prepfac f ON f.prep=p.id_61 and f.fac=$fac "+;
			"WHERE f.fac is NULL "+;
			"ORDER BY p.preps"
  pLGView = "preps,�������������,100"
  pRGView = "preps,�������������,100"
  pscSQLTable = "prepfac"
  pscVFPid = "id_77"
  pscSQLid = "id_77"
  pscVFPFields = "fac,prep"
  pscSQLFields = "fac,prep"
  pLabelCaption = "���������"
  pFormCaption = ""
 endif
 if pView = 3
  pMainSQL = "select id_75 id_,disp from vacdisp order by disp"
  pLGSQL = "SELECT vf.fac facult,f.* "+;
			"FROM dispfac f "+;
			 "LEFT JOIN vacfac vf ON f.fac=vf.id_5 "+;
			"WHERE f.disp=$fac "+;
			"ORDER BY vf.fac"
  pRGSQL = "SELECT vf.id_5 fac,vf.fac facult,$fac disp "+;
			"FROM vacfac vf "+;
			 "LEFT JOIN dispfac f ON f.fac=vf.id_5 and f.disp=$fac "+;
			"WHERE f.fac is NULL "+;
			"ORDER BY vf.fac"
  pLGView = "facult,���������,100"
  pRGView = "facult,���������,100"
  pscSQLTable = "dispfac"
  pscVFPid = "id_78"
  pscSQLid = "id_78"
  pscVFPFields = "fac,disp"
  pscSQLFields = "fac,disp"
  pLabelCaption = "����������"
  pFormCaption = ""
 endif

 do form lrgform with pMainSQL, pLGSQL, pRGSQL, pLGView, pRGView, pscSQLTable, pscVFPid, pscSQLid, pscVFPFields, pscSQLFields, pLabelCaption, pFormCaption
ENDPROC


