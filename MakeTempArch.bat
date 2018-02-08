echo **********COPYING program files into TEMP directory...
mkdir %TEMP_FOLDER% 
xcopy *.exe %TEMP_FOLDER% /Y 
xcopy *.ini %TEMP_FOLDER% /Y 

del /F /Q .\FreeTables\_*.*
del /F /Q .\FreeTables\*.tmp
del /F /Q .\FreeTables\*.bak 
xcopy .\FreeTables\*.dbf %TEMP_FOLDER%"FreeTables\" /Y
xcopy .\FreeTables\*.fpt %TEMP_FOLDER%"FreeTables\" /Y

xcopy .\Templates %TEMP_FOLDER%"Templates\" /Y

del /F /Q .\Reports\*.* 
mkdir %TEMP_FOLDER%"Reports\" 
xcopy %COMMONSETUP_FOLDER%"vfp6r.dll" %TEMP_FOLDER% /Y
xcopy %COMMONSETUP_FOLDER%"vfp6renu.dll" %TEMP_FOLDER% /Y

mkdir %TEMP_FOLDER%"Classes\" 
xcopy %COMMONSETUP_FOLDER%"GenRep_new.dll" %TEMP_FOLDER%"Classes\" /Y
xcopy %COMMONSETUP_FOLDER%"GenRep_old.dll" %TEMP_FOLDER%"Classes\" /Y
xcopy %COMMONSETUP_FOLDER%"mscal.ocx" %TEMP_FOLDER%"Classes\" /Y


echo **********ARCHIVING TEMP directory ...
cd %TEMP_FOLDER%
cd ..\
%JAR_COMMAND% a -r SPR.jar SPR\*


