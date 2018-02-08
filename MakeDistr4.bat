set DISTR_FOLDER="C:\VFPPRJ\RELEASE\MVD\“αβ ­®Άª  ‘„+\"
set DISTR_FILEPATH="C:\VFPPRJ\RELEASE\MVD\setup SPD+.exe"

cd %TEMP_FOLDER%
cd ..\
xcopy /Y .\SPR.jar %DISTR_FOLDER% 

echo **********MAKING main archive...
xcopy %COMMONSETUP_FOLDER%"7zip.exe" %DISTR_FOLDER% /Y
xcopy %COMMONSETUP_FOLDER%"vfpodbc.msi" %DISTR_FOLDER% /Y
xcopy %COMMONSETUP_FOLDER%"setup_SPR.exe" %DISTR_FOLDER% /Y
rem xcopy %COMMONSETUP_FOLDER%"odbc32.lib" %DISTR_FOLDER% /Y
rem xcopy %COMMONSETUP_FOLDER%"odbccp32.lib" %DISTR_FOLDER% /Y


echo **********ARCHIVING main archive...
cd %DISTR_FOLDER%
%ZIP_COMMAND% a  ..\SPR.zip
copy /B %COMMONSETUP_FOLDER%\7zS.sfx + %COMMONSETUP_FOLDER%\config.txt + ..\SPR.zip %DISTR_FILEPATH%

echo **********CLEAR temporary files...
del /F /Q %DISTR_FOLDER%"7zip.exe"
del /F /Q %DISTR_FOLDER%"vfpodbc.msi"
del /F /Q %DISTR_FOLDER%"setup_SPR.exe"
del /F /Q %DISTR_FOLDER%"SPR.jar"
del ..\SPR.zip
