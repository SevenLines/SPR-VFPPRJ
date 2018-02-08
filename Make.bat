set TEMP_FOLDER="C:\VFPPRJ\TEMP\SPR\"
set COMMONSETUP_FOLDER="C:\VFPPRJ\RELEASE\SETUP\"
set JAR_COMMAND="C:\VFPPRJ\RELEASE\SETUP\7zip.exe"
set ZIP_COMMAND="C:\Program Files\7-zip\7z.exe"
set DISTR_FOLDER="C:\VFPPRJ\RELEASE\JD\“αβ ­®Άª  ‘„+\"
set DISTR_FILEPATH="C:\VFPPRJ\RELEASE\JD\“αβ ­®Άª  ‘„+.exe"


call makeTempArch.bat
rem cd C:\VFPPRJ\SPR\
rem call makeDistr1.bat
cd C:\VFPPRJ\SPR\
call makeDistr2.bat
cd C:\VFPPRJ\SPR\
call makeDistr3.bat


cd %TEMP_FOLDER%
cd ..\
del /F /Q .\SPR.jar

rd /S /Q %TEMP_FOLDER% 