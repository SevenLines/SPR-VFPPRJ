close tables

PUBLIC UPtbrDesktop
public cur_upd && ������� �� (���)
public cur_upz && ������� �� (���)
public lcn && SQL �����������
public OdbcAlias && ODBC �����
public UserName && ��� ������������
public UserPassword && ������ ������������ :))
public ExcelPath && ���� �� excel
public SysPath && ���� �� �������
public OnlyRasp && ���������� ������ ������ � ���������� (����)
public ListKafs && ������ ������ ��� ���������� ������ � ���������� (����)
public CurYear && ������� ���
public IniPath && ���� � ini-�����
public ReportPath && ���� � �������
public YearBeginDate && ���� ������ �������� ����
public UchZavID && ��� �������� ���������

Local lcf, stroka, versionInfo

versionInfo = "����������"
OnlyRasp = '0'
IF _VFP.StartMode = 0  
 * ��������� ������ ��� ������ �������  
 SysPath = "C:\VFPPRJ\SPR\"
ELSE
 SysPath=SUBSTR(SYS(16,1), 1, RAT("\", SYS(16,1)))
ENDIF

IniPath = SysPath+"SPR.ini"

OdbcAlias = iniread(IniPath,"ODBCALIAS")
UserName = iniread(IniPath,"USERNAME")
UserPassword = iniread(IniPath,"USERPASSWORD")
ExcelPath = iniread(IniPath,"EXCELPATH")
OnlyRasp = iniread(IniPath,"ONLYSCHEDULE")
ListKafs = iniread(IniPath,"LISTKAFS")
versionInfo = iniread(IniPath,"VERSION")
CurYear = iniread(IniPath,"CURYEAR")
ReportPath = iniread(IniPath, "REPORTS")

if empty(ReportPath)
 ReportPath = SysPath + "Reports"
endif

declare integer GenRep IN SysPath+"Classes\GenRep.dll" string @st1, string @st2, string @st3, integer i1 &&, integer i2


CD SysPath+"FreeTables"
SET CLASSLIB TO mygrid
SET CLASSLIB TO vacbrowser ADDITIVE
SET CLASSLIB TO sprclasses ADDITIVE 
SET DATE GERMAN
SET CENTURY OFF
SET MULTILOCKS ON
SET DELETED ON

UPtbrDesktop = CREATEOBJ('uptoolbar')
_screen.caption = "������� ���������� ������ ��� �������������� ���������� [������-"+versionInfo+"]"
_screen.windowstate = 2 
_screen.closable = .T.
do form chooseDC
ON SHUTDOWN DO _0sy1227rs 	IN "MAINMENU.prg" 
read events

DEFINE CLASS rescol AS CHECKBOX
 
 Caption = ""
 autosize = .T.
 BackStyle = 0
 visible = .T.
 
 PROCEDURE KEYPRESS
  LPARAMETERS nKeyCode, nShiftAltCtrl
  
  Local lcfld, lctbl, lcown, lcobj
  if !inlist(nKeyCode, 4, 5, 9, 19, 24)
   lcfld = right(this.parent.controlsource, len(this.parent.controlsource) - AT(".",this.parent.controlsource))
   lctbl = left(this.parent.controlsource, AT(".",this.parent.controlsource))
   lcobj = this.parent.parent.parent.obj
   do form editresprop with lctbl, lcfld, "", lcobj
  endif   
 ENDPROC
ENDDEFINE



